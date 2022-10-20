import 'package:breaking_bad_api/src/get_sentencess/sentence_repository.dart';

import '../models/quote_model.dart';

class SentenceController {
  final SentenceRepository repository;

  const SentenceController({required this.repository});

  Future<List<Quote>> getSentence() async {
    try {
      final response = await repository.getSentence();
      return response;
    } catch (e) {
      /// crashlytics.logError(e);
      /// updateState(StateError(e));
      rethrow;
    }
  }
}
