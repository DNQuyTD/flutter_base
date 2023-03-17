import 'package:time_tracker/data/resources/models/login_request.dart';
import 'package:time_tracker/data/resources/models/login_response.dart';
import 'package:time_tracker/domain/entities/login_input.dart';
import 'package:time_tracker/domain/entities/login_output.dart';

extension LoginResponseX on LoginResponse {
  LoginOutput toEntity() {
    return LoginOutput(refreshToken: refreshToken, token: token);
  }
}

extension LoginRequestX on LoginInput {
  LoginRequest toDto() {
    return LoginRequest(email, password);
  }
}
