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
![image](https://user-images.githubusercontent.com/61652635/126427932-68426b6d-19fe-438e-95cc-d44e7469fe48.png)
