# Rules for all mwaeckerlin projects

These rules hold for every project below `~/git/mwaeckerlin`, in addition to the global rules in `~/.claude`.

## Sessions

- **The session titled `mwaeckerlin` owns every project below `~/git/mwaeckerlin` that has no session of its own**, redis among them. A project has a session of its own when `python3 ~/.claude/bin/agent-names.py` lists a running session under its title, such as `mwaeckerlin/rsync`.
- **The session `mwaeckerlin` answers to Marc for every `mwaeckerlin/*` session as well.** Asked whether everything is done, it measures every repository below `~/git/mwaeckerlin` (uncommitted files, commits not pushed, open `TODO.md` entries, runners), asks each of those sessions for its state, and reports all of them in one list, each project with what is done, what runs and what Marc has to do. Marc, 2026-10-15: «du bist verantwortlich für alle mwaeckerlin/* sessions!» **A question about the state gets a report and no instruction.** Work for a project with a session of its own runs in that session and is passed to it; this session does the work itself only where a project has none. Marc, 2026-10-16: «du musst es an die Sessions verteilen, alles läuft in der entsprechenden session … Meine Frage war nur, ob alle fertig sind.» **The decisions of those sessions stay theirs.** A question that development/coder or another session puts to Marc is never a blocker of this session, even where a sub-agent of this session met it in the work: it goes to the owning session and out of this session's answers. Marc, 2026-11-03: «Du hast keine fucking blocker! Nicht wo du nicht zuständig bist!»

## Git

- **The only branch is `master`.** Every mwaeckerlin repository has `master` as its default branch, and no repository carries a `main`. A GitHub workflow names `master` in `on.push.branches` and never `main`: `branches: [master]`. A repository with version branches lists them beside it, `branches: [master, "nc*"]`.

## Test runs

- **The pipeline of a pushed commit runs every test of its repository:** the reusable workflow `docker-image.yml` of `mwaeckerlin/scratch` runs `npm test` on amd64 and arm64 before it publishes an image. A green pipeline of the committed content counts as its full regression, so no test has to run locally; a local heavy run still goes through the machine queue. Marc, 2026-11-18: «Du kannst zum Testen auch die Pipelines nutzen im CI/CD. … die Tests müssen nicht mehr zwingend lokal ausgeführt werden.»
- **The pipeline runs once, for the finished change:** everything is implemented and its small tests pass locally first, then the change is committed and pushed once, and that pipeline is the full regression. No commit exists only to try a test, and no pipeline is started again to repeat one. Marc, 2026-11-18: «Erst alles fertig implementieren und dann einmal ausführen. … Nicht 1000-mal irgendwas committen, nur um zu testen … Auch Testrepetierung und so weiter geht natürlich nicht. Die Pipeline ist ideal für den ganzen großen, vollen Regresstest.»
