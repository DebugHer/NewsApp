import 'package:flutter/material.dart';
class XMargin extends StatelessWidget {
  final double x;
  const XMargin(this.x);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}

class YMargin extends StatelessWidget {
  final double y;
  const YMargin(this.y);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

double screenHeight(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.height * percent;

double screenWidth(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.width * percent;


final blue = Color(0xffdee8ff);

final red = Color(0xffff795b);

class Constants{
  static final String HEADLINE_NEWS_URL = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=57cb20daf82f4431a4719c006a9a0a8c';
}