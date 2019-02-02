import 'package:flutter/material.dart';

import 'package:alpha_flutter_workshop_app/src/providers/github_api_provider.dart';
import 'package:alpha_flutter_workshop_app/src/screens/members_list_screen.dart';

void main() {
  final githubProvider = GithubApiProvider();

  runApp(MyApp(githubProvider));
}

class MyApp extends StatelessWidget {
  final githubProvider;

  MyApp(this.githubProvider);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MembersListScreen(githubProvider),
    );
  }
}
