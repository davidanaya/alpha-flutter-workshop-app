import 'package:alpha_flutter_workshop_app/src/models/repo.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          trailing: MaterialButton(
            onPressed: () => _launchURL(repo.htmlUrl),
            child: Text('Open'),
          ),
        ),
        Divider()
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
