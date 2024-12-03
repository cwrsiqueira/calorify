import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  /// Página inicial com os dados das metas
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin, RouteAware {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.resultListaRefeicoes = await queryRefeicoesRecordOnce(
        queryBuilder: (refeicoesRecord) => refeicoesRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .where(
              'data',
              isGreaterThanOrEqualTo: functions.stringToDate(
                  '${dateTimeFormat("y-MM-dd", getCurrentTimestamp)} 00:00:00'),
            )
            .where(
              'data',
              isLessThanOrEqualTo: functions.stringToDate(
                  '${dateTimeFormat("y-MM-dd", getCurrentTimestamp)} 23:59:59'),
            ),
      );
      _model.resultListaHistorico = await queryHistoricoRecordOnce(
        queryBuilder: (historicoRecord) => historicoRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .orderBy('data'),
      );
      _model.listaRefeicoes = _model.resultListaRefeicoes!
          .map((e) => e.calorias)
          .toList()
          .toList()
          .cast<int>();
      _model.ganhoCaloriasHoje =
          functions.somarValores(_model.listaRefeicoes.toList());
      _model.metaCaloriasGanharHoje =
          valueOrDefault(currentUserDocument?.gastoCaloricoDiario, 0) +
              valueOrDefault(currentUserDocument?.metaCaloricaDiaria, 0);
      _model.perdaCaloriasHoje =
          valueOrDefault(currentUserDocument?.gastoCaloricoDiario, 0) -
              _model.ganhoCaloriasHoje;
      _model.metaCaloriasPerderHoje =
          valueOrDefault(currentUserDocument?.metaCaloricaDiaria, 0) * -1;
      _model.listaHistoricoSaldoCaloriasDiarias = _model.resultListaHistorico!
          .map((e) => e.saldoCalorias)
          .toList()
          .toList()
          .cast<int>();
      _model.perdaTotalCaloriasPeriodo = functions
          .somarValores(_model.listaHistoricoSaldoCaloriasDiarias.toList());
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(40.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'progressBarOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-50.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.7, 0.7),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(40.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'progressBarOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-50.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.7, 0.7),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, DebugModalRoute.of(context)!);
    debugLogGlobalProperty(context);
  }

  @override
  void didPopNext() {
    safeSetState(() => _model.isRouteVisible = true);
    debugLogWidgetClass(_model);
  }

  @override
  void didPush() {
    safeSetState(() => _model.isRouteVisible = true);
    debugLogWidgetClass(_model);
  }

  @override
  void didPop() {
    _model.isRouteVisible = false;
  }

  @override
  void didPushNext() {
    _model.isRouteVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    DebugFlutterFlowModelContext.maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryText,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Text(
              'CALORIFY',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/logo.webp',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '18',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 14.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  'Objetivos de hoje',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) =>
                                        CircularPercentIndicator(
                                      percent: (_model.ganhoCaloriasHoje /
                                                  _model
                                                      .metaCaloriasGanharHoje) >
                                              1.0
                                          ? 1.0
                                          : (_model.ganhoCaloriasHoje /
                                              _model.metaCaloriasGanharHoje),
                                      radius: 50.0,
                                      lineWidth: 4.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor: () {
                                        if (((_model.ganhoCaloriasHoje /
                                                (((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.gastoCaloricoDiario,
                                                                0) *
                                                            -1) -
                                                        (valueOrDefault(
                                                            currentUserDocument
                                                                ?.metaCaloricaDiaria,
                                                            0))) *
                                                    -1))) <
                                            0.9) {
                                          return FlutterFlowTheme.of(context)
                                              .accent1;
                                        } else if ((((_model.ganhoCaloriasHoje /
                                                    (((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.gastoCaloricoDiario,
                                                                    0) *
                                                                -1) -
                                                            (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.metaCaloricaDiaria,
                                                                0))) *
                                                        -1))) >=
                                                0.9) &&
                                            (((_model.ganhoCaloriasHoje /
                                                    (((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.gastoCaloricoDiario,
                                                                    0) *
                                                                -1) -
                                                            (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.metaCaloricaDiaria,
                                                                0))) *
                                                        -1))) <=
                                                1.0)) {
                                          return FlutterFlowTheme.of(context)
                                              .accent3;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        }
                                      }(),
                                      backgroundColor: Color(0xFFE0E3E7),
                                      center: Text(
                                        '${(((_model.ganhoCaloriasHoje / (((valueOrDefault(currentUserDocument?.gastoCaloricoDiario, 0) * -1) - (valueOrDefault(currentUserDocument?.metaCaloricaDiaria, 0))) * -1)) * 100).round()).toString()}%',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF14181B),
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                            'progressBarOnPageLoadAnimation1']!),
                                  ),
                                  Icon(
                                    Icons.dining_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        '${_model.ganhoCaloriasHoje.toString()}/${(valueOrDefault(currentUserDocument?.gastoCaloricoDiario, 0) + valueOrDefault(currentUserDocument?.metaCaloricaDiaria, 0)).toString()} Cal',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF14181B),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation1']!),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) =>
                                        CircularPercentIndicator(
                                      percent: (_model.perdaCaloriasHoje /
                                                  _model
                                                      .metaCaloriasPerderHoje) >
                                              1.0
                                          ? 1.0
                                          : (_model.perdaCaloriasHoje /
                                              _model.metaCaloriasPerderHoje),
                                      radius: 50.0,
                                      lineWidth: 4.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor: () {
                                        if (((_model.ganhoCaloriasHoje /
                                                (((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.gastoCaloricoDiario,
                                                                0) *
                                                            -1) -
                                                        (valueOrDefault(
                                                            currentUserDocument
                                                                ?.metaCaloricaDiaria,
                                                            0))) *
                                                    -1))) <
                                            0.9) {
                                          return FlutterFlowTheme.of(context)
                                              .accent1;
                                        } else if ((((_model.ganhoCaloriasHoje /
                                                    (((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.gastoCaloricoDiario,
                                                                    0) *
                                                                -1) -
                                                            (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.metaCaloricaDiaria,
                                                                0))) *
                                                        -1))) >=
                                                0.9) &&
                                            (((_model.ganhoCaloriasHoje /
                                                    (((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.gastoCaloricoDiario,
                                                                    0) *
                                                                -1) -
                                                            (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.metaCaloricaDiaria,
                                                                0))) *
                                                        -1))) <=
                                                1.0)) {
                                          return FlutterFlowTheme.of(context)
                                              .accent3;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        }
                                      }(),
                                      backgroundColor: Color(0xFFE0E3E7),
                                      center: Text(
                                        '${(((_model.perdaCaloriasHoje / _model.metaCaloriasPerderHoje) * 100).round()).toString()}%',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF14181B),
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                            'progressBarOnPageLoadAnimation2']!),
                                  ),
                                  Icon(
                                    Icons.trending_up,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      '${_model.perdaCaloriasHoje.toString()}/${_model.metaCaloriasPerderHoje.toString()} Cal',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF14181B),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation2']!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                'Objetivo geral: ${formatNumber(
                                  _model.perdaTotalCaloriasPeriodo,
                                  formatType: FormatType.compact,
                                )}/${formatNumber(
                                  valueOrDefault<double>(
                                        valueOrDefault(
                                                currentUserDocument?.peso,
                                                0.0) *
                                            7000,
                                        0.0,
                                      ) -
                                      (valueOrDefault(
                                              currentUserDocument?.pesoObjetivo,
                                              0.0) *
                                          7000),
                                  formatType: FormatType.compact,
                                )}',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        StreamBuilder<List<HistoricoRecord>>(
                          stream: queryHistoricoRecord(
                            queryBuilder: (historicoRecord) => historicoRecord
                                .where(
                                  'user',
                                  isEqualTo: currentUserReference,
                                )
                                .orderBy('data'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<HistoricoRecord> containerHistoricoRecordList =
                                snapshot.data!;

                            _model.debugBackendQueries[
                                    'containerHistoricoRecordList_Container_da6msj37${containerHistoricoRecordList.length > 100 ? ' (first 100)' : ''}'] =
                                debugSerializeParam(
                              containerHistoricoRecordList.take(100),
                              ParamType.Document,
                              isList: true,
                              link:
                                  'https://app.flutterflow.io/project/calorias-diarias-i42yke?tab=uiBuilder&page=Dashboard',
                              name: 'historico',
                              nullable: false,
                            );
                            debugLogWidgetClass(_model);

                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 200.0,
                                child: Stack(
                                  children: [
                                    FlutterFlowLineChart(
                                      data: [
                                        FFLineChartData(
                                          xData: containerHistoricoRecordList
                                              .map((d) => d.data)
                                              .toList(),
                                          yData: containerHistoricoRecordList
                                              .map((d) => d.consumoCalorias)
                                              .toList(),
                                          settings: LineChartBarData(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            barWidth: 2.0,
                                            isCurved: true,
                                          ),
                                        ),
                                        FFLineChartData(
                                          xData: containerHistoricoRecordList
                                              .map((d) => d.data)
                                              .toList(),
                                          yData: containerHistoricoRecordList
                                              .map((d) => d.metaDiaria)
                                              .toList(),
                                          settings: LineChartBarData(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            barWidth: 2.0,
                                            isCurved: true,
                                          ),
                                        )
                                      ],
                                      chartStylingInfo: ChartStylingInfo(
                                        enableTooltip: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        showGrid: true,
                                        showBorder: false,
                                      ),
                                      axisBounds: AxisBounds(),
                                      xAxisLabelInfo: AxisLabelInfo(
                                        title: 'Período',
                                        titleTextStyle: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                        reservedSize: 32.0,
                                      ),
                                      yAxisLabelInfo: AxisLabelInfo(
                                        title: 'Desempenho',
                                        titleTextStyle: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                        reservedSize: 40.0,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: FlutterFlowChartLegendWidget(
                                        entries: [
                                          LegendEntry(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              'Calorias'),
                                          LegendEntry(
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                              'Meta'),
                                        ],
                                        width: 100.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        textPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                5.0, 0.0, 0.0, 0.0),
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        borderWidth: 1.0,
                                        borderColor: Colors.black,
                                        indicatorSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 8.0)).around(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
