import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey_app/module/register/cubit/register_cubit.dart';
import 'package:todoey_app/module/register/cubit/register_state.dart';
import 'package:todoey_app/shared/components/components.dart';
import 'package:todoey_app/shared/styles/colors.dart';
import 'package:todoey_app/shared/styles/icon_broken.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {},
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
                                'Create new',
                                style: TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
                                'account',
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
                              const SizedBox(height: 30),
                              defaultTextForm(
                                keyboardType: TextInputType.name,
                                controller: nameController,
                                label: 'Full name',
                                prefixIcon: const Icon(IconBroken.User),
                                onSubmitted: (value) {},
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'please insert your full name';
                                  }
                                },
                              ),
                              const SizedBox(height: 25),
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
                              const SizedBox(height: 25),
                              defaultTextForm(
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                label: 'Create password',
                                prefixIcon:
                                    const Icon(Icons.lock_open_outlined),
                                onSubmitted: (value) {},
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'please insert password';
                                  }
                                },
                              ),
                              const SizedBox(height: 25),
                              defaultTextForm(
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                                label: 'add your phone',
                                prefixIcon: const Icon(Icons.phone),
                                onSubmitted: (value) {},
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'please add your phone number';
                                  }
                                },
                              ),
                              const SizedBox(height: 45),
                              defaultButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      RegisterCubit.get(context).registerUser(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                      );
                                    }
                                  },
                                  text: 'sign up',
                                  backgroundColor: defaultColor),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ));
          },
        ));
  }
}
