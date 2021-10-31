class DefinitionsWord {
  DefinitionsWord({
    required this.word,
    required this.definitions,
  });

  String word;
  List<Definition> definitions;

  factory DefinitionsWord.fromJson(Map<String, dynamic> json) => DefinitionsWord(
    word: json['word'],
    definitions: List<Definition>.from(json['definitions'].map((x) => Definition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'word': word,
    'definitions': List<dynamic>.from(definitions.map((x) => x.toJson())),
  };
}

class Definition {
  Definition({
    required this.definition,
    required this.partOfSpeech,
  });

  String definition;
  String partOfSpeech;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
    definition: json['definition'],
    partOfSpeech: json['partOfSpeech'],
  );

  Map<String, dynamic> toJson() => {
    'definition': definition,
    'partOfSpeech': partOfSpeech,
  };
}
