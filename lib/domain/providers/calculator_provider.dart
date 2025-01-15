import 'package:flutter/material.dart';
import '../models/calculator_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/calculator_utils.dart';

class CalculatorProvider extends ChangeNotifier {
  CalculatorState _state = const CalculatorState();
  CalculatorState get state => _state;

  void calculate(String value) {
    if (value == AppConstants.clearAll) {
      _resetCalculator();
    } else if (value == AppConstants.toggleSign) {
      _toggleSign();
    } else if (value == AppConstants.percentage) {
      _calculatePercentage();
    } else if (value == AppConstants.decimal) {
      _addDecimal();
    } else if (CalculatorUtils.isOperation(value)) {
      _handleOperation(value);
    } else {
      _appendNumber(value);
    }
    notifyListeners();
  }

  void _resetCalculator() {
    _state = const CalculatorState();
  }

  void _toggleSign() {
    final currentResult = _state.result;
    final newResult = currentResult.startsWith('-') 
        ? currentResult.substring(1) 
        : '-$currentResult';
    _state = _state.copyWith(
      result: newResult,
      finalResult: newResult,
    );
  }

  void _calculatePercentage() {
    final result = (_state.firstNumber / 100).toString();
    final formattedResult = CalculatorUtils.formatDecimal(result);
    _state = _state.copyWith(
      result: result,
      finalResult: formattedResult,
    );
  }

  void _addDecimal() {
    if (!_state.result.contains('.')) {
      final newResult = '${_state.result}.';
      _state = _state.copyWith(
        result: newResult,
        finalResult: newResult,
      );
    }
  }

  void _handleOperation(String operation) {
    if (_state.firstNumber == 0) {
      _state = _state.copyWith(
        firstNumber: double.parse(_state.result),
        operation: operation,
        result: '',
      );
    } else {
      _state = _state.copyWith(
        secondNumber: double.parse(_state.result),
      );
      _performCalculation();
      _state = _state.copyWith(
        operation: operation,
        previousOperation: _state.operation,
        result: '',
      );

      if (operation == AppConstants.equals) {
        _state = _state.copyWith(
          result: _state.finalResult,
          firstNumber: double.parse(_state.finalResult),
          secondNumber: 0,
        );
      }
    }
  }

  void _appendNumber(String number) {
    final newResult = _state.result == '0' ? number : _state.result + number;
    _state = _state.copyWith(
      result: newResult,
      finalResult: newResult,
    );
  }

  void _performCalculation() {
    String result;
    switch (_state.operation) {
      case AppConstants.add:
        result = (_state.firstNumber + _state.secondNumber).toString();
        break;
      case AppConstants.subtract:
        result = (_state.firstNumber - _state.secondNumber).toString();
        break;
      case AppConstants.multiply:
        result = (_state.firstNumber * _state.secondNumber).toString();
        break;
      case AppConstants.divide:
        result = _state.secondNumber == 0 
            ? AppConstants.divisionError 
            : (_state.firstNumber / _state.secondNumber).toString();
        break;
      default:
        return;
    }

    final formattedResult = CalculatorUtils.formatDecimal(result);
    _state = _state.copyWith(
      finalResult: formattedResult,
      firstNumber: double.tryParse(formattedResult) ?? _state.firstNumber,
    );
  }
}