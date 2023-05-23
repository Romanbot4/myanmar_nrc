import 'package:myanmar_nrc/models/nrc_localized.dart';

class NRCState {
  final String id;
  final String code;
  final NRCLocalizedText number;
  final NRCLocalizedText name;

  const NRCState({
    required this.id,
    required this.code,
    required this.number,
    required this.name,
  });

  factory NRCState.fromMap(Map<String, dynamic> map) {
    return NRCState(
      id: map["id"] as String,
      code: map["code"] as String,
      number: NRCLocalizedText.fromMap(map['number']),
      name: NRCLocalizedText.fromMap(map["name"]),
    );
  }
}
