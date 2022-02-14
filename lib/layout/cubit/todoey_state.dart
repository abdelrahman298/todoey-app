import 'package:todoey_app/model/login_model.dart';

abstract class TodoeyStates {}

class TodoeyInitialState extends TodoeyStates {}

class TodoeyLoadingState extends TodoeyStates {}

class TodoeySuccessState extends TodoeyStates {
}

class TodoeyErrorState extends TodoeyStates {
  final String? error;
  TodoeyErrorState(this.error);
}




class TodoeySignOutState extends TodoeyStates {}
