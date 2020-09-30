#!/bin/zsh

# ------------------------------
# zplug Settings
# ------------------------------
source ~/.zplug/init.zsh

zplug 'dracula/zsh', as:theme
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

if ! zplug check; then
    zplug install
fi

zplug load

# ------------------------------
# Zsh General Settings
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

bindkey -e              # キーバインドをemacsモードに設定
#bindkey -v               # キーバインドをviモードに設定

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する 
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### Glob ###
setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# bindkey "^[[A" history-beginning-search-backward-end # 上矢印でマッチしたヒストリ検索(逆)
# bindkey "^[[B" history-beginning-search-forward-end  # 下矢印でマッチしたヒストリ検索


# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
autoload -Uz colors; colors

### vcs_info ###
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true # formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{red}!%F{yellow}" # commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{red}*" # add されていないファイルがある
zstyle ':vcs_info:*' formats " %F{cyan}(%s) %f%F{green}%c%u [🌲 %b]%f" # 通常
zstyle ':vcs_info:*' actionformats '(%s) - [%b|%a]' # rebase 途中,merge コンフリクト等 formats 外の表示
precmd () { vcs_info }

# PROMPT設定
PROMPT='💻 %F{green}%n%f%F{cyan}@%f%F{blue}%m%f %F{magenta}[📂 %~]%f${vcs_info_msg_0_} %F{cyan}[🕒 %*]%f
%F{cyan}%B%#%b%f '
RPROMPT=''

# iTermのtitle設定
function chpwd() { 
  echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print $1"/"$2}'| rev)\007"
}
# 現在のディレクトリ情報をtitleに出力
chpwd;

# ------------------------------
# Other Settings
# ------------------------------

# cdコマンド実行後、lsとタイトルセットを実行する
function cd() {
  builtin cd $@ && ls -a;
  chpwd; 
}

function mov2gif() {
  palette="palette.png"
  filters="fps=30,scale=300:-1:flags=lanczos"
  ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
  ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2

  rm $palette
}

# PATH設定 (sbin: for Homebrew)
PATH="/usr/local/sbin:$PATH"

# anyenv
eval "$(anyenv init -)"

