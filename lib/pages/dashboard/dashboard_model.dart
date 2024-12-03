import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  late LoggableList<int> _listaRefeicoes = LoggableList([]);
  set listaRefeicoes(List<int> value) {
    if (value != null) {
      _listaRefeicoes = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<int> get listaRefeicoes =>
      _listaRefeicoes?..logger = () => debugLogWidgetClass(this);
  void addToListaRefeicoes(int item) => listaRefeicoes.add(item);
  void removeFromListaRefeicoes(int item) => listaRefeicoes.remove(item);
  void removeAtIndexFromListaRefeicoes(int index) =>
      listaRefeicoes.removeAt(index);
  void insertAtIndexInListaRefeicoes(int index, int item) =>
      listaRefeicoes.insert(index, item);
  void updateListaRefeicoesAtIndex(int index, Function(int) updateFn) =>
      listaRefeicoes[index] = updateFn(listaRefeicoes[index]);

  DateTime? _dataIni;
  set dataIni(DateTime? value) {
    _dataIni = value;
    debugLogWidgetClass(this);
  }

  DateTime? get dataIni => _dataIni;

  DateTime? _dataFin;
  set dataFin(DateTime? value) {
    _dataFin = value;
    debugLogWidgetClass(this);
  }

  DateTime? get dataFin => _dataFin;

  int _ganhoCaloriasHoje = 0;
  set ganhoCaloriasHoje(int value) {
    _ganhoCaloriasHoje = value;
    debugLogWidgetClass(this);
  }

  int get ganhoCaloriasHoje => _ganhoCaloriasHoje;

  int _perdaCaloriasHoje = 0;
  set perdaCaloriasHoje(int value) {
    _perdaCaloriasHoje = value;
    debugLogWidgetClass(this);
  }

  int get perdaCaloriasHoje => _perdaCaloriasHoje;

  int _metaCaloriasGanharHoje = 0;
  set metaCaloriasGanharHoje(int value) {
    _metaCaloriasGanharHoje = value;
    debugLogWidgetClass(this);
  }

  int get metaCaloriasGanharHoje => _metaCaloriasGanharHoje;

  int _metaCaloriasPerderHoje = 0;
  set metaCaloriasPerderHoje(int value) {
    _metaCaloriasPerderHoje = value;
    debugLogWidgetClass(this);
  }

  int get metaCaloriasPerderHoje => _metaCaloriasPerderHoje;

  late LoggableList<int> _listaHistoricoSaldoCaloriasDiarias = LoggableList([]);
  set listaHistoricoSaldoCaloriasDiarias(List<int> value) {
    if (value != null) {
      _listaHistoricoSaldoCaloriasDiarias = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<int> get listaHistoricoSaldoCaloriasDiarias =>
      _listaHistoricoSaldoCaloriasDiarias
        ?..logger = () => debugLogWidgetClass(this);
  void addToListaHistoricoSaldoCaloriasDiarias(int item) =>
      listaHistoricoSaldoCaloriasDiarias.add(item);
  void removeFromListaHistoricoSaldoCaloriasDiarias(int item) =>
      listaHistoricoSaldoCaloriasDiarias.remove(item);
  void removeAtIndexFromListaHistoricoSaldoCaloriasDiarias(int index) =>
      listaHistoricoSaldoCaloriasDiarias.removeAt(index);
  void insertAtIndexInListaHistoricoSaldoCaloriasDiarias(int index, int item) =>
      listaHistoricoSaldoCaloriasDiarias.insert(index, item);
  void updateListaHistoricoSaldoCaloriasDiariasAtIndex(
          int index, Function(int) updateFn) =>
      listaHistoricoSaldoCaloriasDiarias[index] =
          updateFn(listaHistoricoSaldoCaloriasDiarias[index]);

  int _perdaTotalCaloriasPeriodo = 0;
  set perdaTotalCaloriasPeriodo(int value) {
    _perdaTotalCaloriasPeriodo = value;
    debugLogWidgetClass(this);
  }

  int get perdaTotalCaloriasPeriodo => _perdaTotalCaloriasPeriodo;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Dashboard widget.
  List<RefeicoesRecord>? _resultListaRefeicoes;
  set resultListaRefeicoes(List<RefeicoesRecord>? value) {
    _resultListaRefeicoes = value;
    debugLogWidgetClass(this);
  }

  List<RefeicoesRecord>? get resultListaRefeicoes => _resultListaRefeicoes;

  // Stores action output result for [Firestore Query - Query a collection] action in Dashboard widget.
  List<HistoricoRecord>? _resultListaHistorico;
  set resultListaHistorico(List<HistoricoRecord>? value) {
    _resultListaHistorico = value;
    debugLogWidgetClass(this);
  }

  List<HistoricoRecord>? get resultListaHistorico => _resultListaHistorico;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'listaRefeicoes': debugSerializeParam(
            listaRefeicoes,
            ParamType.int,
            isList: true,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            searchReference:
                'reference=Qh8KFwoObGlzdGFSZWZlaWNvZXMSBXI2ZmNocgQSAggBUAFaDmxpc3RhUmVmZWljb2VzYglEYXNoYm9hcmQ=',
            name: 'int',
            nullable: false,
          ),
          'dataIni': debugSerializeParam(
            dataIni,
            ParamType.DateTime,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            searchReference:
                'reference=QhgKEAoHZGF0YUluaRIFOWV6dDhyBAgIIABQAVoHZGF0YUluaWIJRGFzaGJvYXJk',
            name: 'DateTime',
            nullable: true,
          ),
          'dataFin': debugSerializeParam(
            dataFin,
            ParamType.DateTime,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            searchReference:
                'reference=QhgKEAoHZGF0YUZpbhIFYmo4eW9yBAgIIABQAVoHZGF0YUZpbmIJRGFzaGJvYXJk',
            name: 'DateTime',
            nullable: true,
          ),
          'ganhoCaloriasHoje': debugSerializeParam(
            ganhoCaloriasHoje,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            searchReference:
                'reference=QiIKGgoRZ2FuaG9DYWxvcmlhc0hvamUSBW42ajFscgQIASABUAFaEWdhbmhvQ2Fsb3JpYXNIb2plYglEYXNoYm9hcmQ=',
            name: 'int',
            nullable: false,
          ),
          'perdaCaloriasHoje': debugSerializeParam(
            perdaCaloriasHoje,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            searchReference:
                'reference=QiIKGgoRcGVyZGFDYWxvcmlhc0hvamUSBXg5ZWx0cgQIASABUAFaEXBlcmRhQ2Fsb3JpYXNIb2plYglEYXNoYm9hcmQ=',
            name: 'int',
            nullable: false,
          ),
          'metaCaloriasGanharHoje': debugSerializeParam(
            metaCaloriasGanharHoje,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            searchReference:
                'reference=QicKHwoWbWV0YUNhbG9yaWFzR2FuaGFySG9qZRIFeWJ2enpyBAgBIAFQAVoWbWV0YUNhbG9yaWFzR2FuaGFySG9qZWIJRGFzaGJvYXJk',
            name: 'int',
            nullable: false,
          ),
          'metaCaloriasPerderHoje': debugSerializeParam(
            metaCaloriasPerderHoje,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            searchReference:
                'reference=QicKHwoWbWV0YUNhbG9yaWFzUGVyZGVySG9qZRIFdWRiYnByBAgBIAFQAVoWbWV0YUNhbG9yaWFzUGVyZGVySG9qZWIJRGFzaGJvYXJk',
            name: 'int',
            nullable: false,
          ),
          'listaHistoricoSaldoCaloriasDiarias': debugSerializeParam(
            listaHistoricoSaldoCaloriasDiarias,
            ParamType.int,
            isList: true,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            searchReference:
                'reference=QjUKKwoibGlzdGFIaXN0b3JpY29TYWxkb0NhbG9yaWFzRGlhcmlhcxIFZmxheGRyBhICCAEgAVABWiJsaXN0YUhpc3Rvcmljb1NhbGRvQ2Fsb3JpYXNEaWFyaWFzYglEYXNoYm9hcmQ=',
            name: 'int',
            nullable: false,
          ),
          'perdaTotalCaloriasPeriodo': debugSerializeParam(
            perdaTotalCaloriasPeriodo,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            searchReference:
                'reference=QioKIgoZcGVyZGFUb3RhbENhbG9yaWFzUGVyaW9kbxIFY3NxczZyBAgBIAFQAVoZcGVyZGFUb3RhbENhbG9yaWFzUGVyaW9kb2IJRGFzaGJvYXJk',
            name: 'int',
            nullable: false,
          )
        },
        actionOutputs: {
          'resultListaRefeicoes': debugSerializeParam(
            resultListaRefeicoes,
            ParamType.Document,
            isList: true,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            name: 'refeicoes',
            nullable: true,
          ),
          'resultListaHistorico': debugSerializeParam(
            resultListaHistorico,
            ParamType.Document,
            isList: true,
            link:
                'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
            name: 'historico',
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
            'https://app.flutterflow.io/project/calorias-diarias-i42yke/tab=uiBuilder&page=Dashboard',
        searchReference: 'reference=OglEYXNoYm9hcmRQAVoJRGFzaGJvYXJk',
        widgetClassName: 'Dashboard',
      );
}
