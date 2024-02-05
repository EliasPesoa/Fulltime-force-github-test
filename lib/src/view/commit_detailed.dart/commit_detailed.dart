import 'package:flutter/material.dart';
import 'package:github_commit_history_test/src/models/commit_model.dart';
import 'package:github_commit_history_test/src/utils/style.dart';
import 'package:url_launcher/url_launcher.dart';

class CommitDetailed extends StatelessWidget {
  const CommitDetailed({super.key, required this.commit});

  final CommitModel commit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
            Row(
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () => Navigator.of(context).pop(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: StyleTheme().cardDetailedStyle,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/github-mark-white.png",
                          width: MediaQuery.sizeOf(context).width * 0.3),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Commit Detailed",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).width * 0.05),
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).width * 0.045),
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Flexible(
                      child: Text(
                        commit.message,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.sizeOf(context).width * 0.04),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      "Date",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).width * 0.045),
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Flexible(
                      child: Text(
                        commit.author.date,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.sizeOf(context).width * 0.04),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      "Hour",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).width * 0.045),
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Flexible(
                      child: Text(
                        "${commit.author.hour} hs",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.sizeOf(context).width * 0.04),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      "Link",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).width * 0.045),
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Flexible(
                      child: Text(
                        commit.url,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.sizeOf(context).width * 0.04),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 95, 94, 94)),
                        ),
                        onPressed: () async {
                          await launchUrl(Uri.parse(commit.url));
                        },
                        child: Text(
                          "Go to the link",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.sizeOf(context).width * 0.04),
                        ))
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
