import 'package:news/constants/keys.dart';
import 'package:news/models/source.dart';

class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Article.fromMap(Map<String, dynamic> map)
      : source = Source.withName(
          id: map[Keys.kId],
          name: map[Keys.kSource][Keys.kName],
        ),
        author = map[Keys.kAuthor],
        title = map[Keys.kTitle],
        url = map[Keys.kUrl],
        urlToImage = map[Keys.kUrlToImage],
        publishedAt = DateTime.parse(map[Keys.kPublishedAt]),
        content = map[Keys.kContent],
        description = map[Keys.kDescription];
}
