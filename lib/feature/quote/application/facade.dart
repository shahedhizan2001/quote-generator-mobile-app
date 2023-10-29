import 'package:injectable/injectable.dart';

import '../domain/repo/repo.dart';
import '../infrastructure/model/quotable.dart';

@injectable
class QuoteFacade {
  final IQuoteRepo _repo;

  QuoteFacade({required IQuoteRepo repo}) : _repo = repo;

  Future<Quote> getRandomQuotes() async {
    return await _repo.getRandomQuotes();
  }
  Future<Quote> getQuote(int id) async {
    return await _repo.getQuote(id);
  }

}