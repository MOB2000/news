import 'package:flutter/material.dart';
import 'package:news/constants/colors.dart';
import 'package:news/constants/strings.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const News());
}

// TODO: extract strings, styles
// TODO: check Internet Connection
class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: kNews,
          theme: ThemeData(
            scaffoldBackgroundColor: kDark,
            appBarTheme: const AppBarTheme(
              backgroundColor: kMainColor,
            ),
          ),
          home: const MainScreen(),
        );
      },
    );
  }
}
