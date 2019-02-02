## 9-scoped-model

Refactor the app so that we don't need to pass the provider around.

### Objectives

We are going to refactor the app to use the **Scoped Model**, which is one of the state management techniques available for us to deal with state.

This is most used when dealing with shared state. In our case, we don't really have state because we don't keep a copy of the repos or members, but you can imagine that we could do that and save a cached copy in our `GithubApiProvider`.

These are the steps we need to follow to refactor our code:

1. Install the library [scoped_model](https://pub.dartlang.org/packages/scoped_model).

2. Move our `GithubApiProvider` from `src/providers` to `src/scoped-models`. In order to be able to pass the provider down to descendant widgets, now our provider needs to extend `Model`.

```dart
import 'package:scoped_model/scoped_model.dart';

class GithubApiProvider extends Model {
  ...
}
```

3. Instead of instantiating and keeping an instance of the provider in `MyApp` widget, we will pass it down using a special widget `ScopedModel`. We can also remove the provider injection when navigating to the screens.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<GithubApiProvider>(
        model: GithubApiProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: _routes,
        ));
  }

  Route _routes(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => settings.name == '/'
            ? MembersListScreen()
            : MemberReposScreen(memberName: settings.name));
  }
}
```

4. Now we can retrieve the provider from any widget in the app. This will be the same instance, so we could potencially keep any state there. Let's do it in `MemberReposScreen`.

```dart
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
```

For `MembersListScreen` it would be the same idea.

### Widgets required

We will need a couple of widgets from the new `scoped_model` library:

- `ScopedModel` to instantiate the model (provider) and pass it down the widget tree.
- `ScopedModelDescendant` to retrieve the model and use it.

### Pay attention to

This is one of the simplest ways to keep and share state in a Flutter app and it's very useful for small apps where the state is also simple. For bigger apps there are better and more reactive alternatives (like my beloved BLoC pattern).
