/// Enum for the operation
enum Operator { add, sub, multiply, divide }

/// Enum to know the state of the operation
/// States normal lifecycle (no AC): nb1 -> operator -> nb2 -> nb1
enum OperationState { nb1, operator, nb2 }

class CalculatorService {
  double? calculation(double nb1, Operator ope, double nb2) {
    switch (ope) {
      case Operator.add:
        return nb1 + nb2;
      case Operator.sub:
        return nb1 - nb2;
      case Operator.multiply:
        return nb1 * nb2;
      case Operator.divide:
        return nb2 == 0 ? null : nb1 / nb2;
    }
  }
}
