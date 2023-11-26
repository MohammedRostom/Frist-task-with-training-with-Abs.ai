import 'package:flutter/material.dart';
import 'package:task_auth_with_firebases_auth/constant.dart';
import 'package:task_auth_with_firebases_auth/view/Login_View.dart';
import 'package:task_auth_with_firebases_auth/view/Register_View.dart';
import 'package:task_auth_with_firebases_auth/view/components/CustomBottonWideget.dart';
import 'package:task_auth_with_firebases_auth/view/components/CustomTxtWidget.dart';

class LoginOrSignup_View extends StatelessWidget {
  const LoginOrSignup_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 150,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("lib/assets/imagas/1.png"),
              ),
              SizedBox(height: 25),
              CustomBottonWidget(
                  TxtBtn: "Login",
                  SizeTxtBtn: 25,
                  BacgroundOfBtn: MainColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login_View()),
                    );
                  },
                  Colortxt: Colors.white),
              SizedBox(height: 15),
              CustomBottonWidget(
                  TxtBtn: "Register",
                  SizeTxtBtn: 25,
                  BacgroundOfBtn: Colors.grey.withOpacity(0.5),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register_View()),
                    );
                  },
                  Colortxt: MainColor),
              SizedBox(
                height: 15,
              ),
              CustomTxtWidget(
                  Txt: "Powered by absai", Sizetxt: 16, TxtColor: MainColor),
            ],
          ),
        ),
      )),
    );
  }
}
