# Rules for all mwaeckerlin projects

These rules hold for every project below `~/git/mwaeckerlin`, in addition to the global rules in `~/.claude`.

## Sessions

- **The session titled `mwaeckerlin` owns every project below `~/git/mwaeckerlin` that has no session of its own**, redis among them. A project has a session of its own when `python3 /home/marc/.claude/bin/agent-names.py` lists a running session under its title, such as `mwaeckerlin/rsync`.
- **The session `mwaeckerlin` answers to Marc for every `mwaeckerlin/*` session as well.** Asked whether everything is done, it measures every repository below `~/git/mwaeckerlin` (uncommitted files, commits not pushed, open `TODO.md` entries, runners), asks each of those sessions for its state, and reports all of them in one list, each project with what is done, what runs and what Marc has to do. Marc, 2026-10-15: «du bist verantwortlich für alle mwaeckerlin/* sessions!»

## Git

- **The only branch is `master`.** Every mwaeckerlin repository has `master` as its default branch, and no repository carries a `main`. A GitHub workflow names `master` in `on.push.branches` and never `main`: `branches: [master]`. A repository with version branches lists them beside it, `branches: [master, "nc*"]`.
