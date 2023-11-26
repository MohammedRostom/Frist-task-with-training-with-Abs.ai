import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_auth_with_firebases_auth/constant.dart';
import 'package:task_auth_with_firebases_auth/view/Login_View.dart';
import 'package:task_auth_with_firebases_auth/view/components/CustomBottonWideget.dart';
import 'package:task_auth_with_firebases_auth/view/components/CustomTextFormField.dart';
import 'package:task_auth_with_firebases_auth/view/components/CustomTxtWidget.dart';
import 'package:task_auth_with_firebases_auth/viewModel/Login_viewModel.dart';

class Register_View extends StatelessWidget {
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
                key: KeyForm2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 50),
                    CustomTxtWidget(
                        Txt: "Register Now!", Sizetxt: 25, TxtColor: MainColor),
                    SizedBox(height: 10),
                    CustomTxtWidget(
                        Txt: "Create Account ABS.Ai",
                        Sizetxt: 15,
                        TxtColor: Colors.grey.withOpacity(0.5)),
                    SizedBox(height: 30),
                    CustomTextFormField(
                      obscureText: false,
                      onSaved: (value) {
                        controllerProvider.userNameController.text = value!;
                      },
                      controller: controllerProvider.userNameController,
                      labelText: "User name",
                      prefixIcon: Icon(
                        Icons.email,
                        color: MainColor,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'User name';
                        }
                        // You can add more complex email validation if needed
                        return null;
                      },
                    ),
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
                        // You can add more complex password validation if needed
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 50),
                    CustomBottonWidget(
                      TxtBtn: controllerProvider.isLoading
                          ? "Creating......"
                          : "Register ",
                      SizeTxtBtn: 25,
                      BacgroundOfBtn: MainColor,
                      onPressed: () async {
                        await controllerProvider.register(context);

                        if (KeyForm2.currentState!.validate()) {
                          // Form is valid, proceed with login
                          KeyForm2.currentState!.save();
                          print(controllerProvider.userNameController.text);
                          print(controllerProvider.emailController.text);
                          print(controllerProvider.passwordController.text);
                        }
                      },
                      Colortxt: Colors.white,
                    ),
                    SizedBox(height: 12.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTxtWidget(
                            Txt: "Arleady have An account ?",
                            Sizetxt: 15,
                            TxtColor: MainColor),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login_View(),
                              ),
                            );
                          },
                          child: CustomTxtWidget(
                              Txt: "Login", Sizetxt: 15, TxtColor: MainColor),
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
