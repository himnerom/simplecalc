import 'package:flutter/foundation.dart';
import 'package:function_tree/function_tree.dart';

/// Enum for the operation

/// Enum to know the state of the operation
/// States normal lifecycle (no AC): nb1 -> ope -> nb2 -> eq -> nb1
enum OperationState { nb1, ope, nb2, eq }

class CalculatorService with ChangeNotifier {
  static const String possibleOperators = '+-*/';
  static const String possibleDigits = '0123456789';

  String _currentDisplay = '0';
  String nb1 = '0';
  String nb2 = '0';
  String operator = '+';
  OperationState operationState = OperationState.nb1;

  String get currentDisplay => _currentDisplay;

  set currentDisplay(String val) {
    _currentDisplay = val;
    notifyListeners();

    if (kDebugMode) {
      print('currentDisplay: $_currentDisplay');
      print('nb1: $nb1');
      print('nb2: $nb2');
      print('operator: $operator');
      print('operationState: ${operationState.toString()}');
    }
  }

  void pushDigit(String digit) {
    if (operationState == OperationState.nb1) {
      nb1 = nb1 == '0' ? digit : nb1 + digit;
      currentDisplay = nb1;
    } else if (operationState == OperationState.ope) {
      operationState = OperationState.nb2;
      nb2 = digit;
      currentDisplay = nb2;
    } else if (operationState == OperationState.nb2) {
      nb2 = nb2 == '0' ? digit : nb2 + digit;
      currentDisplay = nb2;
    } else if (operationState == OperationState.eq) {
      pushReset();
      nb1 = digit;
      currentDisplay = nb1;
    }
  }

  void pushOperator(String newOperator) {
    if (operationState == OperationState.nb2) {
      pushEqual();
    } else {
      nb2 = '0';
    }
    operationState = OperationState.ope;
    operator = newOperator;
  }

  void pushEqual() {
    if (operationState == OperationState.ope) {
      nb2 = nb1;
    }

    /// Creates the calculation string
    final String calcString = nb1 + operator + nb2;

    /// Makes the calculation
    currentDisplay = removeNumberEnding(calcString.interpret().toString());
    nb1 = currentDisplay;
    operationState = OperationState.eq;
  }

  void pushComma() {
    if (operationState == OperationState.nb1 ||
        operationState == OperationState.eq) {
      if (!nb1.contains('.')) {
        nb1 += '.';
        currentDisplay = nb1;
      }
      operationState = OperationState.nb1;
    } else if (!nb2.contains('.')) {
      nb2 += '.';
      currentDisplay = nb2;
      operationState = OperationState.nb2;
    }
  }

  void pushReset() {
    currentDisplay = '0';
    nb1 = '0';
    nb2 = '0';
    operator = '+';
    operationState = OperationState.nb1;
  }

  void push(String char) {
    if (possibleDigits.contains(char)) {
      pushDigit(char);
    } else if (possibleOperators.contains(char)) {
      pushOperator(char);
    } else if (char == '=' || char == '\n') {
      pushEqual();
    } else if (char == ',') {
      pushComma();
    } else if (char == 'AC') {
      pushReset();
    }
  }

  static String removeNumberEnding(String nb) {
    if (nb.contains('.')) {
      for (int i = nb.length - 1; i > 0; i--) {
        if (nb[i] == '0') {
          nb = nb.substring(0, i);
        } else if (nb[i] == '.') {
          nb = nb.substring(0, i);
          break;
        } else {
          break;
        }
      }
    }
    return nb;
  }
}
