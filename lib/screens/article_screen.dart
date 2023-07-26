import 'package:flutter/material.dart';
import 'package:news/constants/widgets.dart';
import 'package:news/helpers/strings_helper.dart';
import 'package:news/models/article.dart';
import 'package:news/widgets/helpers/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  const ArticleScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox24,
            Hero(
              tag: article.title,
              child: CircleAvatar(
                backgroundImage: NetworkImage(article.urlToImage ?? ''),
              ),
            ),
            sizedBox12,
            Row(
              children: [
                Text(
                  article.author ?? 'UnKnown',
                ),
                const Spacer(),
                Text(StringsHelper.getDate(article.publishedAt)),
              ],
            ),
            sizedBox24,
            Expanded(
              child: SingleChildScrollView(
                child: Text(article.content ?? ''),
              ),
            ),
            sizedBox24,
            TextButton(
              child: const Text('See In Website'),
              onPressed: () async {
                if (await canLaunch(article.url)) {
                  await launch(article.url);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
