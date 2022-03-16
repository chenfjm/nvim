
VimPlugins
=========

### Quick Installation  

	$git clone https://github.com/chenfjm/VimPlugins.git
	$mv VimPlugins ~/.vim
	$cd .vim
	$git submodule init
	$git submodule update   
	$cp .vimrc ~

### PluginInstall  

	$:PluginInstall (in vim)
	$:GoInstallBinaries (in vim)
	$cd ~/.vim/bundle/YouCompleteMe
	$python3 install.py  --go-completer (--clang-completer)

### Requirements  

- Mac OS

  ```
  $brew install ctags nodejs autopep8 yapf ripgrep bat
  $pip install pylint flake8 
  $npm install eslint eslint-plugin-vue eslint-plugin-react typescript -g  
  ```


- Linux    

  ```
  $yum install ctags nodejs autopep8 yapf ripgrep
  $pip install pylint flake8 
  $npm install ellint eslint-plugin-vue eslint-plugin-react typescript -g
  ```

- pip

  ```
  $ pip install jedi
  $ cd ~/.vim/bundle/vim-pydocstring
  $ make
  ```

### Included Color Schemes

- [Monokai](https://github.com/sickill/vim-monokai) (*default*)
- [solarized](https://github.com/altercation/vim-colors-solarized)

### Included Plugins

- [vim-powerline](https://github.com/Lokaltog/vim-powerline)
- [MatchTag](https://github.com/gregsexton/MatchTag)
- [delimitMate.vim](https://github.com/vim-scripts/delimitMate.vim)
- [Vundle.vim](https://github.com/VundleVim/Vundle.vim)
- [Mark--Karkat](https://github.com/vim-scripts/Mark--Karkat)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [tagbar](https://github.com/majutsushi/tagbar)
- [SimpylFold](https://github.com/tmhedberg/SimpylFold)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
- [vim-pydocstring](https://github.com/heavenshell/vim-pydocstring)
- [vim-javascript](https://github.com/pangloss/vim-javascript)
- [xml.vim](https://github.com/othree/xml.vim)
- [vim-less](https://github.com/groenewege/vim-less)
- [vim-css](https://github.com/lepture/vim-css)
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
- [jedi-vim](https://github.com/chenfjm/jedi-vim)
- [Pydiction](https://github.com/rkulla/pydiction)
- [syntastic](https://github.com/vim-syntastic/syntastic)
- [ultisnips](https://github.com/SirVer/ultisnips)
- [vim-snippets](https://github.com/honza/vim-snippets)
- [emmet-vim](https://github.com/mattn/emmet-vim)
- [smartim](https://github.com/ybian/smartim)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)

### Quick Tutorial

- 窗口分割

  ```
  wm: 开启/关闭NerdTree窗口
  wv: 垂直切分窗口
  wc: 关闭窗口
  wq: 打开 quick fix 窗口
  tb: 开启/关闭TagBar窗口
  m: 管理当前节点
  ```


- 快速定位

  ```
  <C-p>: 打开文件搜索控件
  :vimgrep name **: 在当前目录下递归搜索含有name的文件内容
  gg: 到文件首行
  G: 到文件末尾
  ^: 到文件行首
  $: 到文件行尾
  ```

- 编程相关

  ```
  <C-i>: 前进
  <C-o>: 后退
  <C-]>: 跳转
  <C-u>: 列出类、函数在哪使用
  <C-a>: 自动添加Docstring
  <C-g>: 获取类、函数的Docstring
  <C-e>: html、js补全
  <C-c>: 切换注释
  \cc  : 注释代码
  \cu  : 解除注释
  SpaceSpace: 代码折叠
  ```

- 其他

  ```
  <C-n>: 多光标
  <C-m>: 全选多光标
  cs({: 替换(为{
  ```

### Screenshots

![](https://chenfjm.github.io/VimPlugins/images/vim1.png)
![](https://chenfjm.github.io/VimPlugins/images/vim2.png)
![](https://chenfjm.github.io/VimPlugins/images/vim3.png)
