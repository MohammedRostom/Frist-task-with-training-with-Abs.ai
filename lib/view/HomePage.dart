import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_auth_with_firebases_auth/constant.dart';
import 'package:task_auth_with_firebases_auth/view/components/CustomTxtWidget.dart';
import 'package:task_auth_with_firebases_auth/viewModel/Login_viewModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CustomTxtWidget(
                  Sizetxt: 25,
                  Txt: "successful\n authorization",
                  TxtColor: MainColor),
            ),
          ],
        ),
      ),
    );
  }
}
