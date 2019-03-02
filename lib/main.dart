import 'package:alpha_flutter_workshop_app/src/scoped-models/github_api_provider.dart';
import 'package:alpha_flutter_workshop_app/src/screens/members_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<GithubApiProvider>(
        model: GithubApiProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MembersListScreen(),
        ));
  }
}
