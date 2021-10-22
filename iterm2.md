### iterm2



```bash
## 准备终端自动补全文件
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

## 准备vim模式
git clone https://github.com/jeffreytse/zsh-vi-mode.git ~/.zsh/zsh-vi-mode

## 双击安装主题
wget https://github.com/sindresorhus/iterm2-snazzy/raw/main/Snazzy.itermcolors

##  双击安装字体
wget https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip

##  下载iterm2
wget https://iterm2.com/downloads/stable/iTerm2-3_4_10.zip

## 配置iterm2
1、右键preferences
2、Appearance -->把Theme设置为Minimal
3、Profiles --Colors -->右下角Color Presets---选择Snazzy
4、Profiles --Text  -->Font 设置为Fira Code | Regular |24


## 安装 starship美化工具
brew install starship

## 写入配置
cat <<EOF > ~/.zshrc
## base setting
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

## for proxy
alias proxy='export all_proxy=socks5://127.0.0.1:6688'
alias unproxy='unset all_proxy'
alias ll='ls -lh'


## for golang
export GOPROXY=https://goproxy.io,direct
alias golinux='CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o mainlinux main.go'
alias gowindows='CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o mainwindows main.go'
alias gomac='CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o mainmac main.go'
alias godata="cd /Volumes/HDD/htdocs/go"

## for nodejs
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

## for auto complete history and vim mode
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

## for brew speed
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles

## for what?
eval "$(starship init zsh)"
EOF


```
