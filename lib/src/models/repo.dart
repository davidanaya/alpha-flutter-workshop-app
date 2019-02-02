class Repo {
  final int id;
  final String name;
  final String htmlUrl;
  final String description;

  Repo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        htmlUrl = json['html_url'],
        description = json['description'] ?? 'No description';
}
