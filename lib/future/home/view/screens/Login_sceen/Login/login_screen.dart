import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_login/core/validotor.dart';
import 'package:post_login/future/home/cubit/post_cubit.dart';
import 'package:post_login/future/home/view/screens/Login_sceen/regester/regester_screen.dart';
import 'package:post_login/future/home/view/widgets/widgetTextff/wdget_textff.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => PostCubit(),
      child: Scaffold(
        body: BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {
            if (state is PostSuccessLogin) {
              if (state.userdata['status'] == 'success') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text(state.userdata['message'] ?? 'Login Successful'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.userdata['message'] ?? 'Login Failed'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            } else if (state is PostError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage.isNotEmpty
                        ? 'Error: ${state.errorMessage}'
                        : 'An unknown error occurred',
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            PostCubit cubit = BlocProvider.of(context);
            return Form(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFm2d6M-ANyngGPjcp-jI7QSHXbSz2SVYNTg&s',
                          ),
                        ),
                        SizedBox(height: 30),
                        defoultTextFF(
                          type: TextInputType.emailAddress,
                          controller: emailController,
                          onfiled: (value) {},
                          validat: (value) {
                            return MyValidators.emailValidator(value);
                          },
                          prifix: Icons.email_rounded,
                        ),
                        SizedBox(height: 10),
                        defoultTextFF(
                          type: TextInputType.text,
                          controller: passwordController,
                          onfiled: (value) {},
                          validat: (value) {
                            return MyValidators.passwordValidator(value);
                          },
                          prifix: Icons.password_rounded,
                        ),
                        SizedBox(height: 15),
                        if (state is PostLoading) CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Container(
                          color: Colors.blueAccent,
                          height: 50,
                          width: 150,
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                cubit.postDataCupit(
                                  emaildata: emailController.text,
                                  passworddata: passwordController.text,
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont have an account!'),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterScreen(),
                                      ));
                                },
                                child: Text('Register')),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
