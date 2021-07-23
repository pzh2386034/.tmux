# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ANTIGEN="$HOME/tools/antigen/antigen.zsh"

source "$ANTIGEN"
antigen use prezto
antigen bundle rupa/z z.sh
antigen bundle Vifon/deer
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle willghatch/zsh-cdr
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle zsh-users/zsh-completions
#antigen bundle zsh-users/zsh-autosuggestions
# no use
antigen bundle autojump
antigen bundle sorin-ionescu/prezto
# power line status
antigen theme romkatv/powerlevel10k
# display aliases command 
antigen bundle "MichaelAquilina/zsh-you-should-use"
antigen bundle supercrabtree/k
# antigen bundle zsh-users/zsh-history-substring-search
# enhance cd
antigen bundle b4b4r07/enhancd
antigen bundle denisidoro/navi
antigen bundle zsh-users/zaw
antigen bundle supercrabtree/k #list file info



# self bind key
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^h' backward-delete-char
bindkey '^j' backward-kill-word
bindkey '^g' backward-char
bindkey '^f' forward-char
bindkey '^[' backward-word
bindkey '^]' forward-word



setopt auto_pushd
hash -d bmc=$HOME/wks/openbmc
hash -d tri=/Volumes/workdir/openbmc-2600-202003023/openbmc-master/build/tririvers
hash -d star=/Volumes/workdir/openbmc-2600-202003023/openbmc-master/build/starlake
hash -d old=/Volumes/workdir/openbmc/build/starlake

# 不以空格开头的命令记录到历史中
setopt hist_ignore_space

antigen apply
#source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
alias obmc='docker run --rm -it -v myvolume:/workdir -v /Users/pan/wks:/opt zeuspan/obmc-compile:v2'
alias onet='sudo ifconfig lo0 127.0.0.2 alias up;docker start sam'
alias qemu='f() { qemu-system-arm -m 256 -M romulus-bmc -nographic -drive file=$1,format=raw,if=mtd -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu };f'
alias qemu2600='f() { qemu-system-arm -m 256 -M ast2600-evb -nographic -drive file=$1,format=raw,if=mtd -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu };f'
alias example='f() { echo Your arg was $1. };f'
alias nmap_bmc='f() { nmap -sn 192.168.1.0/24 }; f'
