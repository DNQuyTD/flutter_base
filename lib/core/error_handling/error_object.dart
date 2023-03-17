import 'package:equatable/equatable.dart';
import 'package:time_tracker/base/errors/api_error.dart';
import 'package:time_tracker/base/errors/no_connection_error.dart';
import 'package:time_tracker/base/errors/time_out_error.dart';
import 'package:time_tracker/base/errors/unauthorized_error.dart';
import 'package:time_tracker/base/errors/unauthorized_refresh_token_error.dart';

import '../../base/errors/invalid_data_error.dart';
import '../../base/errors/not_found_error.dart';
import '../../domain/errors/domain_error.dart';

class ErrorObject extends Equatable {
  const ErrorObject({
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  List<Object?> get props => [title, message];

  /// Again, here I leverage the power of sealed_classes to write robust code and
  /// make sure to map evey and each failure with a specific message to show in
  /// the UI.
  static ErrorObject mapErrorToErrorObject({required DomainError error}) {
    switch (error.runtimeType) {
      case ApiError:
        return const ErrorObject(
          title: 'Error Code: ApiError',
          message: 'ApiError',
        );
      case InvalidDataError:
        return const ErrorObject(
          title: 'Error Code: InvalidDataError',
          message: 'InvalidDataError',
        );
      case NoConnectionError:
        return const ErrorObject(
          title: 'Error Code: NoConnectionError',
          message: 'NoConnectionError',
        );
      case NotFoundError:
        return const ErrorObject(
          title: 'Error Code: NotFoundError',
          message: 'NotFoundError',
        );
      case TimeOutError:
        return const ErrorObject(
          title: 'Error Code: TimeOutError',
          message: 'TimeOutError',
        );
      case UnauthorizedError:
        return const ErrorObject(
          title: 'Error Code: UnauthorizedError',
          message: 'UnauthorizedError',
        );
      case UnauthorizedRefreshTokenError:
        return const ErrorObject(
          title: 'Error Code: UnauthorizedRefreshTokenError',
          message: 'UnauthorizedRefreshTokenError',
        );
      default:
        return const ErrorObject(
          title: 'Error Code: INTERNAL_SERVER_FAILURE',
          message:
          'It seems that the server is not reachable at the moment 1, try '
              'again later, should the issue persist please reach out to the '
              'developer at a@b.com',
        );
    }
  }
}