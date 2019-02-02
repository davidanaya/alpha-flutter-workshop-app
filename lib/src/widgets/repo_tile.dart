import 'package:alpha_flutter_workshop_app/src/models/repo.dart';
import 'package:flutter/material.dart';

class RepoTile extends StatelessWidget {
  final Repo repo;

  RepoTile(this.repo);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(repo.name),
          subtitle: Text(repo.description),
        ),
        Divider()
      ],
    );
  }
}
