import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodsRecord extends FirestoreRecord {
  FoodsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "food_subcategory" field.
  DocumentReference? _foodSubcategory;
  DocumentReference? get foodSubcategory => _foodSubcategory;
  bool hasFoodSubcategory() => _foodSubcategory != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "measure" field.
  String? _measure;
  String get measure => _measure ?? '';
  bool hasMeasure() => _measure != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  bool hasWeight() => _weight != null;

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "subcategory_id" field.
  int? _subcategoryId;
  int get subcategoryId => _subcategoryId ?? 0;
  bool hasSubcategoryId() => _subcategoryId != null;

  void _initializeFields() {
    _foodSubcategory = snapshotData['food_subcategory'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _measure = snapshotData['measure'] as String?;
    _weight = snapshotData['weight'] as String?;
    _calories = castToType<int>(snapshotData['calories']);
    _id = castToType<int>(snapshotData['id']);
    _subcategoryId = castToType<int>(snapshotData['subcategory_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Foods');

  static Stream<FoodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodsRecord.fromSnapshot(s));

  static Future<FoodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodsRecord.fromSnapshot(s));

  static FoodsRecord fromSnapshot(DocumentSnapshot snapshot) => FoodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodsRecord &&
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
        'food_subcategory': debugSerializeParam(
          foodSubcategory,
          ParamType.DocumentReference,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'food_subcategory',
          nullable: true,
        ),
        'name': debugSerializeParam(
          name,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'measure': debugSerializeParam(
          measure,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'weight': debugSerializeParam(
          weight,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'calories': debugSerializeParam(
          calories,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        ),
        'id': debugSerializeParam(
          id,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        ),
        'subcategory_id': debugSerializeParam(
          subcategoryId,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        )
      };
}

Map<String, dynamic> createFoodsRecordData({
  DocumentReference? foodSubcategory,
  String? name,
  String? measure,
  String? weight,
  int? calories,
  int? id,
  int? subcategoryId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'food_subcategory': foodSubcategory,
      'name': name,
      'measure': measure,
      'weight': weight,
      'calories': calories,
      'id': id,
      'subcategory_id': subcategoryId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodsRecordDocumentEquality implements Equality<FoodsRecord> {
  const FoodsRecordDocumentEquality();

  @override
  bool equals(FoodsRecord? e1, FoodsRecord? e2) {
    return e1?.foodSubcategory == e2?.foodSubcategory &&
        e1?.name == e2?.name &&
        e1?.measure == e2?.measure &&
        e1?.weight == e2?.weight &&
        e1?.calories == e2?.calories &&
        e1?.id == e2?.id &&
        e1?.subcategoryId == e2?.subcategoryId;
  }

  @override
  int hash(FoodsRecord? e) => const ListEquality().hash([
        e?.foodSubcategory,
        e?.name,
        e?.measure,
        e?.weight,
        e?.calories,
        e?.id,
        e?.subcategoryId
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodsRecord;
}
