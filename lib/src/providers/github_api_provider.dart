import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:alpha_flutter_workshop_app/src/models/member.dart';

class GithubApiProvider {
  Future<List<Member>> getMembers() async {
    final response =
        await http.get('https://api.github.com/orgs/Alpha-health/members');
    final List<dynamic> parsedList = json.decode(response.body);
    final membersList =
        parsedList.map((parsed) => Member.fromJson(parsed)).toList();
    return membersList;
  }
}
