class CalculatorUtils {
  static String formatDecimal(String result) {
    if (result.contains('.')) {
      List<String> splitDecimal = result.split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return splitDecimal[0];
      }
    }
    return result;
  }

  static bool isOperation(String value) {
    return '+-x/='.contains(value);
  }

  static bool isSpecialOperation(String value) {
    return 'AC+/-%'.contains(value);
  }
}