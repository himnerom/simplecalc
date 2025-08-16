import 'package:flutter/foundation.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_tree/function_tree.dart';

/// Enum to know the state of the operation
/// States normal lifecycle (no AC): nb1 -> ope -> nb2 -> eq -> nb1
enum OperationState {
  nb1,
  ope,
  nb2,
  eq,
}

class CalcProvider extends Notifier<String> {
  static const String possibleOperators = '+-*/';
  static const String possibleDigits = '0123456789';

  static const List<LogicalKeyboardKey> commaKeys = [
    LogicalKeyboardKey.comma,
    LogicalKeyboardKey.period,
    LogicalKeyboardKey.numpadComma,
    LogicalKeyboardKey.numpadDecimal,
  ];
  static const List<LogicalKeyboardKey> equalKeys = [
    LogicalKeyboardKey.equal,
    LogicalKeyboardKey.enter,
    LogicalKeyboardKey.numpadEqual,
    LogicalKeyboardKey.numpadEnter,
  ];
  static const List<LogicalKeyboardKey> removeKeys = [
    LogicalKeyboardKey.delete,
    LogicalKeyboardKey.backspace,
  ];
  
  @override
  String build() => '0';

  String nb1 = '0';
  String nb2 = '0';
  String operator = '+';
  OperationState operationState = OperationState.nb1;
  
  void setState(String val) {
    state = val;

    if (kDebugMode) {
      print('currentDisplay: $val');
      print('nb1: $nb1');
      print('nb2: $nb2');
      print('operator: $operator');
      print('operationState: ${operationState.toString()}');
    }
  }

  void pushDigit(String digit) {
    /// Not a digit
    if (!possibleDigits.contains(digit)) {
      return;
    }

    switch (operationState) {
      case OperationState.nb1:
        nb1 = nb1 == '0' ? digit : nb1 + digit;
        setState(nb1);
        break;
      case OperationState.ope:
        operationState = OperationState.nb2;
        nb2 = digit;
        setState(nb2);
        break;
      case OperationState.nb2:
        nb2 = nb2 == '0' ? digit : nb2 + digit;
        setState(nb2);
        break;
      case OperationState.eq:
        pushReset();
        nb1 = digit;
        setState(nb1);
        break;
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
    if (!possibleOperators.contains(operator)) {
      return;
    }
    if (operationState == OperationState.ope) {
      nb2 = nb1;
    }

    /// Handles nb1/0
    if (operator == '/' && removeTrailingZeros(nb2) == '0') {
      setState('Not a number');
      operationState = OperationState.eq;
      return;
    }

    Decimal d1 = Decimal.parse(nb1);
    Decimal d2 = Decimal.parse(nb2);
    Decimal res = Decimal.parse('0');

    switch (operator) {
      case '+':
        res = d1 + d2;
        break;
      case '-':
        res = d1 - d2;
        break;
      case '*':
        res = d1 * d2;
        break;
      case '/':
        res = (d1 / d2).toDecimal(scaleOnInfinitePrecision: 1024);
        break;
    }

    nb1 = res.toString();
    setState(removeTrailingZeros(nb1.interpret().toString()));
    operationState = OperationState.eq;
  }

  void pushComma() {
    if (operationState == OperationState.nb1 ||
        operationState == OperationState.eq) {
      if (!nb1.contains('.')) {
        nb1 += '.';
        setState(nb1);
      }
      operationState = OperationState.nb1;
    } else if (!nb2.contains('.')) {
      nb2 += '.';
      setState(nb2);
      operationState = OperationState.nb2;
    }
  }

  void pushRemove() {
    String nb = state;
    if (nb.isEmpty || nb.length == 1) {
      nb = '0';
    } else if (nb.contains('e')) {
      if (nb.contains('+')) {
        nb = nb.replaceAll('.', '');
      }
      nb = nb.substring(0, nb.indexOf('e'));
    } else {
      nb = nb.substring(0, nb.length - 1);
    }

    setState(nb);
    if (operationState == OperationState.nb2) {
      nb2 = nb;
    } else {
      nb1 = nb;
      operationState = OperationState.nb1;
    }
  }

  void pushReset() {
    setState('0');
    nb1 = '0';
    nb2 = '0';
    operator = '+';
    operationState = OperationState.nb1;
  }

  void push(KeyEvent event) {
    String? char = event.character;
    if (char != null && possibleDigits.contains(char)) {
      pushDigit(char);
    } else if (char != null && possibleOperators.contains(char)) {
      pushOperator(char);
    } else if (commaKeys.contains(event.logicalKey) ||
        char == '.' ||
        char == ',') {
      pushComma();
    } else if (equalKeys.contains(event.logicalKey) || char == '=') {
      pushEqual();
    } else if (removeKeys.contains(event.logicalKey)) {
      pushRemove();
    } else if (event.logicalKey == LogicalKeyboardKey.escape) {
      pushReset();
    }
  }

  /// Ex: 010.0 -> 010 ; 10.01000 -> 10.01
  static String removeTrailingZeros(String nb) {
    /// Zeros above
    nb = nb.replaceFirst(RegExp('^0+'), '');
    if (nb.isEmpty || nb[0] == '.') {
      nb = '0$nb';
    }

    /// Zeros beyond
    if (nb.contains('.')) {
      nb = nb.replaceFirst(RegExp('0+\$'), '');
      if (nb[nb.length - 1] == '.') {
        nb = nb.substring(0, nb.length - 1);
      }
    }

    return nb;
  }
}
