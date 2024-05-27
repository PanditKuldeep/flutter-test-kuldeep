class Regex {

  static bool isMatch(String value1, String value2) {
    return value1 != value2 ? false : true;
  }

  static bool isDateFormatted(String value) {
    Pattern pattern =
        r'^(0?[1-9]|1[0-2])[\/](0?[1-9]|[12]\d|3[01])[\/](19|20)\d{2}$';
    final regex = RegExp(pattern.toString());
    return !regex.hasMatch(value) ? false : true;
  }
}
