import 'package:flutter/material.dart';

Text CustomTxtWidget(
    {required var Txt, required double Sizetxt, required Color TxtColor}) {
  return Text(
    "${Txt}",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: Sizetxt, color: TxtColor),
  );
}
