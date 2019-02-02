## 2-member-list

In this exercise we will use some fake json data to display a list of members from a github organization.

You can get your own data from [https://api.github.com/orgs/flutter/members].

### Objectives

This is the list of steps required:

1. Create a file `members.dart` inside `src/data` folder where we will store our data for now and export it as a dart variable, like this:

```dart
final String members = '''
[
  {
    "login": "cbracken",
    "id": 351029,
    "node_id": "MDQ6V
    ...
  }
]
''';
```

2. We need to parse the json String into a proper dart object. Create a `member.dart` inside `src/models` with a named constructor `Member.fromJson` that will be used to generate instances of `Member` from the json. We will only save a few properties from the original data.

```dart
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
```

3. Time to fetch the data. For now we will fake also the http call and return the data directly.

   Create a folder `src/providers` with a file inside named `github_api_provider.dart` with a single method to retrieve and parse our members.

```dart
class GithubApiProvider {
  List<Member> getMembers() {
    final List<dynamic> parsedList = json.decode(members);
    final membersList =
        parsedList.map((parsed) => Member.fromJson(parsed)).toList();
    return membersList;
  }
}
```

4. We need now a widget to display the list of members in the app. Let's create a new screen `members_list_screen.dart` with a ListView to display the data.

```dart
class MembersListScreen extends StatelessWidget {
  final GithubApiProvider githubProvider;

  MembersListScreen(this.githubProvider);

  @override
  Widget build(BuildContext context) {
    final List<Member> members = githubProvider.getMembers();

    return Scaffold(
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return Text(members[index].login);
        },
      ),
    );
  }
}
```

5. We just need to inject our `GithubApiProvider` into the screen constructor. The best place to initialize the provider is at the top of the widget tree, in the app initialization (`main.dart`).

```dart
void main() {
  final githubProvider = GithubApiProvider();

  runApp(MyApp(githubProvider));
}

class MyApp extends StatelessWidget {
  final githubProvider;

  MyApp(this.githubProvider);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MembersListScreen(githubProvider),
    );
  }
}
```

6. We can delete `my_home_screen.dart` as we don't use it anymore.

The resulting app should look like this:
![member-list](./images/2-member-list.png)

### Widgets required

You will probably have to use the following widgets and resources:

- ListView for the list of members

- Text to display the name of each member

### Pay attention to

**JSON handling** is not as easy as with javascript and we need to do some parsing. There are different strategies to deal with this. You can check Flutter documentation for more information on the topic.
[https://flutter.io/docs/development/data-and-backend/json]

A couple of resources that can be interesting when you start using dart:

[https://dartpad.dartlang.org/]

[http://json2dart.com/]
