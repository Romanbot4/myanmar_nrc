class NRCForm {
  final String stateNo;
  final String townshipCode;
  final String nrcType;
  final String nrcNumber;

  const NRCForm({
    required this.stateNo,
    required this.townshipCode,
    required this.nrcType,
    required this.nrcNumber,
  });

  static NRCForm? parse(String text) {
    text = text.replaceAll(RegExp(r"\s+"), "");
    final pattern = RegExp(r"(\/|\(|\))");
    final splitted = text.split(pattern);

    final stateNo = splitted[0];
    final townshipCode = splitted[1];
    final nrcType = splitted[2];
    final nrcNumber = splitted[3];

    return NRCForm(
      stateNo: stateNo,
      townshipCode: townshipCode,
      nrcType: nrcType,
      nrcNumber: nrcNumber,
    );
  }
}
