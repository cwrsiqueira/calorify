import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/food_card/food_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'adicionar_widget.dart' show AdicionarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdicionarModel extends FlutterFlowModel<AdicionarWidget> {
  ///  Local state fields for this page.

  int? _caloriasTotaisRefeicao = 0;
  set caloriasTotaisRefeicao(int? value) {
    _caloriasTotaisRefeicao = value;
    debugLogWidgetClass(this);
  }

  int? get caloriasTotaisRefeicao => _caloriasTotaisRefeicao;

  int _caloriasTotaisAtividades = 0;
  set caloriasTotaisAtividades(int value) {
    _caloriasTotaisAtividades = value;
    debugLogWidgetClass(this);
  }

  int get caloriasTotaisAtividades => _caloriasTotaisAtividades;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomeRefeicao widget.
  FocusNode? nomeRefeicaoFocusNode;
  TextEditingController? nomeRefeicaoTextController;
  String? Function(BuildContext, String?)? nomeRefeicaoTextControllerValidator;
  String? _nomeRefeicaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? _formRefeicaoValidation;
  set formRefeicaoValidation(bool? value) {
    _formRefeicaoValidation = value;
    debugLogWidgetClass(this);
  }

  bool? get formRefeicaoValidation => _formRefeicaoValidation;

  // State field(s) for calorias widget.
  FocusNode? caloriasFocusNode;
  TextEditingController? caloriasTextController;
  String? Function(BuildContext, String?)? caloriasTextControllerValidator;
  // State field(s) for SelecionarAlimento widget.
  FocusNode? selecionarAlimentoFocusNode;
  TextEditingController? selecionarAlimentoTextController;
  String? Function(BuildContext, String?)?
      selecionarAlimentoTextControllerValidator;
  // Models for foodCard dynamic component.
  late FlutterFlowDynamicModels<FoodCardModel> foodCardModels;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    nomeRefeicaoTextControllerValidator = _nomeRefeicaoTextControllerValidator;
    foodCardModels = FlutterFlowDynamicModels(() => FoodCardModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    nomeRefeicaoFocusNode?.dispose();
    nomeRefeicaoTextController?.dispose();

    caloriasFocusNode?.dispose();
    caloriasTextController?.dispose();

    selecionarAlimentoFocusNode?.dispose();
    selecionarAlimentoTextController?.dispose();

    foodCardModels.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'caloriasTotaisRefeicao': debugSerializeParam(
            caloriasTotaisRefeicao,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Adicionar',
            searchReference:
                'reference=QiUKHwoWY2Fsb3JpYXNUb3RhaXNSZWZlaWNhbxIFdmYweXVyAggBUAFaFmNhbG9yaWFzVG90YWlzUmVmZWljYW9iCUFkaWNpb25hcg==',
            name: 'int',
            nullable: true,
          ),
          'caloriasTotaisAtividades': debugSerializeParam(
            caloriasTotaisAtividades,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Adicionar',
            searchReference:
                'reference=QikKIQoYY2Fsb3JpYXNUb3RhaXNBdGl2aWRhZGVzEgUwbXl2M3IECAEgAVABWhhjYWxvcmlhc1RvdGFpc0F0aXZpZGFkZXNiCUFkaWNpb25hcg==',
            name: 'int',
            nullable: false,
          )
        },
        widgetStates: {
          'nomeRefeicaoText': debugSerializeParam(
            nomeRefeicaoTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Adicionar',
            name: 'String',
            nullable: true,
          ),
          'caloriasText': debugSerializeParam(
            caloriasTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Adicionar',
            name: 'String',
            nullable: true,
          ),
          'selecionarAlimentoText': debugSerializeParam(
            selecionarAlimentoTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Adicionar',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'formRefeicaoValidation': debugSerializeParam(
            formRefeicaoValidation,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Adicionar',
            name: 'bool',
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
        dynamicComponentStates: {
          'foodCardModels (List<foodCard>)':
              foodCardModels?.toDynamicWidgetClassDebugData(),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/calorias-diarias-i42yke/tab=uiBuilder&page=Adicionar',
        searchReference: 'reference=OglBZGljaW9uYXJQAVoJQWRpY2lvbmFy',
        widgetClassName: 'Adicionar',
      );
}
