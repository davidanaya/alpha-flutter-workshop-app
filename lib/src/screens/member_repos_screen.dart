import 'package:alpha_flutter_workshop_app/src/models/list_item.dart';
import 'package:alpha_flutter_workshop_app/src/models/member_avatat.dart';
import 'package:alpha_flutter_workshop_app/src/models/repo.dart';
import 'package:alpha_flutter_workshop_app/src/scoped-models/github_api_provider.dart';
import 'package:alpha_flutter_workshop_app/src/widgets/repo_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MemberReposScreen extends StatelessWidget {
  final String memberName;
  final String avatarUrl =
      'https://avatars2.githubusercontent.com/u/17270047?v=4';

  MemberReposScreen({@required this.memberName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(memberName)),
        body: ScopedModelDescendant<GithubApiProvider>(
          builder: (context, child, GithubApiProvider provider) {
            return FutureBuilder(
                future: provider.getReposFromMember(memberName),
                builder: (context, AsyncSnapshot<List<ListItem>> snapshot) =>
                    snapshot.hasData
                        ? _buildList(snapshot.data)
                        : Center(child: CircularProgressIndicator()));
          },
        ));
  }

  Widget _buildList(List<ListItem> repos) {
    final items = new List.from([MemberAvatar(avatarUrl)])..addAll(repos);

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
    return Container(
        padding: EdgeInsets.all(32.0), child: Image.network(imageUrl));
  }
}
