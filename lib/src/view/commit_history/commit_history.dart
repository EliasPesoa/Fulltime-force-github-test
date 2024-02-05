import 'package:flutter/material.dart';
import 'package:github_commit_history_test/src/controllers/commit_history_controller.dart';
import 'package:github_commit_history_test/src/view/commit_history/commit_history_body.dart';
import 'package:provider/provider.dart';

class CommitHistory extends StatelessWidget {
  const CommitHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommitHistoryController(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Commit History",
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const CommitHistory()));
            },
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
          body: const CommitHistoryBody(),
        );
      },
    );
  }
}
