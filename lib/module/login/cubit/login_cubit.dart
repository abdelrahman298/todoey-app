import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey_app/model/login_model.dart';
import 'package:todoey_app/model/user_model.dart';
import 'package:todoey_app/module/login/cubit/login_state.dart';
import 'package:todoey_app/module/login/login_screen.dart';
import 'package:todoey_app/shared/components/components.dart';
import 'package:todoey_app/shared/network/end_point.dart';
import 'package:todoey_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? userModel;

  void loginUserData({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      userModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

}
