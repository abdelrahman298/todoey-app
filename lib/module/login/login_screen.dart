import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey_app/layout/todey_layout.dart';
import 'package:todoey_app/module/login/cubit/login_cubit.dart';
import 'package:todoey_app/module/login/cubit/login_state.dart';
import 'package:todoey_app/module/register/register_screen.dart';
import 'package:todoey_app/shared/components/components.dart';
import 'package:todoey_app/shared/components/constants.dart';
import 'package:todoey_app/shared/network/local/cache_helper.dart';
import 'package:todoey_app/shared/styles/colors.dart';
import 'package:todoey_app/shared/styles/icon_broken.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (buildContext) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel!.status!) {
              //هسجل التوكين فى الستريننج اللى عامله فى ال
              //constant
              //عشان هستخدمه فى كذا حتة
              token = state.loginModel!.data!.token;
              CacheHelper.setData(
                      key: 'token', value: state.loginModel!.data!.token)
                  .then((value) {
                print(token);
                navigateAndFinish(context, const TodoeyLayout());
                showToast(
                  text: 'Login Successfully',
                  state: ToastStates.SUCCESS,
                );
              });
            } else {
              showToast(
                text: 'Login failed',
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 80),
                            const Text(
                              'Welcome',
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              'back!',
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              color: defaultColor,
                              height: 5,
                              width: 15,
                            ),
                            const SizedBox(height: 50),
                            defaultTextForm(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              label: 'Email adress',
                              prefixIcon: const Icon(Icons.email_outlined),
                              onSubmitted: (value) {},
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please insert your email adress';
                                }
                              },
                            ),
                            const SizedBox(height: 30),
                            defaultTextForm(
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              label: 'insert your password',
                              prefixIcon: const Icon(Icons.lock_open_outlined),
                              onSubmitted: (value) {},
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please insert password';
                                }
                              },
                            ),
                            const SizedBox(height: 60),
                            Row(
                              children: [
                                defaultButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).loginUserData(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                  text: 'sign in',
                                  backgroundColor: defaultColor,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                ),
                                const SizedBox(width: 25),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgotten password?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 95),
                            Container(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            RegisterScreen(),
                                      ));
                                },
                                child: const Text(
                                  'CREATE A NEW ACCOUNT >',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
