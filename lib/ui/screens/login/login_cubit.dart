import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/usecases/login_usecase.dart';
import 'package:time_tracker/ui/screens/login/login_bloc_state.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';

class LoginCubit extends Cubit<LoginBlocState> {
  LoginCubit(this._loginUseCase) : super(LoginBlocState.initial());

  final LoginUseCase _loginUseCase;

  void signIn(String email, String password) async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.loading));
      await _loginUseCase
          .call(LoginUseCaseParams(email: email, password: password));
      emit(state.copyWith(loginStatus: LoginStatus.loadSuccess));
    } on DomainError catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
