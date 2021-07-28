import 'package:flutter/material.dart';
import 'package:job_swire/HomePage/controller/home_page_controller.dart';
import 'package:job_swire/HomePage/view/home_page_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomePageController>(
          create: (context) => HomePageController()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobSwire Mobile App',
      home: HomePageView(),
    );
  }
}
