/// This is Model for Calculator State
class CalculatorState {
  final String displayText;
  final double firstNumber;
  final double secondNumber;
  final String result;
  final String finalResult;
  final String operation;
  final String previousOperation;

  const CalculatorState({
    this.displayText = '0',
    this.firstNumber = 0,
    this.secondNumber = 0,
    this.result = '',
    this.finalResult = '',
    this.operation = '',
    this.previousOperation = '',
  });

  CalculatorState copyWith({
    String? displayText,
    double? firstNumber,
    double? secondNumber,
    String? result,
    String? finalResult,
    String? operation,
    String? previousOperation,
  }) {
    return CalculatorState(
      displayText: displayText ?? this.displayText,
      firstNumber: firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      result: result ?? this.result,
      finalResult: finalResult ?? this.finalResult,
      operation: operation ?? this.operation,
      previousOperation: previousOperation ?? this.previousOperation,
    );
  }
}