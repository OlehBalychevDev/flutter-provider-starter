import 'package:flutter/material.dart';
import 'package:flutter_provider_starter/models/definitions_word.dart';

class DefinitionCard extends StatelessWidget {
  final Definition definition;

  const DefinitionCard({Key? key, required this.definition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                definition.partOfSpeech,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              definition.definition,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
    );
  }
}
