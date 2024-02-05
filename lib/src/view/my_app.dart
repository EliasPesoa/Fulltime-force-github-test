import 'package:flutter/material.dart';
import 'package:github_commit_history_test/src/view/commit_history/commit_history.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github commit history',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                fontSizeFactor: 1.1,
                fontSizeDelta: 2.0,
              ),
          appBarTheme: AppBarTheme(
              color: Colors.black,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.sizeOf(context).width * 0.05))),
      home: const CommitHistory(),
    );
  }
}
