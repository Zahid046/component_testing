import 'dart:developer';

import 'package:component_testing/constants/values.dart';
import 'package:flutter/material.dart';

void heightWidth(context) {
  height = MediaQuery.of(context).size.height;
  width = MediaQuery.of(context).size.width;
}

void ll(message) {
  log(message.toString());
}