import 'dart:convert';

import 'package:alpha_flutter_workshop_app/src/data/members.dart';
import 'package:alpha_flutter_workshop_app/src/models/member.dart';

class GithubApiProvider {
  List<Member> getMembers() {
    final List<dynamic> parsedList = json.decode(members);
    final membersList =
        parsedList.map((parsed) => Member.fromJson(parsed)).toList();
    return membersList;
  }
}
