import 'dart:ui';

import 'package:bike_app/styling/custom_colors.dart';

class CustomTextStyle {

  static TextStyle darkButtons = TextStyle(
    fontFamily: 'Sitka Text',
    fontSize: 22,
    color: CustomColors.darkText,
  );

  static TextStyle appTitle = TextStyle(
    fontFamily: 'Sitka Text',
    fontSize: 30,
    color: CustomColors.whiteGrey,
  );

  static TextStyle playerLabels = TextStyle(
    fontFamily: 'Sitka Text',
    fontSize: 18,
    color: CustomColors.whiteGrey,
  );

  static TextStyle cellValues = TextStyle(
    fontFamily: 'Sitka Text',
    fontSize: 34,
    color: CustomColors.darkText,
  );

  static TextStyle logoText = TextStyle(
    fontFamily: 'Rockwell',
    fontSize: 42,
    color: CustomColors.darkGold,
  );

  static TextStyle userName = TextStyle(
    fontFamily: 'Sitka Text',
    fontSize: 18,
    color: CustomColors.whiteGrey,
  );

  static TextStyle activeMenuLabel = TextStyle(
    fontFamily: 'Sitka Text',
    fontSize: 22,
    color: CustomColors.whiteGrey,
  );

  static TextStyle deactiveMenuLabel = TextStyle(
    fontFamily: 'Sitka Text',
    fontSize: 22,
    color: CustomColors.grey,
  );

  static TextStyle topicSubject = TextStyle(
    fontFamily: 'Rockwell',
    fontSize: 16,
    fontStyle: FontStyle.italic,
    color: CustomColors.whiteGrey,
  );
}