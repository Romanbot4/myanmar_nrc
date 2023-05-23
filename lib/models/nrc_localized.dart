class NRCLocalizedText {
  final String mm;
  final String en;

  const NRCLocalizedText({
    required this.mm,
    required this.en,
  });

  factory NRCLocalizedText.fromMap(Map<String, dynamic> map) {
    return NRCLocalizedText(
      en: map['en'] as String,
      mm: map['mm'] as String,
    );
  }
}
