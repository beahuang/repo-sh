# repo-sh

> Small CLI for quickly switching between projects

## Why

The usual methods to change directory between projects are awkward and cumbersome, especially when you just need to switch quickly:

1. Write `cd` in the terminal, find the folder in Finder, and drag it into the terminal
2. Memorize the full path and write out the full command every time
3. Search through previous commands using the `↑` key

Using this `repo` function is much quicker, and even covers additional use cases beyond just changing directory — like adding a new repository to your Sites directory!

## Installation

Copy the contents of the `repo.sh` file and paste them into your `~/.zshrc` file. The function needs to be placed in your shell resource file because it needs to be declared when your interactive shell session initializes.

### Bash Users

If you are using Bash, the contents should be pasted in `~/.bashrc`. Note that the autocompletion definitions won't work in Bash, and so are skipped altogether.

## Usage

```sh
# Change directory into $REPOSITORIES
repo
# Change directory into a repository
repo <name>
# List all repositories
repo list
# Create a new directory in $REPOSITORIES and change into it
repo add <name>
# Clone a Git repository into $REPOSITORIES and change into it
repo add <git_url>
# Move a repository into Trash
repo remove <name>
# Show help text for all commands
repo help
```

If you store your repositories in a directory other than `~/Sites`, you can change the value of the `$REPOSITORIES` variable to the path to that directory.