import 'package:myanmar_nrc/models/nrc_localized.dart';

class NRCTownship {
  final String id;
  final String code;
  final String stateId;
  final String stateCode;
  final NRCLocalizedText shortName;
  final NRCLocalizedText name;

  const NRCTownship({
    required this.id,
    required this.code,
    required this.stateId,
    required this.stateCode,
    required this.shortName,
    required this.name,
  });

  factory NRCTownship.fromMap(Map<String, dynamic> map) {
    return NRCTownship(
      id: map["id"],
      code: map["code"],
      stateId: map["stateId"],
      stateCode: map["stateCode"],
      shortName: NRCLocalizedText.fromMap(map["short"]),
      name: NRCLocalizedText.fromMap(map["name"]),
    );
  }
}
