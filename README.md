# Git Multi Repo

A lighweight CLI tool to manage multiple git repositories.

If you have multiple git repository clones in your system that have similar folder structures,
you sometimes need to apply changes to all of them.
For example, if you need to apply a config or build script change.

This tool provides the necessary functionality to easily overwrite files, commit, and push them.

## Requirements

* [Bash](https://www.gnu.org/software/bash/) _(Installed by default on UNIX machines)_

## Install

### Automatically

This will automatically clone this repo into `$HOME/.gmr` (_requires [git](https://git-scm.com/)_),
and adds this tool to your `$PATH`.

```bash
$ sh -c "`curl -fsSl https://raw.githubusercontent.com/rubensworks/git-multi-repo.sh/master/install.sh`"
```

If you want to uninstall later, just remove `$HOME/.gmr` and the `$PATH` modification in `~/.bashrc`.

### Manually

First, clone this repo somewhere:

```bash
$ git clone git@github.com:rubensworks/git-multi-repo.sh.git
```

Then, add the `/bin` folder to your `$PATH`.
For example, by adding the following to your `~/.bashrc`

```bash
export PATH="/path/to/git-multi-repo.sh/bin:$PATH"
```

## Getting started

### 1. Initialize a multirepo environment

Creates a new **environment** in which multirepo changes can be applied.

```bash
$ gmr init my-multirepo
```

This will create a new folder `my-multirepo`,
which is to be used when the `gmr` command is invoked.

### 2. Add git repositories to the multirepo environment.

Include one or more git repo clones into our multirepo environment.

```bash
$ gmr add path/to/repo1
$ gmr add path/to/repo2
```

### 3. View the status of all repositories

Quickly see an overview of the state of all the configured repos.

```bash
$ gmr status
Repo1 - master - Unstaged changes - Staged changes
Repo1 - master - Pending commits: 1 - Unstaged changes
```

### 4. Add a file to all repos

Add the `my-config.txt` file to all repos,
and stage it so it can be committed later.

```bash
$ gmr set my-config.txt
```

### 5. Commit and push

Create a commit in all repos, and push it.

```bash
$ gmr commit -m "Add my config"
$ gmr push
```

## Usage overview

### Print current git multi repo tool version

```bash
$ gmr version
0.0.1
```

### Initialize a new multirepo

Creates a new **environment** in which multirepo changes can be applied.

```bash
$ gmr init my-multirepo
```

This will create a new folder `my-multirepo`,
which is to be used when the `gmr` command is invoked.

### Add git repositories to the multirepo environment.

Include one or more git repo clones into our multirepo environment.

```bash
$ gmr add path/to/repo1
$ gmr add path/to/repo2
```

### View status

Quickly see an overview of the state of all the configured repos.

```bash
$ gmr status
Repo1 - master - Unstaged changes - Staged changes
Repo1 - master - Pending commits: 1 - Unstaged changes
```

### Pull the latest changes

Pull the latest version of the current branch from their origin of all repos.

```bash
$ gmr pull
```

### Fetch the latest changes

Fetch the latest version of the current branch from their origin of all repos.

```bash
$ gmr fetch
```

### Push new changes

Push the latest version of the current branch to their origin of all repos.

```bash
$ gmr push
```

Additional options can optionally be passed, such as `-f`.

### Stash changes

Run git stash in all repos.

```bash
$ gmr fetch
```

### Add a file or directory

Add a file or directory to all repos,
and stage it so it can be committed later.

```bash
$ gmr set my-file.txt path/to/folder.txt
```

After this, the added or changed files will automatically be staged, so they can be committed later.

### Commit new changes

Creates a commit in all repos.

```bash
$ gmr commit -m "My new commit"
```

Additional options can optionally be passed, such as `--amend`.

## License

This code is copyrighted by [Ruben Taelman](https://www.rubensworks.net/)
and released under the [MIT license](http://opensource.org/licenses/MIT).
