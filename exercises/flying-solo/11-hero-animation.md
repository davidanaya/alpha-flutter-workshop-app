## 11-hero-animation

Add a basic hero animation to improve the user experience.

### Objectives

We will use the `Hero` widget from Flutter on the user avatar to link the navigation between the two pages.

There is a nice short video that you can watch by clicking on the image below and will show you all you need to know to setup our little example.

[![Hero video](../images/11-video-hero.png)](https://www.youtube.com/watch?v=Be9UH1kXFDw)

1. Wrap the elements that we want to connect with the `Hero` widget and provide a unique tag for each user. Let's use the `member.login` for that.
   We need to make the change both in the `MemberTile` and in the `MemberReposScreen`.

2. If we leave it like this it won't work properly, because in `MemberReposScreen` we are "breaking" the animation by using the Future. But since we already have the `member` we could load the image and wait for the repos information to be retrieved. We can do that by changing the `FutureBuilder` so that it always builds the list even if we don't have any repos.

That's it, same functionality but with a nice animation, which can also be tweaked.

### Widgets required

We need to use the `Hero` widget from Flutter.
