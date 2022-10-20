import 'dart:developer';

import 'package:breaking_bad_api/src/models/quote_model.dart';
import 'package:dio/dio.dart';

class SentenceRepository {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.breakingbadquotes.xyz/v1',
      headers: {
        'Content-type': 'application/json',
      },
    ),
  );

  Future<List<Quote>> getSentence() async {
    try {
      final response = await dio.get('/quotes');

      final data = List.from(response.data);

      final mapList = data.map((e) => Map<String, String>.from(e)).toList();

      return mapList.map((e) => Quote.fromMap(e)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
