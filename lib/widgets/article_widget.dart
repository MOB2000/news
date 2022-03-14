import 'package:flutter/material.dart';
import 'package:news/constants/assets.dart';
import 'package:news/helpers/strings_helper.dart';
import 'package:news/models/article.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  const ArticleWidget({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white54, width: 1.0),
        ),
        color: Colors.black26,
      ),
      height: mediaQuery.size.height * 0.25,
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            width: mediaQuery.size.width * 3 / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  maxLines: 3,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  article.content ?? '',
                  maxLines: 5,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                    fontSize: 12.0,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          article.source.name,
                          style: const TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          StringsHelper.formatDateAgo(article.publishedAt),
                          style: const TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            width: MediaQuery.of(context).size.width * 2 / 5,
            height: 130,
            child: article.urlToImage == null
                ? Image.asset(Assets.placeholder)
                : FadeInImage.assetNetwork(
                    image: article.urlToImage!,
                    alignment: Alignment.topCenter,
                    placeholder: Assets.placeholder,
                    fit: BoxFit.fitHeight,
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 1 / 3,
                  ),
          )
        ],
      ),
    );
  }
}
