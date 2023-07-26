import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news/constants/colors.dart';
import 'package:news/constants/strings.dart';
import 'package:news/helpers/dio_helper.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const News());
}

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
