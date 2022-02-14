import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey_app/layout/cubit/todoey_cubit.dart';
import 'package:todoey_app/layout/cubit/todoey_state.dart';
import 'package:todoey_app/layout/todey_layout.dart';
import 'package:todoey_app/module/login/login_screen.dart';
import 'package:todoey_app/module/on_boarding/on_boarding_screen.dart';
import 'package:todoey_app/module/register/cubit/register_cubit.dart';
import 'package:todoey_app/module/register/cubit/register_state.dart';
import 'package:todoey_app/module/register/register_screen.dart';
import 'package:todoey_app/shared/bloc_observer.dart';
import 'package:todoey_app/shared/components/components.dart';
import 'package:todoey_app/shared/components/constants.dart';
import 'package:todoey_app/shared/network/local/cache_helper.dart';
import 'package:todoey_app/shared/network/remote/dio_helper.dart';
import 'package:todoey_app/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();

  Widget? startWidget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoaring');
  token = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    if (token != null) {
      startWidget = const TodoeyLayout();
    } else {
      startWidget = LoginScreen();
    }
  } else {
    startWidget = OnBoardingScreen();
  }

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(startWidget));
    },
    blocObserver: MyBlocObserver(),
  );

  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  MyApp(this.startWidget);

  final startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=> TodeoyCubit(),
      child: BlocConsumer<TodeoyCubit,TodoeyStates>(
        listener: (BuildContext context, state){},
        builder:(BuildContext context, state){
          return  MaterialApp(
            theme: darkTheme,
            home: startWidget,
          );
        },

      ),
    );
  }
}
