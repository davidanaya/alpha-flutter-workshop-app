## 8-repos-list-avatar

Add the avatar image above the repo list.

### Objectives

We want to add the avatar on top of the list of repos for a user.
There are a few alternatives to achieve this, but as we already have that value in the initial screen it would be ideal to pass that information to the repos screen. This will raise a few complications, so for now assume that we have this information already in `MemberReposScreen` (you can hardcode it).

1. Add the url for the member's avatar in `MemberReposScreen` as a final property.

2. The easiest way to display the image is by adding it to the list of repos. You can follow this idea from Flutter's cookbook:

   [Creating lists with different types of items](https://flutter.io/docs/cookbook/lists/mixed-list)

The repos screen should look like this:

![repos-list-avatar](./images/8-repos-list-avatar.png)

### Widgets required

No new widgets should be required, but feel free to experiment with some styles for the updated `MemberReposScreen`.
