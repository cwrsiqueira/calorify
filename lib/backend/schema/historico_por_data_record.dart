import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoricoPorDataRecord extends FirestoreRecord {
  HistoricoPorDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "gasto_calorico_diario" field.
  int? _gastoCaloricoDiario;
  int get gastoCaloricoDiario => _gastoCaloricoDiario ?? 0;
  bool hasGastoCaloricoDiario() => _gastoCaloricoDiario != null;

  // "consumo_calorias" field.
  int? _consumoCalorias;
  int get consumoCalorias => _consumoCalorias ?? 0;
  bool hasConsumoCalorias() => _consumoCalorias != null;

  // "saldo_calorias" field.
  int? _saldoCalorias;
  int get saldoCalorias => _saldoCalorias ?? 0;
  bool hasSaldoCalorias() => _saldoCalorias != null;

  // "meta_diaria" field.
  int? _metaDiaria;
  int get metaDiaria => _metaDiaria ?? 0;
  bool hasMetaDiaria() => _metaDiaria != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _data = snapshotData['data'] as DateTime?;
    _gastoCaloricoDiario =
        castToType<int>(snapshotData['gasto_calorico_diario']);
    _consumoCalorias = castToType<int>(snapshotData['consumo_calorias']);
    _saldoCalorias = castToType<int>(snapshotData['saldo_calorias']);
    _metaDiaria = castToType<int>(snapshotData['meta_diaria']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('historico_por_data');

  static Stream<HistoricoPorDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoricoPorDataRecord.fromSnapshot(s));

  static Future<HistoricoPorDataRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HistoricoPorDataRecord.fromSnapshot(s));

  static HistoricoPorDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoricoPorDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoricoPorDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoricoPorDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoricoPorDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoricoPorDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;

  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'reference': debugSerializeParam(
          reference,
          ParamType.DocumentReference,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: '',
          nullable: false,
        ),
        'user': debugSerializeParam(
          user,
          ParamType.DocumentReference,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'users',
          nullable: true,
        ),
        'data': debugSerializeParam(
          data,
          ParamType.DateTime,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'DateTime',
          nullable: true,
        ),
        'gasto_calorico_diario': debugSerializeParam(
          gastoCaloricoDiario,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        ),
        'consumo_calorias': debugSerializeParam(
          consumoCalorias,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        ),
        'saldo_calorias': debugSerializeParam(
          saldoCalorias,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        ),
        'meta_diaria': debugSerializeParam(
          metaDiaria,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        )
      };
}

Map<String, dynamic> createHistoricoPorDataRecordData({
  DocumentReference? user,
  DateTime? data,
  int? gastoCaloricoDiario,
  int? consumoCalorias,
  int? saldoCalorias,
  int? metaDiaria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'data': data,
      'gasto_calorico_diario': gastoCaloricoDiario,
      'consumo_calorias': consumoCalorias,
      'saldo_calorias': saldoCalorias,
      'meta_diaria': metaDiaria,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoricoPorDataRecordDocumentEquality
    implements Equality<HistoricoPorDataRecord> {
  const HistoricoPorDataRecordDocumentEquality();

  @override
  bool equals(HistoricoPorDataRecord? e1, HistoricoPorDataRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.data == e2?.data &&
        e1?.gastoCaloricoDiario == e2?.gastoCaloricoDiario &&
        e1?.consumoCalorias == e2?.consumoCalorias &&
        e1?.saldoCalorias == e2?.saldoCalorias &&
        e1?.metaDiaria == e2?.metaDiaria;
  }

  @override
  int hash(HistoricoPorDataRecord? e) => const ListEquality().hash([
        e?.user,
        e?.data,
        e?.gastoCaloricoDiario,
        e?.consumoCalorias,
        e?.saldoCalorias,
        e?.metaDiaria
      ]);

  @override
  bool isValidKey(Object? o) => o is HistoricoPorDataRecord;
}
