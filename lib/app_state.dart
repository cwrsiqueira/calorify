import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _gastoPassivoCalorias =
          prefs.getInt('ff_gastoPassivoCalorias') ?? _gastoPassivoCalorias;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _gastoPassivoCalorias = 0;
  int get gastoPassivoCalorias => _gastoPassivoCalorias;
  set gastoPassivoCalorias(int value) {
    _gastoPassivoCalorias = value;
    prefs.setInt('ff_gastoPassivoCalorias', value);
    debugLogAppState(this);
  }

  Map<String, DebugDataField> toDebugSerializableMap() => {
        'gastoPassivoCalorias': debugSerializeParam(
          gastoPassivoCalorias,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiYKIAoUZ2FzdG9QYXNzaXZvQ2Fsb3JpYXMSCGJoY2t4M3FmcgIIAVoUZ2FzdG9QYXNzaXZvQ2Fsb3JpYXM=',
          name: 'int',
          nullable: false,
        )
      };
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
