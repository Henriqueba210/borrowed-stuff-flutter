class Validator {
  static String isEmptyText(String text) {
    if (text.isEmpty) return 'Campo obrigatório';

    return null;
  }

  static String isEmptyDate(DateTime dateTime) {
    if (dateTime == null) return 'Campo obrigatório';

    return null;
  }

  static String isPhoneValid(String text) {
    String isTextEmpty = isEmptyText(text);

    if (isTextEmpty != null) return isTextEmpty;
    if (!RegExp(r'^\([1-9]{2}\) [9]{0,1}[6-9]{1}[0-9]{3}\-[0-9]{4}$')
        .hasMatch(text)) return 'Número de telefone inválido';

    return null;
  }
}
