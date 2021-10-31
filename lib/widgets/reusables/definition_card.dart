import 'package:flutter/material.dart';
import 'package:flutter_provider_starter/models/definitions_word.dart';

class DefinitionCard extends StatelessWidget {
  final Definition definition;

  const DefinitionCard(
      {Key? key, required this.definition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
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
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  definition.definition,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
