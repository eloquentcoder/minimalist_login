import 'package:bloc/bloc.dart';

import 'auth_repository.dart';
import 'exception.dart';
import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc(this.auth) : super(InitialLogin());

  final AuthRepository auth;

  void login(String email, String password) async {
    emit(LoginLoading());
    final response = await auth.doLogin(email, password);
    if (response is AppException) {
      emit(LoginError(error: response.toString()));
    } else {
      emit(LoginSuccess());
    }
  }
}
