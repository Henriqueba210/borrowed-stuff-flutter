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
    String isEmptyTextResult = isEmptyText(text);

    if (isEmptyTextResult != null) return isEmptyTextResult;
    if (!RegExp(
            r'^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$')
        .hasMatch(text)) return 'Número de telefone inválido';

    return null;
  }

  static String isBorrowedDateValid(DateTime dateTime) {
    String isEmptyDateResult = isEmptyDate(dateTime);
    if (isEmptyDateResult != null) return isEmptyDateResult;
    if (dateTime.isAfter(DateTime.now()))
      return "A data deve ser menor ou igual a data de hoje";
    return null;
  }
}
