extension StringExt on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String lastCharacters(int nbCharacters) {
    return substring(length - nbCharacters);
  }
}
