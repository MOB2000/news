import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news/constants/keys.dart';
import 'package:news/models/article.dart';
import 'package:news/models/source.dart';

class DioHelper {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2',
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {Keys.kXAPIKEY: Keys.kAPIKEY},
      queryParameters: <String, dynamic>{
        'language': 'en',
        'pagesize': 20,
      },
    ),
  );

  Future getPath(
    String path, {
    Map<String, dynamic> args = const {
      'country': 'us',
    },
  }) async =>
      await dio.get(
        path,
        queryParameters: args,
      );

  Future<List<Article>> get topHeadlines async {
    final response = await getPath('/top-headlines');
    List<Article> articles = <Article>[];

    if (response.statusCode == 200) {
      articles = (response.data['articles'] as List)
          .map((map) => Article.fromMap(map))
          .toList();
    }

    return articles;
  }

  Future<List<Source>> get sources async {
    List<Source> sources = <Source>[];

    final response = await getPath('/sources');

    if (response.statusCode == HttpStatus.ok) {
      sources = (response.data['sources'] as List)
          .map((map) => Source.fromMap(map))
          .toList();
    }

    return sources;
  }

  Future<List<Article>> search(String value) async {
    List<Article> articles = <Article>[];

    final response = await dio.get(
      '/everything',
      queryParameters: {
        'q': value,
        "sortBy": "popularity",
      },
    );

    if (response.statusCode == 200) {
      articles = (response.data['articles'] as List)
          .map((map) => Article.fromMap(map))
          .toList();
    }

    return articles;
  }

  Future<List<Article>> getSourceNews(Source source) async {
    List<Article> articles = <Article>[];
    final response = await dio.get(
      '/top-headlines',
      queryParameters: {
        'sources': source.id,
      },
    );

    if (response.statusCode == 200) {
      articles = (response.data['articles'] as List)
          .map((map) => Article.fromMap(map))
          .toList();
    }
    return articles;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
