import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodSubcategoryRecord extends FirestoreRecord {
  FoodSubcategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "food_category" field.
  DocumentReference? _foodCategory;
  DocumentReference? get foodCategory => _foodCategory;
  bool hasFoodCategory() => _foodCategory != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "category_id" field.
  int? _categoryId;
  int get categoryId => _categoryId ?? 0;
  bool hasCategoryId() => _categoryId != null;

  void _initializeFields() {
    _foodCategory = snapshotData['food_category'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _url = snapshotData['url'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _categoryId = castToType<int>(snapshotData['category_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('food_subcategory');

  static Stream<FoodSubcategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodSubcategoryRecord.fromSnapshot(s));

  static Future<FoodSubcategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodSubcategoryRecord.fromSnapshot(s));

  static FoodSubcategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodSubcategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodSubcategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodSubcategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodSubcategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodSubcategoryRecord &&
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
        'food_category': debugSerializeParam(
          foodCategory,
          ParamType.DocumentReference,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'food_category',
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
        'url': debugSerializeParam(
          url,
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
        ),
        'category_id': debugSerializeParam(
          categoryId,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        )
      };
}

Map<String, dynamic> createFoodSubcategoryRecordData({
  DocumentReference? foodCategory,
  String? name,
  String? url,
  int? id,
  int? categoryId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'food_category': foodCategory,
      'name': name,
      'url': url,
      'id': id,
      'category_id': categoryId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodSubcategoryRecordDocumentEquality
    implements Equality<FoodSubcategoryRecord> {
  const FoodSubcategoryRecordDocumentEquality();

  @override
  bool equals(FoodSubcategoryRecord? e1, FoodSubcategoryRecord? e2) {
    return e1?.foodCategory == e2?.foodCategory &&
        e1?.name == e2?.name &&
        e1?.url == e2?.url &&
        e1?.id == e2?.id &&
        e1?.categoryId == e2?.categoryId;
  }

  @override
  int hash(FoodSubcategoryRecord? e) => const ListEquality()
      .hash([e?.foodCategory, e?.name, e?.url, e?.id, e?.categoryId]);

  @override
  bool isValidKey(Object? o) => o is FoodSubcategoryRecord;
}
