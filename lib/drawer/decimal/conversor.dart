class ConversorBases {
  static String toBinary(int value) {
    var lista = [];
    int i = 0;

    while (value > 0) {
      lista.add((value % 2).toString());
      value = (value ~/ 2);
      i++;
    }

    var binary = lista.reversed.toString();
    return binary
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(',', '')
        .replaceAll(' ', '');
  }

  static String toHexadecimal(int value) {
    var lista = [];
    int i = 0;

    while (value > 0) {
      lista.add(value % 16);
      value = (value ~/ 16);
      i++;
    }
    var hexadecimal = lista.reversed.toString();
    return hexadecimal
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(',', '')
        .replaceAll(' ', '')
        .replaceAll('10', 'A')
        .replaceAll('11', 'B')
        .replaceAll('12', 'C')
        .replaceAll('13', 'D')
        .replaceAll('14', 'E')
        .replaceAll('15', 'F');
  }

  static String toOcta(int value) {
    var lista = [];
    int i = 0;

    while (value > 0) {
      lista.add((value % 8).toString());
      value = (value ~/ 8);
      i++;
    }

    var octa = lista.reversed.toString();
    return octa
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(',', '')
        .replaceAll(' ', '');
  }
}
