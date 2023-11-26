import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:task_auth_with_firebases_auth/constant.dart';
import 'package:task_auth_with_firebases_auth/view/HomePage.dart';
import 'package:task_auth_with_firebases_auth/view/Register_View.dart';
import 'package:task_auth_with_firebases_auth/view/components/CustomBottonWideget.dart';
import 'package:task_auth_with_firebases_auth/view/components/CustomTextFormField.dart';
import 'package:task_auth_with_firebases_auth/view/components/CustomTxtWidget.dart';
import 'package:task_auth_with_firebases_auth/viewModel/Login_viewModel.dart';

class Login_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProividerClassViewModel>(
      builder: (context, controllerProvider, child) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: KeyForm1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 50),
                    CustomTxtWidget(
                        Txt: "Login", Sizetxt: 50, TxtColor: MainColor),
                    SizedBox(height: 10),
                    CustomTxtWidget(
                        Txt: "Welcome back! Login With User Credentials ",
                        Sizetxt: 15,
                        TxtColor: Colors.grey.withOpacity(0.5)),
                    SizedBox(height: 30),
                    CustomTextFormField(
                      obscureText: false,
                      onSaved: (value) {
                        controllerProvider.emailController.text = value!;
                      },
                      controller: controllerProvider.emailController,
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: MainColor,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // You can add more complex email validation if needed
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    CustomTextFormField(
                      onSaved: (value) {
                        controllerProvider.passwordController.text = value!;
                      },
                      controller: controllerProvider.passwordController,
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: MainColor,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 70),
                    CustomBottonWidget(
                      TxtBtn:
                          controllerProvider.isLoading ? "Loading..." : "Login",
                      SizeTxtBtn: 25,
                      BacgroundOfBtn: MainColor,
                      onPressed: () async {
                        controllerProvider.isLoading == true;
                        if (KeyForm1.currentState!.validate()) {
                          KeyForm1.currentState!.save();
                          print(controllerProvider.emailController.text);
                          print(controllerProvider.passwordController.text);
                        }

                        controllerProvider.login(context);
                        // Call the login function and wait for it to complete
                      },
                      Colortxt: Colors.white,
                    ),
                    SizedBox(height: 12.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTxtWidget(
                            Txt: "Don't have an account?",
                            Sizetxt: 15,
                            TxtColor: MainColor),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register_View(),
                              ),
                            );
                          },
                          child: CustomTxtWidget(
                              Txt: "Register",
                              Sizetxt: 15,
                              TxtColor: MainColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
