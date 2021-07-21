# iterm2_vimrc_tmux_zshtheme
config of iterm2 vim tmux zshtheme
---
pwd of ys.zsh-theme:`~/.oh-my-zsh/themes`
for only support git branch
change `~/.oh-my-zsh/lib/git.zsh` git_prompt_info function
```bash
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
```
---
![image](https://user-images.githubusercontent.com/61652635/125166260-5b39ec00-e1cd-11eb-87ae-185896e0450c.png)
