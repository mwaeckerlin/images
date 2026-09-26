# Rules for all mwaeckerlin projects

These rules hold for every project below `~/git/mwaeckerlin`, in addition to the global rules in `~/.claude`.

## Git

- **The only branch is `master`.** Every mwaeckerlin repository has `master` as its default branch, and no repository carries a `main`. A GitHub workflow names `master` in `on.push.branches` and never `main`: `branches: [master]`. A repository with version branches lists them beside it, `branches: [master, "nc*"]`.
