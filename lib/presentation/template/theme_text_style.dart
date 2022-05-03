import 'package:pokemon_go/presentation/template/template.dart';

class ThemeTextBold {
  static const fontWeight = FontWeight.w700;
  static const fontFamily = "RobotoBold";

  static const bold1 = TextStyle(
    color: ThemeColors.white1,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 10.0,
  );

  static const bold2 = TextStyle(
    color: ThemeColors.white1,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 18.0,
  );
}

class ThemeTextBoldItalic {
  static const fontWeight = FontWeight.w700;
  static const fontFamily = "RobotoBold";

  static const boldItalic1 = TextStyle(
    color: ThemeColors.white1,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.italic,
    fontSize: 18.0,
  );
}

class ThemeTextMedium {
  static const fontWeight = FontWeight.w500;
  static const fontFamily = "UbuntuRegular";

  static const medium1 = TextStyle(
    color: ThemeColors.white1,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 12.0,
  );
}
