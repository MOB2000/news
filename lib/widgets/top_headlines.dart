import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news/constants/strings.dart';
import 'package:news/constants/styles.dart';
import 'package:news/constants/widgets.dart';
import 'package:news/models/article.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/widgets/headline_article_widget.dart';
import 'package:news/widgets/helpers/custom_future_builder.dart';
import 'package:provider/provider.dart';

class TopHeadlines extends StatelessWidget {
  const TopHeadlines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        sizedBox12,
        const Center(
          child: Text(
            kTopHeadlines,
            style: kHomeTitleStyle,
          ),
        ),
        Expanded(
          child: CustomFutureBuilder<List<Article>>(
            future: provider.topHeadlines,
            builder: (articles) => CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: false,
              ),
              items: articles
                  .map((article) => HeadlineArticleWidget(article: article))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
