import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'food_card_widget.dart' show FoodCardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodCardModel extends FlutterFlowModel<FoodCardWidget> {
  ///  Local state fields for this component.

  int _totalPorcoes = 0;
  set totalPorcoes(int value) {
    _totalPorcoes = value;
    debugLogWidgetClass(this);
  }

  int get totalPorcoes => _totalPorcoes;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? _countControllerValue;
  set countControllerValue(int? value) {
    _countControllerValue = value;
    debugLogWidgetClass(this);
  }

  int? get countControllerValue => _countControllerValue;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'nome': debugSerializeParam(
            widget?.nome,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=foodCard',
            searchReference:
                'reference=ShYKDgoEbm9tZRIGcDlwcWg1cgQIAyABUABaBG5vbWU=',
            name: 'String',
            nullable: true,
          ),
          'calorias': debugSerializeParam(
            widget?.calorias,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=foodCard',
            searchReference:
                'reference=ShgKEgoIY2Fsb3JpYXMSBnIyZndvcnICCAFQAFoIY2Fsb3JpYXM=',
            name: 'int',
            nullable: true,
          ),
          'porcao': debugSerializeParam(
            widget?.porcao,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=foodCard',
            searchReference:
                'reference=ShYKEAoGcG9yY2FvEgZqNXZsZXhyAggDUABaBnBvcmNhbw==',
            name: 'String',
            nullable: true,
          ),
          'peso': debugSerializeParam(
            widget?.peso,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=foodCard',
            searchReference:
                'reference=ShQKDgoEcGVzbxIGaTYzYXE3cgIIA1AAWgRwZXNv',
            name: 'String',
            nullable: true,
          ),
          'resultTotalCalorias': debugSerializeParam(
            widget?.resultTotalCalorias,
            ParamType.Action,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=foodCard',
            searchReference:
                'reference=SkwKHQoTcmVzdWx0VG90YWxDYWxvcmlhcxIGcGVoNDljcisIFSABMiUKHQoTcmVzdWx0VG90YWxDYWxvcmlhcxIGMnE0NTRwcgQIASABUABaE3Jlc3VsdFRvdGFsQ2Fsb3JpYXM=',
            name: 'Future Function(int resultTotalCalorias)',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'totalPorcoes': debugSerializeParam(
            totalPorcoes,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=foodCard',
            searchReference:
                'reference=Qh0KFQoMdG90YWxQb3Jjb2VzEgVkOXl2OHIECAEgAVAAWgx0b3RhbFBvcmNvZXNiCGZvb2RDYXJk',
            name: 'int',
            nullable: false,
          )
        },
        widgetStates: {
          'countControllerValue': debugSerializeParam(
            countControllerValue,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=foodCard',
            name: 'int',
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
            'https://app.flutterflow.io/project/calorias-diarias-i42yke/tab=uiBuilder&page=foodCard',
        searchReference: 'reference=Oghmb29kQ2FyZFAAWghmb29kQ2FyZA==',
        widgetClassName: 'foodCard',
      );
}
