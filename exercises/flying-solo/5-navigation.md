## 5-navigation

Navigate to a new page (named route).

### Objectives

We are going to introduce navigation in the app. The new page will be accessible by clicking in a member in the list and will eventually display the list of github repos for that particular member.

1. Let's create the new page. It will be an empty page with a header and the name of the screen displayed. Call it `MemberReposScreen` and place it in the right folder in the project structure.

   _(tip: use appBar named parameter in Scaffold to add a header bar with a back button)_

2. We need to navigate to that page. There are a few ways to do it, but in this case we will use normal `Navigator.push`. Use the `tap` listener in `ListTile` in our custom widget `MemberTile`.

You can read [how to navigate to another page](https://flutter.dev/docs/cookbook/networking/fetch-data#2-make-a-network-request).

That's it, you should be able to navigate to the new page and back

### Widgets required

You will probably have to use the following widgets and resources:

- `Scaffold` with `appBar` for the header navigation bar.

- `Navigator` to navigate between pages.

### Pay attention to

There are a few ways to navigate in Flutter, always using `Navigator` to trigger the navigation.

In this case what we did is fine, but what if we need to pass parameters or inject any dependency?
