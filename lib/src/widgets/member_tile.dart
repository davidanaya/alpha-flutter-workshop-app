import 'package:alpha_flutter_workshop_app/src/models/member.dart';
import 'package:alpha_flutter_workshop_app/src/screens/member_repos_screen.dart';
import 'package:flutter/material.dart';

class MemberTile extends StatelessWidget {
  final Member member;

  MemberTile(this.member);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(member.avatarUrl),
      ),
      title: Text(member.login),
      subtitle: Text(member.htmlUrl),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MemberReposScreen(member: member))),
    );
  }
}
