import 'package:flutter_provider_starter/models/definitions_word.dart';
import 'package:flutter_provider_starter/network/api_client.dart';
import 'package:flutter_provider_starter/utils/logger.dart';

String getDefinitionsWordPath(String word) => '/words/$word/definitions';

/// Request according to API specifications.


class ApiService {
  final ApiClient _apiClient;

  ApiService(String baseApiUrl)
      : _apiClient = ApiClient(baseApiUrl: baseApiUrl);

  Future<DefinitionsWord> fetchDefinitionsWord(String word) async {
    try {
      final res = await _apiClient.get(getDefinitionsWordPath(word));
      return DefinitionsWord.fromJson(res);
    } catch (e) {
      log.severe('fetchDefinitionsWord error: $e');
      rethrow;
    }
  }
}
