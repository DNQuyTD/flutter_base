import 'package:time_tracker/domain/entities/login_input.dart';
import 'package:time_tracker/domain/entities/login_output.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../repositories/app_repository.dart';

class LoginUseCase extends UseCase<LoginOutput, LoginUseCaseParams> {
  final AppRepository repository;

  const LoginUseCase(this.repository);

  @override
  Future<LoginOutput> call(LoginUseCaseParams params) {
    return repository.loginWithGoogle(
        LoginInput(email: params.email, password: params.password));
  }
}

class LoginUseCaseParams {
  const LoginUseCaseParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
