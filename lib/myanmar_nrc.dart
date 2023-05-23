library myanmar_nrc;

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:myanmar_nrc/models/nrc_state.dart';
import 'package:myanmar_nrc/models/nrc_township.dart';
import 'package:myanmar_nrc/models/nrc_type.dart';
export 'package:myanmar_nrc/models/nrc_state.dart';
export 'package:myanmar_nrc/models/nrc_township.dart';
export 'package:myanmar_nrc/models/nrc_type.dart';

class MyanmarNRC {
  const MyanmarNRC._internal();
  static const _instance = MyanmarNRC._internal();

  static bool _isInitialized = false;
  static Future<MyanmarNRC> get intstance async {
    if (!_isInitialized) {
      await _loadRawData();
      _isInitialized = true;
    }
    return _instance;
  }

  static late final Map<String, dynamic> _rawData;
  static Future<void> _loadRawData() async {
    final source = await rootBundle.loadString('assets/NRC_Data.min.json');
    _rawData = json.decode(source);
    _parseNRCTypes();
    _parseNRCStates();
    _parseNRCTownships();
  }

  NRCType nrcTypeById(String id) => _nrcTypesHasMap[id]!;

  NRCState nrcStateById(String id) => _nrcStatesHashMap[id]!;

  NRCTownship nrcTownshipById(String id) => _nrcTownshipsHashMap[id]!;

  List<NRCTownship> nrctTownshipsByStateId(String id) =>
      _nrcTownshipsByStateIdHasMap[id] ?? const [];

  static const String _nrcTypesKey = "nrcTypes";
  static const String _nrcStatesKey = "nrcStates";
  static const String _nrcTownshipsKey = "nrcTownships";

  static late Map<String, NRCType> _nrcTypesHasMap;
  Iterable<NRCType> get nrcTypes => _nrcTypesHasMap.values;

  static void _parseNRCTypes() {
    _nrcTypesHasMap = _parseObjects(
      key: _nrcTypesKey,
      decoder: NRCType.fromMap,
      hashMap: _nrcTypesHasMap,
    );
  }

  static late Map<String, NRCState> _nrcStatesHashMap;
  Iterable<NRCState> get nrcStates => _nrcStatesHashMap.values;

  static void _parseNRCStates() {
    _nrcStatesHashMap = _parseObjects<NRCState>(
      key: _nrcStatesKey,
      decoder: NRCState.fromMap,
      hashMap: _nrcStatesHashMap,
    );
  }

  static late Map<String, NRCTownship> _nrcTownshipsHashMap;
  static late Map<String, List<NRCTownship>> _nrcTownshipsByStateIdHasMap;
  Iterable<NRCTownship> get nrcTownships => _nrcTownshipsHashMap.values;

  static void _parseNRCTownships() {
    _nrcTownshipsHashMap = _parseObjects<NRCTownship>(
      key: _nrcTownshipsKey,
      decoder: NRCTownship.fromMap,
      hashMap: _nrcTownshipsHashMap,
      interceptor: (object) {
        final stateId = object.stateId;
        if (!_nrcTownshipsByStateIdHasMap.containsKey(stateId)) {
          _nrcTownshipsByStateIdHasMap[stateId] = [];
        }
        _nrcTownshipsByStateIdHasMap[stateId]!.add(object);
      },
    );
  }

  /// To improve performance, will only loop iterable for one time
  static Map<String, T> _parseObjects<T>({
    required String key,
    required JsonDecoder<T> decoder,
    required Map<String, T> hashMap,
    Interceptor<T>? interceptor,
  }) {
    final jsons = _rawData[key] as List;

    for (int i = 0; i < jsons.length; i++) {
      final map = jsons[i] as Map<String, dynamic>;
      final object = decoder(map);
      interceptor?.call(object);
      hashMap[map["id"]] = object;
    }

    return hashMap;
  }
}

typedef JsonDecoder<T> = T Function(Map<String, dynamic>);
typedef Interceptor<T> = void Function(T);
