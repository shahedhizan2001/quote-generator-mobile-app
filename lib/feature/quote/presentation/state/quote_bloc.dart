import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../commen/service/storage_sevice.dart';
import '../../application/facade.dart';
import '../../infrastructure/model/quotable.dart';

part 'quote_event.dart';

part 'quote_state.dart';

@injectable
class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteFacade _quoteFacade;
  List<Quote> quote = [];
  List<int> quoteId = [];
  final searchController = TextEditingController();

  QuoteBloc(this._quoteFacade) : super(QuoteInitial()) {
    on<GenerateQuote>(quoteEvent);
    on<GetQuote>(getQuoteEvent);
  }

    quoteEvent(GenerateQuote event, Emitter emit) async {
    emit(GenerateQuoteLoading());
    await _quoteFacade.getRandomQuotes().then((value) {
      emit(GenerateQuoteSuccess(quote: value!));
    }).catchError((error) {
      emit(GenerateQuoteFailure(error: "Failed to generate Quote"));
      print(error.toString());
    });
  }

   getQuoteEvent(GetQuote event, Emitter emit) async {
    emit(GetQuoteLoading());
    quoteId = StorageService.getListId()!;
    for (int i = 0; i < StorageService.getListId()!.length; i++) {
      await _quoteFacade.getQuote(quoteId[i]).then((value) {
        if(!quote.contains(value)){
          quote.add(value);
        }
        emit(GetQuoteState(quote: value!));
      }).catchError((error){
        emit(GetQuoteFailure(error: "Failed"));
      });
    }
  }
}
