import 'package:flutter/material.dart';
import 'package:news/widgets/top_channels.dart';
import 'package:news/widgets/top_headlines.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: TopHeadlines(),
        ),
        Expanded(
          flex: 3,
          child: TopChannels(),
        ),
      ],
    );
  }
}
