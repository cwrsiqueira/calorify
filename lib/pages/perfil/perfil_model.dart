import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'perfil_widget.dart' show PerfilWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  Local state fields for this page.

  DateTime? _dataObjetivo;
  set dataObjetivo(DateTime? value) {
    _dataObjetivo = value;
    debugLogWidgetClass(this);
  }

  DateTime? get dataObjetivo => _dataObjetivo;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for peso widget.
  FocusNode? pesoFocusNode;
  TextEditingController? pesoTextController;
  String? Function(BuildContext, String?)? pesoTextControllerValidator;
  // State field(s) for altura widget.
  FocusNode? alturaFocusNode;
  TextEditingController? alturaTextController;
  String? Function(BuildContext, String?)? alturaTextControllerValidator;
  // State field(s) for idade widget.
  FocusNode? idadeFocusNode;
  TextEditingController? idadeTextController;
  String? Function(BuildContext, String?)? idadeTextControllerValidator;
  // State field(s) for sexoBiologico widget.
  String? _sexoBiologicoValue;
  set sexoBiologicoValue(String? value) {
    _sexoBiologicoValue = value;
    debugLogWidgetClass(this);
  }

  String? get sexoBiologicoValue => _sexoBiologicoValue;

  FormFieldController<String>? sexoBiologicoValueController;
  // State field(s) for atividadeFisica widget.
  String? _atividadeFisicaValue;
  set atividadeFisicaValue(String? value) {
    _atividadeFisicaValue = value;
    debugLogWidgetClass(this);
  }

  String? get atividadeFisicaValue => _atividadeFisicaValue;

  FormFieldController<String>? atividadeFisicaValueController;
  DateTime? datePicked;
  // State field(s) for pesoObjetivo widget.
  FocusNode? pesoObjetivoFocusNode;
  TextEditingController? pesoObjetivoTextController;
  String? Function(BuildContext, String?)? pesoObjetivoTextControllerValidator;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    pesoFocusNode?.dispose();
    pesoTextController?.dispose();

    alturaFocusNode?.dispose();
    alturaTextController?.dispose();

    idadeFocusNode?.dispose();
    idadeTextController?.dispose();

    pesoObjetivoFocusNode?.dispose();
    pesoObjetivoTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'dataObjetivo': debugSerializeParam(
            dataObjetivo,
            ParamType.DateTime,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Perfil',
            searchReference:
                'reference=QhsKFQoMZGF0YU9iamV0aXZvEgVzeHZvY3ICCAhQAVoMZGF0YU9iamV0aXZvYgZQZXJmaWw=',
            name: 'DateTime',
            nullable: true,
          )
        },
        widgetStates: {
          'nomeText': debugSerializeParam(
            nomeTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Perfil',
            name: 'String',
            nullable: true,
          ),
          'pesoText': debugSerializeParam(
            pesoTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Perfil',
            name: 'String',
            nullable: true,
          ),
          'alturaText': debugSerializeParam(
            alturaTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Perfil',
            name: 'String',
            nullable: true,
          ),
          'idadeText': debugSerializeParam(
            idadeTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Perfil',
            name: 'String',
            nullable: true,
          ),
          'sexoBiologicoValue': debugSerializeParam(
            sexoBiologicoValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Perfil',
            name: 'String',
            nullable: true,
          ),
          'atividadeFisicaValue': debugSerializeParam(
            atividadeFisicaValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Perfil',
            name: 'String',
            nullable: true,
          ),
          'pesoObjetivoText': debugSerializeParam(
            pesoObjetivoTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Perfil',
            name: 'String',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/calorias-diarias-i42yke/tab=uiBuilder&page=Perfil',
        searchReference: 'reference=OgZQZXJmaWxQAVoGUGVyZmls',
        widgetClassName: 'Perfil',
      );
}
