##############################################
# git functions
#
function peco-git-add() {
  local SELECTED_FILE_TO_ADD="$(git st --porcelain | peco --query "$LBUFFER" | awk -F ' ' '{print $NF}' )"
  if [ -n "$SELECTED_FILE_TO_ADD" ]; then
    BUFFER="git add $(echo "$SELECTED_FILE_TO_ADD" | tr '\n' ' ')"
    CURSOR="$#BUFFER"
  fi
  zle accept-line
  # zle clear-screen
}
zle -N peco-git-add
bindkey "^ga" peco-git-add

function peco-git-checkout() {
  local SELECTED_BRANCH="$(git br -a | cut -b 3- | grep -v -- "->" | peco | sed -e "s/\* //g")"
  if [ -n "$SELECTED_BRANCH" ]; then
    BUFFER="git co $(echo "$SELECTED_BRANCH" | tr '\n' ' ')"
    CURSOR="$#BUFFER"
  fi
  zle accept-line
}
zle -N peco-git-checkout
bindkey "^gc" peco-git-checkout