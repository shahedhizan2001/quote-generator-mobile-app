part of 'quote_bloc.dart';

@immutable
abstract class QuoteState {}

class QuoteInitial extends QuoteState {}

class GenerateQuoteLoading extends QuoteState {}

class GenerateQuoteSuccess extends QuoteState {
  final Quote quote;

  GenerateQuoteSuccess({required this.quote});
}

class GenerateQuoteFailure extends QuoteState {
  final String error;

  GenerateQuoteFailure({required this.error});
}

class GetQuoteLoading extends QuoteState {}

class GetQuoteState extends QuoteState {
  final Quote quote;

  GetQuoteState({required this.quote});
}

class GetQuoteFailure extends QuoteState {
  final String error;

  GetQuoteFailure({required this.error});
}
