# repo-sh

> Small CLI for quickly switching between projects

## Why

The usual methods to change directory between projects are awkward and cumbersome, especially when you just need to switch quickly:

1. Write `cd` in the terminal, find the folder in Finder, and drag it into the terminal
2. Memorize the full path and write out the full command every time
3. Search through previous commands using the `↑` key

Using this `proj` function is much quicker, and even covers additional use cases beyond just changing directory — like adding a new repository to your Sites directory!

## Installation

Copy the contents of the `repo.sh` file and paste them into your `~/.zshrc` file. The function needs to be placed in your shell resource file because it needs to be declared when your interactive shell session initializes.

## Usage

```sh
# Change directory into $REPOSITORIES
proj
# Change directory into a repository
proj <name>
# List all repositories
proj list
# Create a new directory in $REPOSITORIES and change into it
proj add <name>
# Clone a Git repository into $REPOSITORIES and change into it
proj add <git_url> <opt_dir_name>
# Move a repository into Trash
proj remove <name>
# Show help text for all commands
proj help
```

If you store your repositories in a directory other than `~/Sites`, you can change the value of the `$REPOSITORIES` variable to the path to that directory.