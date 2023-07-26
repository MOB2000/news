import 'package:flutter/foundation.dart';
import 'package:news/helpers/dio_helper.dart';
import 'package:news/models/article.dart';
import 'package:news/models/source.dart';

class NewsProvider with ChangeNotifier {
  final _dioHelper = DioHelper();

  Future<List<Source>> get sources async => _dioHelper.sources;

  Future<List<Article>> getSourceNews(Source source) async =>
      _dioHelper.getSourceNews(source);

  Future<List<Article>> get topHeadlines async => _dioHelper.topHeadlines;

  Future<List<Article>> search(String value) async => _dioHelper.search(value);
}
