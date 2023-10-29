part of 'quote_bloc.dart';

@immutable
abstract class QuoteEvent {}

class GenerateQuote extends QuoteEvent {}

class GetQuote extends QuoteEvent {}
