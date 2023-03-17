import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_tracker/constants/constant.dart';
import 'package:time_tracker/core/shared_preference_keys.dart';

import '../data/errors/http_error.dart';

class NetworkManager {
  final Dio _dio = Dio(BaseOptions(
    sendTimeout: 20 * 1000,
    receiveTimeout: 20 * 1000,
    connectTimeout: 20 * 1000,
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
  ));

  NetworkManager() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Note: Open this block to use with Authentication and Authorization
        // final sharedPref = await SharedPreferences.getInstance();
        // options.headers["Authorization"] =
        //     "Bearer ${sharedPref.getString(SharedPreferencesKeys.refreshToken)}";
        return handler.next(options);
      },
      onError: (e, handler) async {
        //Token overdue
        if (e.response?.statusCode == 401) {
          if (!e.requestOptions.path.contains("refresh")) {
            if (await refreshToken()) {
              handler.resolve(await _retry(e.requestOptions));
            } else {
              handler.reject(DioError(
                  requestOptions: e.requestOptions, type: DioErrorType.other));
            }
            //Refresh token overdue
          } else {
            handler.reject(DioError(
                requestOptions: e.requestOptions, type: DioErrorType.other));
          }
        } else {
          handler.reject(e);
        }
      },
    ));

    _dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options =
        Options(method: requestOptions.method, headers: requestOptions.headers);

    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<bool> refreshToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final refreshToken =
        sharedPref.getString(SharedPreferencesKeys.refreshToken);
    final response = await _dio
        .request('auth/refresh', data: {'refreshToken': refreshToken});

    if (response.statusCode == 201) {
      final sharedPref = await SharedPreferences.getInstance();
      sharedPref.setString(SharedPreferencesKeys.token, response.data);
      return true;
    } else {
      sharedPref.remove(SharedPreferencesKeys.token);
      return false;
    }
  }

  Future<T?> request<T>(
    RequestMethod requestMethod,
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      late final Future<Response<T>> futureResponse = _dio.request(url,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            method: requestMethod.value,
            headers: headers,
            validateStatus: (status) {
              return status! < 500;
            },
          ));

      final response = await futureResponse;
      return _handleResponse(response);
    } on DioError catch (e) {
      if (e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.sendTimeout) {
        throw HttpError.timeOut();
      } else if (e.type == DioErrorType.other && url.contains("refresh")) {
        //Default other means refresh token is overdue;
        throw HttpError.unauthorizedRefreshToken();
      } else {
        throw HttpError.serverError();
      }
    } on HttpError catch (_) {
      rethrow;
    }
  }

  T? _handleResponse<T>(Response<T> response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else if (response.statusCode == 204) {
      return response.data;
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest();
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized();
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden();
    } else if (response.statusCode == 404) {
      throw HttpError.notFound();
    } else if (response.statusCode == 422) {
      throw HttpError.invalidData();
    } else {
      throw HttpError.serverError();
    }
  }
}

enum RequestMethod { get, post, patch, update, delete }

extension RequestMethodX on RequestMethod {
  String get value => toString().split('.').last.toUpperCase();
}
