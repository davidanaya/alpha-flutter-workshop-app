import 'package:alpha_flutter_workshop_app/src/models/member.dart';
import 'package:flutter/material.dart';

import 'package:alpha_flutter_workshop_app/src/providers/github_api_provider.dart';

class MembersListScreen extends StatelessWidget {
  final GithubApiProvider githubProvider;

  MembersListScreen(this.githubProvider);

  @override
  Widget build(BuildContext context) {
    final List<Member> members = githubProvider.getMembers();

    return Scaffold(
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return Text(members[index].login);
        },
      ),
    );
  }
}
