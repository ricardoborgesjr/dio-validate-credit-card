bool validate(String number) {
  // Remove espaços, traços e outros caracteres não numéricos
  number = number.replaceAll(RegExp(r'\D'), '');

  // Verifica se o número contém apenas dígitos
  if (!RegExp(r'^\d+$').hasMatch(number)) {
    return false;
  }

  // Algoritmo de Luhn
  int sum = 0;
  bool alternate = false;
  for (int i = number.length - 1; i >= 0; i--) {
    int n = int.parse(number[i]);
    if (alternate) {
      n *= 2;
      if (n > 9) {
        n -= 9;
      }
    }
    sum += n;
    alternate = !alternate;
  }

  return (sum % 10 == 0);
}

String getCardType(String number) {
  // Remove espaços, traços e outros caracteres não numéricos
  number = number.replaceAll(RegExp(r'\D'), '');

  if (RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$').hasMatch(number)) {
    return 'Visa';
  } else if (RegExp(r'^5[1-5][0-9]{14}$').hasMatch(number)) {
    return 'MasterCard';
  } else if (RegExp(r'^3[47][0-9]{13}$').hasMatch(number)) {
    return 'American Express';
  } else if (RegExp(r'^3(?:0[0-5]|[68][0-9])[0-9]{11}$').hasMatch(number)) {
    return 'Diners Club';
  } else if (RegExp(r'^6(?:011|5[0-9]{2})[0-9]{12}$').hasMatch(number)) {
    return 'Discover';
  } else if (RegExp(r'^(?:2014|2149)').hasMatch(number)) {
    return 'EnRoute';
  } else if (RegExp(r'^(?:2131|1800|35\d{3})\d{11}$').hasMatch(number)) {
    return 'JCB';
  } else if (RegExp(r'^8699[0-9]{11}$').hasMatch(number)) {
    return 'Voyager';
  } else if (RegExp(r'^606282|^3841(?:0|4|6)0').hasMatch(number)) {
    return 'HiperCard';
  } else if (RegExp(r'^50[0-9]{14,17}$').hasMatch(number)) {
    return 'Aura';
  } else {
    return 'Unknown';
  }
}
