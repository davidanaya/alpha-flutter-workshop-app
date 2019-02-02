import 'package:alpha_flutter_workshop_app/src/models/member.dart';
import 'package:alpha_flutter_workshop_app/src/scoped-models/github_api_provider.dart';
import 'package:alpha_flutter_workshop_app/src/widgets/member_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MembersListScreen extends StatelessWidget {
  MembersListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<GithubApiProvider>(
        builder: (context, child, GithubApiProvider provider) {
          return FutureBuilder(
              future: provider.getMembers(),
              builder: (context, AsyncSnapshot<List<Member>> snapshot) {
                return snapshot.hasData
                    ? _buildList(snapshot.data)
                    : Center(child: CircularProgressIndicator());
              });
        },
      ),
    );
  }

  Widget _buildList(List<Member> members) {
    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        return MemberTile(members[index]);
      },
    );
  }
}
