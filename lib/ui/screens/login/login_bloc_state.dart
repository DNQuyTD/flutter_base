import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/error_handling/error_object.dart';

part 'login_bloc_state.freezed.dart';

enum LoginStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

@freezed
class LoginBlocState with _$LoginBlocState {
  const factory LoginBlocState({
    required String emailAddress,
    required String password,
    required ErrorObject? errorObject,
    required LoginStatus loginStatus,
  }) = _LoginBlocState;

  factory LoginBlocState.initial() => const LoginBlocState(
    emailAddress: '',
    password: '',
    errorObject: null,
    loginStatus: LoginStatus.initial,
  );
}