
``` helper
#### A note about Sync in GitHub for Mac

Those that are already familiar with Git may notice that there are no "Push" or "Pull" buttons in GitHub for Mac.

Instead of bringing in new changes from the remote copy with one command and pushing your unpublished commits with another, GitHub for Mac uses a single "Sync" button that quickly completes both operations at the same. Behind the scenes, we do the equivalent of a `git pull --rebase` (but make sure to never rewrite merges).
```
