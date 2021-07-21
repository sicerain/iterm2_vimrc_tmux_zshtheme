# iterm2_vimrc_tmux_zshtheme
config of iterm2 vim tmux zshtheme
---
pwd of ys.zsh-theme:`~/.oh-my-zsh/themes`<br>
for only support git branch<br>
change `~/.oh-my-zsh/lib/git.zsh` git_prompt_info function<br>
```bash
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
```
---
![image](https://user-images.githubusercontent.com/61652635/126428556-c3c55b60-0886-427a-a7ec-8a514ba63af5.png)
