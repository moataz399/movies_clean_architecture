import 'package:flutter/material.dart';
import 'package:movies_clean_acrh/core/utils/app_string.dart';
import 'package:movies_clean_acrh/features/movies/views/screens/movies_screen.dart';

import 'core/services/service_locator.dart';

void main() {

  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home:  MoviesScreen(),
    );
  }
}

