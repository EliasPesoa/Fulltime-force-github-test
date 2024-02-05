import 'package:flutter/material.dart';
import 'package:github_commit_history_test/src/controllers/commit_history_controller.dart';
import 'package:provider/provider.dart';

class CommitHistoryBody extends StatelessWidget {
  const CommitHistoryBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CommitHistoryController>(
          builder: (context, value, child) {
            return FutureBuilder(
              future: value.getCommits(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                      child: value.commitHistoryList());
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.15,
                      ),
                      const Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                    ],
                  );
                } else {
                  return SimpleDialog(
                    title: const Text('Something went wrong...'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {},
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                }
              },
            );
          },
        )
      ],
    );
  }
}
