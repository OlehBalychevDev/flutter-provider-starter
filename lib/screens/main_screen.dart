import 'package:flutter/material.dart';
import 'package:flutter_provider_starter/network/network_response.dart';
import 'package:flutter_provider_starter/providers/main_provider.dart';
import 'package:flutter_provider_starter/themes/theme.dart';
import 'package:flutter_provider_starter/widgets/reusables/bordered_text_field.dart';
import 'package:flutter_provider_starter/widgets/reusables/definition_card.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final mainProvider = context.read<MainProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main page',
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: BorderedTextField(
                initialText: mainProvider.word,
                labelText: 'Word',
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
                        'Execute',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Consumer<MainProvider>(
              builder: (context, mainProvider, _) {
                final response = mainProvider.definitionsResponse;

                if (response.status.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (response.status.isCompleted) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: response.data!.definitions.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefinitionCard(
                        definition: response.data!.definitions[index],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
