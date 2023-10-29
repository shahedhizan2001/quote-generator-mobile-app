import 'package:injectable/injectable.dart';

import '../../domain/repo/repo.dart';
import '../model/quotable.dart';
import '../remote/remote.dart';

@Injectable(as :IQuoteRepo)
class QuoteRepoImpl implements IQuoteRepo{
 final QuoteRemote _quoteRemote;

  QuoteRepoImpl({required QuoteRemote quoteRemote}) : _quoteRemote = quoteRemote;

  @override
  Future<Quote> getRandomQuotes()async{
    final result=await _quoteRemote.getRandomQuotes();
    return result;
  }
 @override
 Future<Quote> getQuote(int id)async{
   final result=await _quoteRemote.getQuote(id);
   return result;
 }

}