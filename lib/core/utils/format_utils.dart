extension PriceFormatter on double {
  String toVnd() {
    final value = toStringAsFixed(0);
    final formatted = value.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );
    return '$formattedđ';
  }
}
