import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefeicoesRecord extends FirestoreRecord {
  RefeicoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "calorias" field.
  int? _calorias;
  int get calorias => _calorias ?? 0;
  bool hasCalorias() => _calorias != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _calorias = castToType<int>(snapshotData['calorias']);
    _data = snapshotData['data'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('refeicoes');

  static Stream<RefeicoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefeicoesRecord.fromSnapshot(s));

  static Future<RefeicoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RefeicoesRecord.fromSnapshot(s));

  static RefeicoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RefeicoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefeicoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefeicoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefeicoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RefeicoesRecord &&
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
        'nome': debugSerializeParam(
          nome,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'calorias': debugSerializeParam(
          calorias,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        ),
        'data': debugSerializeParam(
          data,
          ParamType.DateTime,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'DateTime',
          nullable: true,
        ),
        'user': debugSerializeParam(
          user,
          ParamType.DocumentReference,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'users',
          nullable: true,
        )
      };
}

Map<String, dynamic> createRefeicoesRecordData({
  String? nome,
  int? calorias,
  DateTime? data,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'calorias': calorias,
      'data': data,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class RefeicoesRecordDocumentEquality implements Equality<RefeicoesRecord> {
  const RefeicoesRecordDocumentEquality();

  @override
  bool equals(RefeicoesRecord? e1, RefeicoesRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.calorias == e2?.calorias &&
        e1?.data == e2?.data &&
        e1?.user == e2?.user;
  }

  @override
  int hash(RefeicoesRecord? e) =>
      const ListEquality().hash([e?.nome, e?.calorias, e?.data, e?.user]);

  @override
  bool isValidKey(Object? o) => o is RefeicoesRecord;
}
