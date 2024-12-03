import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "idade" field.
  int? _idade;
  int get idade => _idade ?? 0;
  bool hasIdade() => _idade != null;

  // "peso" field.
  double? _peso;
  double get peso => _peso ?? 0.0;
  bool hasPeso() => _peso != null;

  // "sexo" field.
  String? _sexo;
  String get sexo => _sexo ?? '';
  bool hasSexo() => _sexo != null;

  // "atividade_fisica" field.
  String? _atividadeFisica;
  String get atividadeFisica => _atividadeFisica ?? '';
  bool hasAtividadeFisica() => _atividadeFisica != null;

  // "data_objetivo" field.
  DateTime? _dataObjetivo;
  DateTime? get dataObjetivo => _dataObjetivo;
  bool hasDataObjetivo() => _dataObjetivo != null;

  // "peso_objetivo" field.
  double? _pesoObjetivo;
  double get pesoObjetivo => _pesoObjetivo ?? 0.0;
  bool hasPesoObjetivo() => _pesoObjetivo != null;

  // "gasto_calorico_diario" field.
  int? _gastoCaloricoDiario;
  int get gastoCaloricoDiario => _gastoCaloricoDiario ?? 0;
  bool hasGastoCaloricoDiario() => _gastoCaloricoDiario != null;

  // "altura" field.
  int? _altura;
  int get altura => _altura ?? 0;
  bool hasAltura() => _altura != null;

  // "meta_calorica_diaria" field.
  int? _metaCaloricaDiaria;
  int get metaCaloricaDiaria => _metaCaloricaDiaria ?? 0;
  bool hasMetaCaloricaDiaria() => _metaCaloricaDiaria != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _idade = castToType<int>(snapshotData['idade']);
    _peso = castToType<double>(snapshotData['peso']);
    _sexo = snapshotData['sexo'] as String?;
    _atividadeFisica = snapshotData['atividade_fisica'] as String?;
    _dataObjetivo = snapshotData['data_objetivo'] as DateTime?;
    _pesoObjetivo = castToType<double>(snapshotData['peso_objetivo']);
    _gastoCaloricoDiario =
        castToType<int>(snapshotData['gasto_calorico_diario']);
    _altura = castToType<int>(snapshotData['altura']);
    _metaCaloricaDiaria = castToType<int>(snapshotData['meta_calorica_diaria']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
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
        'email': debugSerializeParam(
          email,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'display_name': debugSerializeParam(
          displayName,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'photo_url': debugSerializeParam(
          photoUrl,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'uid': debugSerializeParam(
          uid,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'created_time': debugSerializeParam(
          createdTime,
          ParamType.DateTime,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'DateTime',
          nullable: true,
        ),
        'phone_number': debugSerializeParam(
          phoneNumber,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'idade': debugSerializeParam(
          idade,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        ),
        'peso': debugSerializeParam(
          peso,
          ParamType.double,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'double',
          nullable: false,
        ),
        'sexo': debugSerializeParam(
          sexo,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'atividade_fisica': debugSerializeParam(
          atividadeFisica,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'String',
          nullable: false,
        ),
        'data_objetivo': debugSerializeParam(
          dataObjetivo,
          ParamType.DateTime,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'DateTime',
          nullable: true,
        ),
        'peso_objetivo': debugSerializeParam(
          pesoObjetivo,
          ParamType.double,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'double',
          nullable: false,
        ),
        'gasto_calorico_diario': debugSerializeParam(
          gastoCaloricoDiario,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        ),
        'altura': debugSerializeParam(
          altura,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        ),
        'meta_calorica_diaria': debugSerializeParam(
          metaCaloricaDiaria,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=database',
          name: 'int',
          nullable: false,
        )
      };
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? idade,
  double? peso,
  String? sexo,
  String? atividadeFisica,
  DateTime? dataObjetivo,
  double? pesoObjetivo,
  int? gastoCaloricoDiario,
  int? altura,
  int? metaCaloricaDiaria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'idade': idade,
      'peso': peso,
      'sexo': sexo,
      'atividade_fisica': atividadeFisica,
      'data_objetivo': dataObjetivo,
      'peso_objetivo': pesoObjetivo,
      'gasto_calorico_diario': gastoCaloricoDiario,
      'altura': altura,
      'meta_calorica_diaria': metaCaloricaDiaria,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.idade == e2?.idade &&
        e1?.peso == e2?.peso &&
        e1?.sexo == e2?.sexo &&
        e1?.atividadeFisica == e2?.atividadeFisica &&
        e1?.dataObjetivo == e2?.dataObjetivo &&
        e1?.pesoObjetivo == e2?.pesoObjetivo &&
        e1?.gastoCaloricoDiario == e2?.gastoCaloricoDiario &&
        e1?.altura == e2?.altura &&
        e1?.metaCaloricaDiaria == e2?.metaCaloricaDiaria;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.idade,
        e?.peso,
        e?.sexo,
        e?.atividadeFisica,
        e?.dataObjetivo,
        e?.pesoObjetivo,
        e?.gastoCaloricoDiario,
        e?.altura,
        e?.metaCaloricaDiaria
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
