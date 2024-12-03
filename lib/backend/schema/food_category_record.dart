import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodCategoryRecord extends FirestoreRecord {
  FoodCategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('food_category');

  static Stream<FoodCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodCategoryRecord.fromSnapshot(s));

  static Future<FoodCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodCategoryRecord.fromSnapshot(s));

  static FoodCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodCategoryRecord &&
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
        'name': debugSerializeParam(
          name,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'id': debugSerializeParam(
          id,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        )
      };
}

Map<String, dynamic> createFoodCategoryRecordData({
  String? name,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodCategoryRecordDocumentEquality
    implements Equality<FoodCategoryRecord> {
  const FoodCategoryRecordDocumentEquality();

  @override
  bool equals(FoodCategoryRecord? e1, FoodCategoryRecord? e2) {
    return e1?.name == e2?.name && e1?.id == e2?.id;
  }

  @override
  int hash(FoodCategoryRecord? e) =>
      const ListEquality().hash([e?.name, e?.id]);

  @override
  bool isValidKey(Object? o) => o is FoodCategoryRecord;
}
