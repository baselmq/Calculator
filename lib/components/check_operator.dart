String checkOperator(String operator) {
  switch (operator) {
    case '(':
      return "assets/icons/bracket1.svg";
    case ')':
      return "assets/icons/bracket2.svg";
    case '/':
      return "assets/icons/division.svg";
    case '.':
      return "assets/icons/dot.svg";
    case '=':
      return "assets/icons/equal.svg";
    // case '!':
    //   return "assets/icons/exclamation.svg";
    case '-':
      return "assets/icons/minus.svg";
    case '*':
      return "assets/icons/multiply.svg";
    case '%':
      return "assets/icons/percentage.svg";
    case 'pi':
      return "assets/icons/pi.svg";
    case '+':
      return "assets/icons/plus.svg";
    case '^':
      return "assets/icons/power.svg";
    case 'sqrt(':
      return "assets/icons/sqrt.svg";
  }
  return operator;
}

bool isOperator(String x) {
  if (x == '(' ||
      x == ')' ||
      x == '/' ||
      // x == '.' ||
      x == '=' ||
      // x == '!' ||
      x == '-' ||
      x == '*' ||
      x == '%' ||
      x == 'pi' ||
      x == '+' ||
      x == '^' ||
      x == 'sqrt(') {
    return true;
  }
  return false;
}

String removeBracket(String operator) {
  switch (operator) {
    case 'sqrt(':
      return "sqrt";
    case 'sin(':
      return "sin";
    case 'cos(':
      return "cos";
    case 'tan(':
      return "tan";
    case 'ln(':
      return "ln";
    case 'log(':
      return "log";
  }
  return operator;
}
