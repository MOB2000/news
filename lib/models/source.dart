import 'package:news/constants/keys.dart';

class Source {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  Source.withName({
    required String? id,
    required String name,
  }) : this(
          id: id ?? '',
          name: name,
          description: '',
          url: '',
          category: '',
          language: '',
          country: '',
        );

  Source.fromMap(Map<String, dynamic> map)
      : id = map[Keys.kId],
        name = map[Keys.kName],
        description = map[Keys.kDescription],
        url = map[Keys.kUrl],
        category = map[Keys.kCategory],
        language = map[Keys.kLanguage],
        country = map[Keys.kCountry];
}
