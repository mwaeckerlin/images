# Rules for all mwaeckerlin projects

These rules hold for every project below `~/git/mwaeckerlin`, in addition to the global rules in `~/.claude`.

## Sessions

- **The session titled `mwaeckerlin` owns every project below `~/git/mwaeckerlin` that has no session of its own**, redis among them. A project has a session of its own when `python3 /home/marc/.claude/bin/agent-names.py` lists a running session under its title, such as `mwaeckerlin/rsync`.

## Git

- **The only branch is `master`.** Every mwaeckerlin repository has `master` as its default branch, and no repository carries a `main`. A GitHub workflow names `master` in `on.push.branches` and never `main`: `branches: [master]`. A repository with version branches lists them beside it, `branches: [master, "nc*"]`.
