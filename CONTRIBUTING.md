# Contributing

## Making Changes

Pull request against a development branch.

[SemVer](http://semver.org) is used for versioning.

Adhere to the [style guide](https://github.com/PoshCode/PowerShellPracticeAndStyle)

Update [README](README.md) documentation as well to reflect contribution.

## Branching

Note that commits to master / main are prevented in the remote. A precommit hook is located in .githooks that will stop commits to the local master / main.

To activate it run:

```bash
git config --local core.hooksPath .githooks/
```

To confirm that it is set run:

```bash
git config --local --get core.hooksPath
```
