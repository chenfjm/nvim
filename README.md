
VimPlugins
=========

### Quick Installation  

	```bash
	$cd ~/.config
	$git clone https://github.com/chenfjm/nvim.git
	$pip install neovim
	$npm install -g neovim
	$:Copilot setup (in vim)
	$:checkhealth (in vim)
	```

### Requirements  

- Mac OS

  ```bash
  $brew install ctags nodejs autopep8 yapf ripgrep bat golang
  $npm install eslint eslint-plugin-vue eslint-plugin-react typescript -g  
  ```


- Linux    

  ```bash
  $yum install ctags nodejs autopep8 yapf ripgrep golang
  $npm install eslint eslint-plugin-vue eslint-plugin-react typescript -g
  ```

- pip

  ```bash
  $ pip install neovim jedi pylint doq
  ```
- make

  ```bash
  $ cd ~/.config/nvim/plugged/vim-pydocstring
  $ make
  $ cd ~/.config/nvim/plugged/vim-hexokinasee
  $ make hexokinase
  ```

### Included Color Schemes

- [Nord](https://github.com/arcticicestudio/nord-vim) (*default*)
- [Monokai](https://github.com/sickill/vim-monokai)
- [solarized](https://github.com/altercation/vim-colors-solarized)

### Included Plugins

  ```
	"color
	Plug 'altercation/vim-colors-solarized'
	Plug 'sickill/vim-monokai'
	Plug 'arcticicestudio/nord-vim'
	Plug 'luochen1990/rainbow'

	"common
	Plug 'itchyny/lightline.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'majutsushi/tagbar'
	Plug 'tmhedberg/SimpylFold'
	Plug 'scrooloose/nerdcommenter'
	Plug 'dense-analysis/ale'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'ybian/smartim'
	Plug 'godlygeek/tabular'
	Plug 'preservim/vim-markdown'
	Plug 'elzr/vim-json'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'easymotion/vim-easymotion'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'airblade/vim-gitgutter'
	Plug 'Yggdroot/indentLine'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'Chiel92/vim-autoformat'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'voldikss/vim-floaterm'
	Plug 'puremourning/vimspector'
	Plug 'github/copilot.vim'
	"Plug 'ryanoasis/vim-devicons'

	"python
	Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
	Plug 'davidhalter/jedi-vim'

	"js
	Plug 'mattn/emmet-vim'
	Plug 'marijnh/tern_for_vim'
	Plug 'pangloss/vim-javascript'
	Plug 'othree/xml.vim'
	Plug 'KohPoll/vim-less'
	Plug 'lepture/vim-css'
	Plug 'darthmall/vim-vue'
	Plug 'mxw/vim-jsx'
	Plug 'justinj/vim-react-snippets'
	Plug 'chemzqm/wxapp.vim'

	"go
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  ```

### Quick Tutorial

- 窗口分割

  ```
  wm: 开启/关闭NerdTree窗口
  wv: 垂直切分窗口
  wc: 关闭窗口
  wq: 打开 quick fix 窗口
  tb: 开启/关闭TagBar窗口
  wt: 打开终端
  m: 管理当前节点
  ```


- 快速定位

  ```
  <C-p>: 打开文件搜索控件
  <C-a>: 快速搜索
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
  <C-g>: 获取类、函数的Docstring
  <C-e>: html、js补全
  <C-c>: 切换注释
  pd: 自动添加Docstring
  cc: git commit
  bb: git commit (buffer)
  mm: git blame
  
  SpaceSpace: 代码折叠
  ```

- 其他

  ```
  <C-n>: 多光标
  <C-m>: 全选多光标
  cs({: 替换(为{
  ```

### Screenshots

![](https://chenfjm.github.io/nvim/images/vim1.png)
![](https://chenfjm.github.io/nvim/images/vim2.png)
![](https://chenfjm.github.io/nvim/images/vim3.png)
