## 3-format-list

Time to add some format to the list.

### Objectives

We are going to replace the `Text` widget with the name with something better.

1. Create a file `member_tile.dart` inside `src/widgets` and copy the following.

```dart
class MemberTile extends StatelessWidget {
  // TODO this widget needs a member

  // TODO create a build method and create the view for each member
  // You can use ListTile or build your own widget
}
```

2. Now let's use it in our `MembersListScreen` instead of Text.

The resulting app should look like this:

![format-list](../images/3-format-list.png)

### Widgets required

You will probably have to use the following widgets and resources:

- `ListTile` for the list of members

- `CircleAvatar` and `NetworkImage` to display the image for each member

### Pay attention to

ListTile has a lot of different options to give some style to the items within the list, but remember you can use any widget instead of ListView.
