import 'package:dio_validate_credit_card/dio_validate_credit_card.dart'
    as dio_validate_credit_card;

void main() {
  List<String> cardNumbers = [
    '4532 6509 2656 0914', // Visa
    '5574 4396 2665 2544 ', // MasterCard
    '3724 645389 09845 ', // American Express
    '3016 405439 5239', // Diners Club
    '6011 2436 7440 8562', // Discover
    '2014 3869369 1791', // EnRoute
    '3502 5849 2960 1342', // JCB
    '86992 6049 13188 7', // Voyager
    '6062 8262 6689 4195', // HiperCard
    '5056 4046 8290 1844' // Aura
  ];

  for (String cardNumber in cardNumbers) {
    bool isValid = dio_validate_credit_card.validate(cardNumber);
    String cardType = dio_validate_credit_card.getCardType(cardNumber);
    print('Card number $cardNumber is valid: $isValid, Card type: $cardType');
  }
}
