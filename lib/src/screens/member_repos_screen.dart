import 'package:alpha_flutter_workshop_app/src/models/list_item.dart';
import 'package:alpha_flutter_workshop_app/src/models/member.dart';
import 'package:alpha_flutter_workshop_app/src/models/member_avatat.dart';
import 'package:alpha_flutter_workshop_app/src/models/repo.dart';
import 'package:alpha_flutter_workshop_app/src/scoped-models/github_api_provider.dart';
import 'package:alpha_flutter_workshop_app/src/widgets/repo_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MemberReposScreen extends StatelessWidget {
  final Member member;

  MemberReposScreen({@required this.member});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(member.login)),
        body: ScopedModelDescendant<GithubApiProvider>(
          builder: (context, child, GithubApiProvider provider) {
            return FutureBuilder(
                future: provider.getReposFromMember(member.login),
                builder: (context, AsyncSnapshot<List<ListItem>> snapshot) =>
                    _buildList(snapshot.hasData ? snapshot.data : []));
          },
        ));
  }

  Widget _buildList(List<ListItem> repos) {
    final items = new List.from([MemberAvatar(member.avatarUrl)])
      ..addAll(repos);

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is Repo) {
          return RepoTile(item);
        } else if (item is MemberAvatar) {
          return _buildImage(item.avatarUrl);
        }
      },
    );
  }

  Widget _buildImage(String imageUrl) {
    return Hero(
      tag: member.login,
      child: Container(
          padding: EdgeInsets.all(32.0), child: Image.network(imageUrl)),
    );
  }
}
