import 'package:flutter/material.dart';
import 'package:flutter_provider_starter/alerts/error_dialog.dart';
import 'package:flutter_provider_starter/localization/keys.dart';
import 'package:flutter_provider_starter/network/network_response.dart';
import 'package:flutter_provider_starter/providers/main_provider.dart';
import 'package:flutter_provider_starter/themes/theme.dart';
import 'package:flutter_provider_starter/widgets/reusables/bordered_text_field.dart';
import 'package:flutter_provider_starter/widgets/reusables/definition_card.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void checkOnErrors(BuildContext context) {
    final mainProvider = context.read<MainProvider>();
    final definitionResponse = mainProvider.definitionsResponse;

    if (definitionResponse.status.isError) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        /// if the response executed with the error status, message cannot be null or empty
        final message = definitionResponse.message!;
        mainProvider.resetError();
        showErrorDialog(context, message: message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    final response = mainProvider.definitionsResponse;

    checkOnErrors(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(translate(Keys.Test_Page_Title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWordEnterForm(context),
            if (response.status.isLoading)
              _buildLoadingWidget()
            else if (response.status.isCompleted)
              _buildDefinitionCard(context)
          ],
        ),
      ),
    );
  }

  Widget _buildWordEnterForm(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: BorderedTextField(
            initialText: mainProvider.word,
            labelText: translate(Keys.Test_Page_Word),
            onChanged: (String value) => mainProvider.word = value,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: dark,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    mainProvider.loadingDefinitions();
                  },
                  child: Text(
                    translate(Keys.Test_Page_Execute),
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildDefinitionCard(BuildContext context) {
    final mainProvider = context.read<MainProvider>();
    final definitions = mainProvider.definitionsResponse.data!.definitions;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: definitions.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: DefinitionCard(
          definition: definitions[index],
        ),
      ),
    );
  }
}
