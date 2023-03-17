import 'package:flutter/material.dart';
import 'package:time_tracker/data/resources/mappers/login_mapper.dart';
import 'package:time_tracker/domain/entities/login_input.dart';
import 'package:time_tracker/domain/entities/login_output.dart';

import '../../data/errors/http_error.dart';
import '../../data/resources/remote_data_resource.dart';
import '../errors/domain_error.dart';
import 'app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  AppRepositoryImpl({required this.remoteDataResource});

  final RemoteDataResource remoteDataResource;

  @override
  Future<LoginOutput> loginWithGoogle(LoginInput input) async {
    try {
      final response = await remoteDataResource.login(input.toDto());
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError();
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
