import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myanmar_nrc/myanmar_nrc.dart';

void main() async {
  late MyanmarNRC myanmarNRC;
  test("Initialize", () async {
    WidgetsFlutterBinding.ensureInitialized();
    myanmarNRC = await MyanmarNRC.intstance;
  });

  String? stateId;
  test("Get States", () async {
    final value = myanmarNRC.nrcStates;
    stateId = value.first.id;
  });

  test("Get Townships", () async {
    myanmarNRC.nrcTownships;
  });

  test("Get Types", () async {
    myanmarNRC.nrcTypes;
  });

  test("Get TSs by State ID", () async {
    final value = myanmarNRC.nrctTownshipsByStateId(stateId!);
    print(value);
  });
}
