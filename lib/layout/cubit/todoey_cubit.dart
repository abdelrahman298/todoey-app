import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey_app/layout/cubit/todoey_state.dart';
import 'package:todoey_app/model/login_model.dart';
import 'package:todoey_app/model/user_model.dart';
import 'package:todoey_app/module/login/login_screen.dart';
import 'package:todoey_app/shared/components/components.dart';
import 'package:todoey_app/shared/components/constants.dart';
import 'package:todoey_app/shared/network/end_point.dart';
import 'package:todoey_app/shared/network/local/cache_helper.dart';
import 'package:todoey_app/shared/network/remote/dio_helper.dart';

class TodeoyCubit extends Cubit<TodoeyStates> {
  TodeoyCubit() : super(TodoeyInitialState());

  static TodeoyCubit get(context) => BlocProvider.of(context);



  void signOut(context){
    CacheHelper.removeData(key: 'token').then((value) {
      navigateAndFinish(context, LoginScreen());
      emit(TodoeySignOutState());
    });
  }

}
