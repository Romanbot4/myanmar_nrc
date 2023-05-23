abstract class MyanmarNRCPattern {
  static const String enNRCPattern =
      r"\d{1,2}\/[A-Z]{6,8}\((N|E|P|T|R|S)\)\d{5,6}";
  static const String myNRCPattern =
      r"[၀-၉]{1,2}\/[က-အ]{3,3}\((နိုင်|ဧည့်|ပြု|သာသနာ|ယာယီ|စ)\)([၀-၉]{5,6}|[0-9]{5,6})";

  static const String enLangCode = "en";
  static const String myLangCode = "my";

  static const List<String> supportedLangCodes = [enLangCode, myLangCode];

  static const Map<String, String> patterns = {
    enLangCode: enNRCPattern,
    myLangCode: myNRCPattern,
  };
}
