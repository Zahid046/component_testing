import 'package:component_testing/constants/dimensions.dart';
import 'package:component_testing/constants/values.dart';
import 'package:flutter/material.dart';

TextStyle f32TextStyle(Color color, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Gilroy-Bold',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize32 : (kFontSize32 - 2),
    color: color,
    fontWeight: weight,
  );
}

TextStyle f28TextStyle(Color color, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Gilroy-Bold',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize28 : (kFontSize28 - 2),
    color: color,
    fontWeight: weight,
  );
}

TextStyle f24TextStyle(Color color, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Gilroy-Bold',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize24 : (kFontSize24 - 2),
    color: color,
    fontWeight: weight,
  );
}

TextStyle f20TextStyle(Color color, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Gilroy-Bold',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize20 : (kFontSize20 - 2),
    color: color,
    fontWeight: weight,
  );
}

TextStyle f18TextStyle(Color color, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Gilroy-Bold',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize18 : (kFontSize18 - 2),
    color: color,
    fontWeight: weight,
  );
}

TextStyle f16TextStyle(Color color, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize16 : (kFontSize16 - 2),
    color: color,
    fontWeight: weight,
  );
}

TextStyle f14TextStyle(Color color, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Gilroy-Regular',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize14 : (kFontSize14 - 2),
    color: color,
    fontWeight: weight,
  );
}

TextStyle f12TextStyle(Color color, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Gilroy-Regular',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize12 : (kFontSize12 - 2),
    color: color,
    fontWeight: weight,
  );
}

//* info: remove extra padding from TextButton
ButtonStyle buttonStyle(Color color) {
  return TextButton.styleFrom(
    padding: EdgeInsets.zero,
    minimumSize: Size.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    splashFactory: InkSplash.splashFactory,
  ).copyWith(overlayColor: MaterialStateProperty.all(color.withOpacity(.2)));
}
