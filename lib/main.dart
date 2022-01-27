import 'package:flutter/material.dart';
import 'package:todoey_app/module/on_boarding/on_boarding_screen.dart';
import 'package:todoey_app/module/register/register_screen.dart';
import 'package:todoey_app/shared/network/local/cache_helper.dart';
import 'package:todoey_app/shared/styles/themes.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  Widget? startWidget;
  bool onBoarding= CacheHelper.getData(key: 'onBoaring');
  if(onBoarding == true){
    startWidget = RegisterScreen();
  }else{
    startWidget =  OnBoardingScreen();
  }
  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  MyApp(this.startWidget);
  final  startWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home:  startWidget,
    );
  }
}
