import 'package:flutter/material.dart';

const double kBottomNavigationBarFontSize = 9.5;
const double kBottomNavigationBarIconSize = 20;

const TextStyle kHomeTitleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 17,
);

const TextStyle searchTexStyle = TextStyle(
  fontSize: 14,
  color: Colors.grey,
  fontWeight: FontWeight.w500,
);

final searchTextBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey[100]!.withOpacity(0.3)),
);
