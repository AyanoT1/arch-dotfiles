eval "$(starship init zsh)"

HISTFILE=~/zsh_history

HISTSIZE=5000
SAVEHIST=5000

setopt APPEND_HISTORY   
setopt SHARE_HISTORY           
setopt HIST_IGNORE_DUPS         
setopt HIST_IGNORE_SPACE       
setopt HIST_REDUCE_BLANKS      
setopt HIST_VERIFY
           
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
