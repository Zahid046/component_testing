import 'dart:developer';

import 'package:component_testing/constants/dimensions.dart';
import 'package:component_testing/constants/styles.dart';
import 'package:component_testing/constants/values.dart';
import 'package:flutter/material.dart';

void heightWidth(context) {
  height = MediaQuery.of(context).size.height;
  width = MediaQuery.of(context).size.width;
}

void ll(message) {
  log(message.toString());
}

SnackBar getSnackBar(context, wid, title, message, color) {
  return SnackBar(
    dismissDirection: DismissDirection.down,
    width: wid * .8,
    shape: RoundedRectangleBorder(
      borderRadius: k10BorderRadius,
    ),
    behavior: SnackBarBehavior.floating,
    elevation: kCommonElevation,
    backgroundColor: color,
    duration: const Duration(milliseconds: 2000),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: f16TextStyle(Colors.white, FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        kH8sizedBox,
        Text(
          message,
          style: f14TextStyle(Colors.white, FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
