enum Operator { add, sub, multiply, divide }

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
