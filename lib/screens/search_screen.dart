import 'package:flutter/material.dart';
import 'package:news/constants/strings.dart';
import 'package:news/constants/styles.dart';
import 'package:news/models/article.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/widgets/article_widget.dart';
import 'package:news/widgets/helpers/custom_future_builder.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchText = '';
  bool showResult = false;

  final _searchFormKey = GlobalKey<FormState>();

  void clear() {
    _searchText = '';
    setState(() => showResult = false);
  }

  void search() {
    if (_searchFormKey.currentState!.validate()) {
      _searchFormKey.currentState!.save();

      setState(() => showResult = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);
    return Form(
      key: _searchFormKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: _searchText,
              style: const TextStyle(fontSize: 14, color: Colors.white70),
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (value) => search(),
              validator: (value) {
                value = value!.trim();
                if (value.isEmpty) {
                  return kEnterValueToSearch;
                }
                return null;
              },
              onChanged: (value) => setState(() => showResult = false),
              onSaved: (value) => _searchText = value!.trim(),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: Colors.black45,
                suffixIcon: showResult
                    ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey[500],
                          size: 16,
                        ),
                        onPressed: clear,
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey[500],
                          size: 16,
                        ),
                        onPressed: search,
                      ),
                enabledBorder: searchTextBorder,
                focusedBorder: searchTextBorder,
                contentPadding: const EdgeInsets.only(left: 15, right: 10),
                labelText: kSearch,
                hintStyle: searchTexStyle.copyWith(
                  color: Colors.grey[500],
                ),
                labelStyle: searchTexStyle,
              ),
            ),
          ),
          if (showResult)
            Expanded(
              child: CustomFutureBuilder<List<Article>>(
                future: provider.search(_searchText),
                builder: (articles) => ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return ArticleWidget(
                      article: articles[index],
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
