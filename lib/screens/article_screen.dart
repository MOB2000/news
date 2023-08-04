import 'package:flutter/material.dart';
import 'package:news/constants/widgets.dart';
import 'package:news/helpers/strings_helper.dart';
import 'package:news/models/article.dart';
import 'package:news/widgets/helpers/custom_app_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  const ArticleScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: article.title,
              child: Image(
                image: NetworkImage(article.urlToImage ?? ''),
              ),
            ),
            sizedBox12,
            Text(
              article.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox24,
            Row(
              children: [
                Text(
                  article.author ?? 'UnKnown',
                  style: const TextStyle(
                    color: Colors.white54,
                  ),
                ),
                const Spacer(),
                Text(
                  StringsHelper.getDate(article.publishedAt),
                  style: const TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
            sizedBox24,
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  article.content ?? '',
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            sizedBox24,
            TextButton(
              child: const Text(
                'See In Website',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              onPressed: () async {
                if (await canLaunchUrlString(article.url)) {
                  await launchUrlString(article.url);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
