class Member {
  final String login;
  final int id;
  final String avatarUrl;
  final String url;
  final String htmlUrl;
  final String reposUrl;

  Member.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        id = json['id'],
        avatarUrl = json['avatar_url'],
        url = json['url'],
        htmlUrl = json['html_url'],
        reposUrl = json['repos_url'];
}
