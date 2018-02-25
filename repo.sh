export REPOSITORIES=~/Sites

function repo() {
  local GREEN='\033[0;32m'
  local RED='\033[0;31m'
  local NC='\033[0m'
  
  # Check that the $REPOSITORIES variable is set
  if [ ! -d "$REPOSITORIES" ]; then
    echo "${RED}\$REPOSITORIES must be a directory${NC}"
    return 1
  fi

  case "$1" in
    help)
      echo "
  Usage: repo [<command>] [<name>]

  repo                   Change directory into ${GREEN}\$REPOSITORIES${NC}
  repo <name>            Change directory into a repository
  repo list              List all repositories
  repo add <name>        Create a new directory in ${GREEN}\$REPOSITORIES${NC} and change into it
  repo add <git_url>     Clone a Git repository into ${GREEN}\$REPOSITORIES${NC} and change into it
  repo remove <name>     Move a repository into Trash
  repo help              Show help text for all commands

  Where <name> is a directory inside ${GREEN}\$REPOSITORIES${NC} (or one to be added)
      ";
    ;;
    add)
      if [ -z "$2" ]; then
        echo "${RED}Please specify a directory name to add${NC}"
        return 1
      elif [ -d "$REPOSITORIES/$2" ]; then
        echo "${RED}A directory '$2' already exists${NC}"
        return 1
      elif [[ "$2" =~ \.git$ ]]; then	
      	base=$(basename $2)	
      	name="${base%.*}"	
      	git clone $2 $REPOSITORIES/$name	
      	cd "$REPOSITORIES/$name"
      else
        mkdir "$REPOSITORIES/$2"
        cd "$REPOSITORIES/$2"
        return 0
      fi
    ;;
    list)
      local repos=$(find $REPOSITORIES -type d -maxdepth 1 -mindepth 1)
      if [ -z "$repos" ]; then
        echo "${RED}No repositories found${NC}"
        return 1
      else
        for entry in $REPOSITORIES/*; do [ -d "$entry" ];
          basename $entry
        done
        return 0
      fi
    ;;
    remove)
      if [ -z "$2" ]; then
        echo "${RED}Please specify a directory name to remove${NC}"
        return 1
      elif [ -d "$REPOSITORIES/$2" ]; then
        mv "$REPOSITORIES/$2" ~/.trash
        return 0
      else
        echo "${RED}No directory '$2' found${NC}"
        return 1
      fi
    ;;
    *)
      if [ -d "$REPOSITORIES/$1" ]; then
        cd "$REPOSITORIES/$1"
        return 0
      else
        cd "$REPOSITORIES"
        return 0
      fi
    ;;
  esac
}

# Autocompletions for ZSH
if [ -n $(type compdef &>/dev/null) ]; then
  function _repo_completion() {
    compls=$(repo list)
    completions=(${=compls})
    compadd -- $completions
  }
  compdef _repo_completion repo
fi