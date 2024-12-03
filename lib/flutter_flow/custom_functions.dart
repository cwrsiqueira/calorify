import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

int somarValores(List<int> lista) {
  if (lista.isEmpty) {
    return 0;
  }

  int soma = 0;

  for (int valorAtual in lista) {
    soma += valorAtual;
  }

  return soma;
}

DateTime stringToDate(String dateString) {
  // Faça uma função que recebe uma string "2024-11-28 03:59:27", por exemplo, e retorna um date time compativel com o formato do flutterflow
  return DateTime.parse(dateString);
}

int calcularGCD(
  double peso,
  int altura,
  int idade,
  String atividade,
  String sexo,
) {
// Validações dos parâmetros
  if (peso <= 0) {
    throw ArgumentError('Peso deve ser maior que 0.');
  }
  if (altura <= 0) {
    throw ArgumentError('Altura deve ser maior que 0.');
  }
  if (idade <= 0 || idade > 120) {
    throw ArgumentError('Idade deve ser maior que 0 e menor ou igual a 120.');
  }

  // Normaliza strings para evitar problemas com letras maiúsculas ou espaços
  atividade = atividade.trim().toLowerCase();
  sexo = sexo.trim().toLowerCase();

  // Fatores de nível de atividade física
  double fatorAtividade;
  switch (atividade) {
    case 'sedentario':
      fatorAtividade = 1.2;
      break;
    case 'leve':
      fatorAtividade = 1.375;
      break;
    case 'moderado':
      fatorAtividade = 1.55;
      break;
    case 'alto':
      fatorAtividade = 1.725;
      break;
    case 'extremo':
      fatorAtividade = 1.9;
      break;
    default:
      throw ArgumentError(
          'Atividade inválida. Use "sedentario", "leve", "moderado", "alto" ou "extremo".');
  }

  // Cálculo do GEB (Gasto Energético Basal)
  double geb;
  if (sexo == 'masculino') {
    geb = (13.75 * peso) + (5 * altura) - (6.76 * idade) + 66.5;
  } else if (sexo == 'feminino') {
    geb = (9.56 * peso) + (1.85 * altura) - (4.68 * idade) + 665;
  } else {
    throw ArgumentError('Sexo inválido. Use "masculino" ou "feminino".');
  }

  // Cálculo do GCD (Gasto Calórico Diário)
  double gcd = geb * fatorAtividade;
  return gcd.round();
}

int calcularMetaDiaria(
  DateTime data,
  double pesoAtual,
  double pesoMeta,
) {
// Calcula os dias restantes
  final DateTime hoje = DateTime.now();
  final int diasFaltando = data.difference(hoje).inDays;

  // Valida se a data está no futuro
  if (diasFaltando <= 0) {
    throw ArgumentError('A data informada deve ser futura.');
  }

  // Calcula a diferença de peso (pode ser positiva ou negativa)
  final double diferencaPeso = pesoMeta - pesoAtual;

  // Converte a diferença de peso para calorias (7000 kcal por kg)
  final double caloriasNecessarias = diferencaPeso.abs() * 7000;

  // Divide pelas dias restantes para obter calorias diárias necessárias
  final double caloriasPorDia = caloriasNecessarias / diasFaltando;

  // Retorna o valor arredondado para o inteiro mais próximo (positivo ou negativo)
  return diferencaPeso > 0 ? caloriasPorDia.round() : -caloriasPorDia.round();
}
