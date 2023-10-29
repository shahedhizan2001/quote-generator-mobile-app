import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../model/quotable.dart';

@injectable
class QuoteRemote {
  final _dio = Dio();

  Future<Quote> getRandomQuotes() async {
    try {
      final response = await _dio.get("https://dummyjson.com/quotes/random");
      return Quote.fromJson(response.data);
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }
  Future<Quote> getQuote(int id) async {
    try {
      final response = await _dio.get("https://dummyjson.com/quotes/$id");
      return Quote.fromJson(response.data);
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }


}
