import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/login_screen/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  void userLogin(){}
}
