import 'package:myanmar_nrc/models/nrc_localized.dart';

class NRCType {
  final String id;
  final NRCLocalizedText name;

  const NRCType({
    required this.id,
    required this.name,
  });

  factory NRCType.fromMap(Map<String, dynamic> map) {
    return NRCType(
      id: map['id'] as String,
      name: NRCLocalizedText.fromMap(map['name'] as Map<String, dynamic>),
    );
  }
}
