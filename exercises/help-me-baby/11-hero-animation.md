## 11-hero-animation

Add a basic hero animation to improve the user experience.

### Objectives

We will use the `Hero` widget from Flutter on the user avatar to link the navigation between the two pages.

1. Wrap the elements that we want to connect with the `Hero` widget and provide a unique tag for each user. Let's use the `member.login` for that.
   We need to make the change both in the `MemberTile` and in the `MemberReposScreen`.

```dart
return ListTile(
  leading: Hero(
    tag: member.login,
    child: CircleAvatar(
      backgroundImage: NetworkImage(member.avatarUrl),
    ),
  ),
  ...
```

2. If we leave it like this it won't work properly, because in `MemberReposScreen` we are "breaking" the animation by using the Future. But since we already have the `member` we could load the image and wait for the repos information to be retrieved. We can do that easily by changing the `FutureBuilder`.

```dart {
return FutureBuilder(
    future: provider.getReposFromMember(member.login),
    builder: (context, AsyncSnapshot<List<ListItem>> snapshot) =>
        _buildList(snapshot.hasData ? snapshot.data : []));
}
```

That's it, same functionality but with a nice animation, which can also be tweaked.

### Widgets required

We need to use the `Hero` widget from Flutter.
