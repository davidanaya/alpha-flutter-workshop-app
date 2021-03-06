import 'dart:async';
import 'dart:convert';

import 'package:alpha_flutter_workshop_app/src/models/member.dart';
import 'package:alpha_flutter_workshop_app/src/models/repo.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class GithubApiProvider extends Model {
  Future<List<Member>> getMembers() async {
    final response =
        await http.get('https://api.github.com/orgs/Alpha-health/members');
    final List<dynamic> parsedList = json.decode(response.body);
    final membersList =
        parsedList.map((parsed) => Member.fromJson(parsed)).toList();
    return membersList;
  }

  Future<List<Repo>> getReposFromMember(String memberName) async {
    final response =
        await http.get('https://api.github.com/users/$memberName/repos');
    final List<dynamic> parsedList = json.decode(response.body);
    final reposList =
        parsedList.map((parsed) => Repo.fromJson(parsed)).toList();
    return reposList;
  }
}
