## 10-refactor-avatar

Refactor the navigation so that we can use the proper avatar.

### Objectives

Instead of using a named route, we need to navigate directly and pass the whole member.

1. Remove the routes management from `main.dart` and add the `home` property again as we were doing when we first implemented the navigation.

2. Navigate from `MemberTile` and pass the whole member to `MemberReposScreen`.

3. Replace `String memberName` by `Member member` as named parameter in `MemberReposScreen`.

4. Use `member.avatarUrl` and remove the hardcoded url.

Now we should be able to see the proper image for each user.

### Widgets required

No new widgets are required.
