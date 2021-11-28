import 'package:flutter/material.dart';
import 'package:flutter_provider_starter/localization/keys.dart';
import 'package:flutter_provider_starter/models/definitions_word.dart';
import 'package:flutter_provider_starter/network/network_response.dart';
import 'package:flutter_provider_starter/services/api_service.dart';
import 'package:flutter_provider_starter/utils/logger.dart';
import 'package:flutter_translate/flutter_translate.dart';

class MainProvider extends ChangeNotifier {
  final ApiService _apiService;
  var word = 'example';

  var definitionsResponse = NetworkResponse<DefinitionsWord>.none();

  MainProvider(this._apiService);

  void loadingDefinitions() {
    if (word.isEmpty) {
      definitionsResponse = NetworkResponse<DefinitionsWord>.error(
          translate(Keys.Test_Page_Text_Field_Should_Not_Be_Empty));
    } else {
      _fetchDefinitions(word);
    }
  }

  void clean() {
    definitionsResponse = NetworkResponse<DefinitionsWord>.none();
    word = '';
  }

  Future<void> _fetchDefinitions(String word) async {
    definitionsResponse =
        NetworkResponse<DefinitionsWord>.loading(translate(Keys.Test_Page_Definitions_Are_Loading));
    notifyListeners();
    try {
      final result = await _apiService.fetchDefinitionsWord(word);
      definitionsResponse = NetworkResponse<DefinitionsWord>.completed(result);
      log.fine(result.toString());
    } catch (e) {
      definitionsResponse = NetworkResponse<DefinitionsWord>.error(
          translate(Keys.Test_Page_Error_Of_Fetching_Definitions));
      log.severe(e.toString());
    } finally {
      notifyListeners();
    }
  }

  void resetError() {
    definitionsResponse = NetworkResponse.none();
  }

}
