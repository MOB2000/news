import 'package:flutter/material.dart';
import 'package:news/constants/assets.dart';
import 'package:news/constants/colors.dart';
import 'package:news/constants/styles.dart';
import 'package:news/constants/widgets.dart';
import 'package:news/models/article.dart';
import 'package:news/models/source.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/widgets/article_widget.dart';
import 'package:news/widgets/helpers/custom_app_bar.dart';
import 'package:news/widgets/helpers/custom_future_builder.dart';
import 'package:provider/provider.dart';

class SourceDetailsScreen extends StatelessWidget {
  final Source source;

  const SourceDetailsScreen({
    Key? key,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);
    return Scaffold(
      backgroundColor: kDark,
      appBar: const CustomAppBar(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15).copyWith(top: 0),
            color: kMainColor,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: source.id,
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.white),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(Assets.sourceIcon(source.id)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                sizedBox5,
                Text(source.name, style: kHomeTitleStyle),
                sizedBox5,
                Text(
                  source.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: CustomFutureBuilder<List<Article>>(
              future: provider.getSourceNews(source),
              builder: (articles) {
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return ArticleWidget(article: articles[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
