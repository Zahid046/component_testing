import 'package:component_testing/constants/dimensions.dart';
import 'package:component_testing/constants/values.dart';
import 'package:flutter/material.dart';

TextStyle h1TextStyle(Color color) {
  return TextStyle(
    fontFamily: 'Gilroy-Bold',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize28 : (kFontSize28 - 2),
    color: color,
  );
}

TextStyle titleTextStyle(Color color) {
  return TextStyle(
    fontFamily: 'Gilroy-Bold',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize20 : (kFontSize20 - 2),
    color: color,
  );
}

TextStyle title18TextStyle(Color color) {
  return TextStyle(
    fontFamily: 'Gilroy-Bold',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize18 : (kFontSize18 - 2),
    color: color,
  );
}

TextStyle subTitleAndButtonTextStyle(Color color) {
  return TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize16 : (kFontSize16 - 2),
    color: color,
  );
}

TextStyle bodyTextStyle(Color color) {
  return TextStyle(
    fontFamily: 'Gilroy-Regular',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize14 : (kFontSize14 - 2),
    color: color,
  );
}

TextStyle smallBodyTextStyle(Color color) {
  return TextStyle(
    fontFamily: 'Gilroy-Regular',
    fontSize: height > kSmallDeviceSizeLimit ? kFontSize12 : ( kFontSize12 - 2),
    color: color,
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





const regular = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

const medium = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

const bold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
);

const extraBold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w900,
);