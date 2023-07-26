import 'package:flutter/material.dart';
import 'package:news/constants/assets.dart';
import 'package:news/helpers/strings_helper.dart';
import 'package:news/models/article.dart';

class HeadlineArticleWidget extends StatelessWidget {
  final Article article;

  const HeadlineArticleWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: article.urlToImage == null
                    ? const AssetImage(Assets.placeholder)
                    : NetworkImage(article.urlToImage!) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [
                  0.1,
                  0.9,
                ],
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.white.withOpacity(0),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              width: 250.0,
              child: Text(
                article.title,
                style: const TextStyle(
                  height: 1.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Text(
              article.source.name,
              style: const TextStyle(color: Colors.white54, fontSize: 9.0),
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Text(
              StringsHelper.formatDateAgo(article.publishedAt),
              style: const TextStyle(color: Colors.white54, fontSize: 9.0),
            ),
          ),
        ],
      ),
    );
  }
}
