import 'package:flutter/material.dart';

import '../colors.dart';

class PreluraTypography1 {
  PreluraTypography1._();
  static const String primaryfontName = "SanFrancisco";
  static const String secondaryfontName = 'SF';
  static TextStyle normalTextStyle = const TextStyle(
    fontFamily: primaryfontName,
    fontSize: 15,
    color: Colors.black, //ChatifyColors.primaryColor,
  );
  static TextStyle mediumTextStyle = const TextStyle(
    fontFamily: primaryfontName,
    fontSize: 15,
    color: Colors.black, // ChatifyColors.primaryColor,
  );
  static TextStyle smallTextStyle = const TextStyle(
    fontFamily: primaryfontName,
    color: Colors.black, //ChatifyColors.primaryColor,
    fontSize: 15,
  );

  static const TextStyle labelTextStyle = TextStyle(
    fontFamily: PreluraTypography1.primaryfontName,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle unselectedLabelTextStyle = TextStyle(
    fontFamily: PreluraTypography1.primaryfontName,
    fontWeight: FontWeight.w400,
  );

  static TextStyle promptTextStyle = TextStyle(
    color: ChatifyColors.mainColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    fontFamily: PreluraTypography1.primaryfontName,
  );

  static customWidthOpacityText(opacity, fontWeight) => TextStyle(
      fontFamily: PreluraTypography1.primaryfontName,
      color: ChatifyColors.mainColor.withOpacity(opacity),
      fontSize: 16,
      fontWeight: fontWeight);

  static TextStyle pageTitleTextStyle = TextStyle(
    fontFamily: 'SF',
    color: ChatifyColors.text,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle sheetCenterCTA = const TextStyle(
    fontFamily: 'SF',
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

class PreluraDarkTheme {
  PreluraDarkTheme._();
  static const String primaryfontName = "SanFrancisco";
  static const String secondaryfontName = 'Futura';
  static TextStyle normalTextStyle = const TextStyle(
      fontFamily: primaryfontName,
      fontSize: 15,
      color: ChatifyColors.darkOnPrimaryColor);
  static TextStyle mediumTextStyle = const TextStyle(
      fontFamily: primaryfontName,
      fontSize: 15,
      color: ChatifyColors.darkOnPrimaryColor);
  static TextStyle smallTextStyle = const TextStyle(
      fontFamily: primaryfontName,
      fontSize: 15,
      color: ChatifyColors.darkOnPrimaryColor);
  static TextStyle bodySmallTextStyle = const TextStyle(
      fontFamily: primaryfontName,
      fontSize: 15,
      color: ChatifyColors.darkOnPrimaryColor);

  static const TextStyle labelTextStyle = TextStyle(
    fontFamily: PreluraTypography1.primaryfontName,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle unselectedLabelTextStyle = TextStyle(
      fontFamily: PreluraTypography1.primaryfontName,
      fontWeight: FontWeight.w400,
      color: Colors.white);

  static TextStyle promptTextStyle = TextStyle(
    color: ChatifyColors.mainColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    fontFamily: PreluraTypography1.primaryfontName,
  );

  static customWidthOpacityText(opacity, fontWeight) => TextStyle(
      fontFamily: PreluraTypography1.primaryfontName,
      color: ChatifyColors.mainColor.withOpacity(opacity),
      fontSize: 16,
      fontWeight: fontWeight);

  static TextStyle pageTitleTextStyle = TextStyle(
    fontFamily: 'SF',
    color: ChatifyColors.text,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle sheetCenterCTA = const TextStyle(
    fontFamily: 'SF',
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

const Size screenSize = Size(428, 926);
final TextStyle pageTitleTextStyle = TextStyle(
  fontFamily: PreluraTypography1.primaryfontName,
  color: ChatifyColors.text,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

const TextStyle labelTextStyle = TextStyle(
  fontFamily: PreluraTypography1.primaryfontName,
  fontWeight: FontWeight.w500,
);
const TextStyle unselectedLabelTextStyle = TextStyle(
  fontFamily: PreluraTypography1.primaryfontName,
  fontWeight: FontWeight.w400,
);

final TextStyle promptTextStyle = TextStyle(
  color: ChatifyColors.mainColor,
  fontWeight: FontWeight.w500,
  fontSize: 16,
  fontFamily: PreluraTypography1.primaryfontName,
);

final TextStyle buttonTitleTextStyle = TextStyle(
  color: ChatifyColors.white,
  fontWeight: FontWeight.w500,
  fontSize: 16,
  fontFamily: PreluraTypography1.primaryfontName,
);

final TextStyle textFieldTitleTextStyle = TextStyle(
  color: ChatifyColors.hintColor,
  fontWeight: FontWeight.w600,
  fontSize: 16,
  fontFamily: PreluraTypography1.primaryfontName,
);

customWidthOpacityText(opacity, fontWeight) => TextStyle(
    fontFamily: PreluraTypography1.primaryfontName,
    color: ChatifyColors.mainColor.withOpacity(opacity),
    fontSize: 16,
    fontWeight: fontWeight);

final TextStyle descriptionTextStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  fontFamily: 'SF',
);

const TextStyle bioTitleTextStyle = TextStyle(
  color: ChatifyColors.appBarShadowColor,
  fontWeight: FontWeight.w500,
  fontSize: 15,
  fontFamily: PreluraTypography1.secondaryfontName,
);
