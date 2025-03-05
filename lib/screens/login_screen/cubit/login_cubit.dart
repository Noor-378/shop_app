import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/login_screen/cubit/login_state.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        LoginErrorState(error.toString()),
      );
    });
  }
}
