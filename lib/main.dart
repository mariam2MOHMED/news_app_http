import 'package:flutter/material.dart';
import 'package:news_app_route/appTheme.dart';
import 'package:news_app_route/home_screen.dart';

import 'news/news_detials.dart';

void main() {
  runApp( NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homeScreen.routeName:(_)=>homeScreen(),
        NewsDetials.routeName:(_)=>NewsDetials()
      },
      theme: AppTheme.lightTheme,
      darkTheme:  AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: homeScreen.routeName,
    );
  }
}

