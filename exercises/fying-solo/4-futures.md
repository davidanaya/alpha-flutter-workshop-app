## 4-futures

Real http calls to github api.

### Objectives

It's time to replace the fake data with real one fetched from api.github with http.

1. Add the [http library](https://pub.dartlang.org/packages/http) to our [pubspec.yaml](../pubspec.yaml)

   Just edit the file and make sure the `dependencies` section looks like this:

```yaml
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.2

  http: ^0.12.0+1
```

VSCode should automatically update the libraries, or you can run `flutter packages get`.

2. We need to modify our provider to get the real data. The important part here is that we are now returning a Future (Promise) instead of just the list of members.

You can have a look on how to [make an http request](https://flutter.dev/docs/cookbook/networking/fetch-data#2-make-a-network-request)

```dart
Future<List<Member>> getMembers() async {
  // TODO call the real API and retrieve your members

  // TODO parse your json into a list of members and return it
}
```

3. Now to use it, we need a special widget, `FutureBuilder`, as the previous method is now asynchronous.

```dart
Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder(
        // TODO provide the Future and a builder
  );
}
```

The app should look exactly the same, but now we will get a small delay while we fetch the items and a spinner should be displayed while we do that.

### Widgets required

You will probably have to use the following widgets and resources:

- `FutureBuilder` to build a widget based on a Future.

- `CircularProgressIndicator` to display a basic spinner.

### Pay attention to

Adding Futures means we start dealing with asynchrony and everything might get a bit more complicated. Flutter (dart) has excellent support for Futures and Streams (with the equivalent `StreamBuilder`).
