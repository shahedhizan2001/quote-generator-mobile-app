// To parse this JSON data, do
//
//     final quotes = quotesFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'quotable.freezed.dart';
part 'quotable.g.dart';

Quotes quotesFromJson(String str) => Quotes.fromJson(json.decode(str));

String quotesToJson(Quotes data) => json.encode(data.toJson());

@freezed
class Quotes with _$Quotes {
  const factory Quotes({
    List<Quote>? quotes,
    int? total,
    int? skip,
    int? limit,
  }) = _Quotes;

  factory Quotes.fromJson(Map<String, dynamic> json) => _$QuotesFromJson(json);
}

@freezed
class Quote with _$Quote {
  const factory Quote({
    int? id,
    String? quote,
    String? author,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}