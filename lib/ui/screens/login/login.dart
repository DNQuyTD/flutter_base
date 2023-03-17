import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/ui/components/email_form_field.dart';
import 'package:time_tracker/ui/components/pass_word_form_field.dart';
import 'package:time_tracker/ui/components/success_dialog.dart';
import 'package:time_tracker/ui/screens/login/login_bloc_state.dart';
import 'package:time_tracker/ui/screens/login/login_cubit.dart';

import '../../components/progress_dialog.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pd = ProgressDialog();
    final successDialog = SuccessDialog();

    return BlocConsumer<LoginCubit, LoginBlocState>(
      listener: (context, state) {
        if (state.loginStatus == LoginStatus.loading) {
          pd.show(context);
        } else {
          pd.close();
        }

        if (state.loginStatus == LoginStatus.loadSuccess) {
          successDialog.show(context);
        }

        if (state.loginStatus == LoginStatus.loadFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorObject?.message ?? ""),
          ));
        }
      },
      builder: (context, state) {
        LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.26),
                      const Text("Log in",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.02),
                      ClipRect(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              color:
                              Color.fromRGBO(0, 0, 0, 1).withOpacity(0.8),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.9,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.4,
                          child: Form(
                            key: _formKey,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  EmailFormField(
                                      controller: emailController,
                                      onChanged: (value) {},
                                      validator: (value) {
                                        return null;
                                      }),
                                  SizedBox(
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          0.03),
                                  PasswordFormField(
                                      controller: passwordController,
                                      onChanged: (value) {},
                                      validator: (value) {
                                        return null;
                                      }),
                                  SizedBox(
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          0.03),
                                  ElevatedButton(
                                    onPressed: () {
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        cubit.signIn(emailController.text, passwordController.text);
                                      }
                                    },
                                    child: const Text("Sign in"),
                                  ),
                                  const SizedBox(height: 30),
                                  Text('Forgot Password?',
                                      style: TextStyle(
                                          color:
                                          Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.start),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
