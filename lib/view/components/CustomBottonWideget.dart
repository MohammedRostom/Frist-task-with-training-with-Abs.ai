import 'package:flutter/material.dart';

//CustomBtnWidget===> As Contractor
Padding CustomBottonWidget(
        {required String TxtBtn,
        required double SizeTxtBtn,
        required Color BacgroundOfBtn,
        required void Function()? onPressed,
        required Color Colortxt}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: BacgroundOfBtn, borderRadius: BorderRadius.circular(40)),
        height: 75,
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            "${TxtBtn}",
            style: TextStyle(fontSize: SizeTxtBtn, color: Colortxt),
          ),
        ),
      ),
    );
