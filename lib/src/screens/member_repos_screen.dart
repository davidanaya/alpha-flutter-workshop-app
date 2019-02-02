import 'package:alpha_flutter_workshop_app/src/models/repo.dart';
import 'package:alpha_flutter_workshop_app/src/providers/github_api_provider.dart';
import 'package:alpha_flutter_workshop_app/src/widgets/repo_tile.dart';
import 'package:flutter/material.dart';

class MemberReposScreen extends StatelessWidget {
  final GithubApiProvider githubProvider;
  final String memberName;

  MemberReposScreen(this.githubProvider, {@required this.memberName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(memberName)),
        body: FutureBuilder(
            future: githubProvider.getReposFromMember(memberName),
            builder: (context, AsyncSnapshot<List<Repo>> snapshot) =>
                snapshot.hasData
                    ? _buildList(snapshot.data)
                    : Center(child: CircularProgressIndicator())));
  }

  Widget _buildList(List<Repo> repos) {
    return ListView.builder(
      itemCount: repos.length,
      itemBuilder: (context, index) {
        return RepoTile(repos[index]);
      },
    );
  }
}
