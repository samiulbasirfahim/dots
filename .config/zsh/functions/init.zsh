function fw() {
    RG_PREFIX='rg -i --column --line-number --color=always'
    INITIAL_QUERY=''
    fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --style=plain,numbers --color=always  --theme=gruvbox-dark {1} --highlight-line {2}' \
    --preview-window 'right,60%,border-left,+{2}+3/3,~3' \
    --bind 'enter:become(/usr/bin/nvim {1} +{2})'
}

function ff() {
    RG_PREFIX="fd --strip-cwd-prefix --type file"
    INITIAL_QUERY=''
    fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --style=plain,numbers --color=always  --theme=gruvbox-dark {1}' \
    --preview-window 'right,60%,border-left,+{2}+3/3,~3' | sed 's/^\(.*\)$/"\1"/' | xargs -r -n 1 xdg-open
}

function vid() {
    if [ $# -eq 0 ]
    then
        filename="$(fd --type=directory --type=file --regex ".mp4|.mkv|.webm" | fzf --layout=reverse)"
        if [[ -f "$filename" ]]
        then
            mpv $filename && vid
        fi
    else
        if [[ -f "$1" ]]
        then
            mpv "$1" && vid
        else 
            results="$(fd --type=directory --type=file --regex ".mp4|.mkv|.webm" | grep --color=always -i $1)"
            count="$(echo $results | wc -l)"
            if [[ $count -gt 1 ]]
            then
                mpv "$(echo $results | fzf --layout=reverse)" && vid
             else 
                 if [[ -f "$results" ]]
                 then
                    mpv $results && vid
                else
                    echo "No results for $1"
                 fi
            fi
        fi
    fi

}




function mkcd() {
  mkdir -p $@ && cd ${@:$#}
}


function buffer-fzf-history() {
  local HISTORY=$(history -n -r 1 | fzf +m)
  BUFFER=$HISTORY
  if [ -n "$HISTORY" ]; then
    CURSOR=$#BUFFER
  else
    zle accept-line
  fi
}

function slash-backward-kill-word() {
    local WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
    zle backward-kill-word
}

function zoxide_cd () {
    local dir
    dir=$(zoxide query -i)
    cd -- $dir
    zle reset-prompt
}

function v () {
    if [ -d "$1" ]; then
        current="$(pwd)"
        cd "$1"
        /usr/bin/nvim && cd "$current"
    else 
        /usr/bin/nvim "$1"
    fi
}

zle -N slash-backward-kill-word
zle -N buffer-fzf-history
zle -N zoxide_cd
