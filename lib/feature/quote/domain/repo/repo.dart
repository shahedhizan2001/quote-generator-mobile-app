import '../../infrastructure/model/quotable.dart';

abstract class IQuoteRepo{
  Future<Quote> getRandomQuotes();
  Future<Quote> getQuote(int id);
}