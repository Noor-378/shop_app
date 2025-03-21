import 'package:shop_app/models/login_model/login_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel? loginModel;
  LoginSuccessState({required this.loginModel});
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(
    this.error,
  );
}

class ChangePasswordVisibilityState extends LoginState {}
