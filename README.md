
nvim
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
  $brew install ctags nodejs autopep8 flake8 ripgrep bat golang
  $npm install eslint eslint-plugin-vue eslint-plugin-react typescript -g  
  ```


- Linux    

  ```bash
  $yum install ctags nodejs autopep8 ripgrep golang
  $npm install eslint eslint-plugin-vue eslint-plugin-react typescript -g
  ```

- pip

  ```bash
  $ pip install neovim jedi pylint doq black
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

  ```lua
"color
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'arcticicestudio/nord-vim'
Plug 'luochen1990/rainbow'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

"common
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ybian/smartim'
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'voldikss/vim-floaterm'
Plug 'puremourning/vimspector'
Plug 'github/copilot.vim'
Plug 'huggingface/llm.nvim'
Plug 'mhinz/vim-startify'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/trouble.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jackMort/ChatGPT.nvim'
Plug 'neomake/neomake'
Plug 'mbbill/undotree'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/which-key.nvim'
" Plug 'terryma/vim-multiple-cursors'

"python
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'psf/black', { 'branch': 'stable' }
Plug 'davidhalter/jedi-vim'

"js
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'hotoo/jsgf.vim', { 'for': ['javascript', 'javascriptreat', 'typescript', 'typescriptreact', 'json'] }
Plug 'hotoo/eggjs-gf.vim', { 'for': ['javascript', 'typescript'] }

"go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"markdown
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

"tex
Plug 'lervag/vimtex'

"csv
Plug 'chrisbra/csv.vim'

"json
Plug 'elzr/vim-json', { 'for': 'json' }
  ```

### Quick Tutorial

- 窗口分割

  ```
  wm: 开启/关闭NvimTree窗口
  wv: 垂直切分窗口
  wc: 关闭窗口
  wq: 打开 quick fix 窗口
  tb: 开启/关闭TagBar窗口
  wt: 打开终端
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

- 集成其他工具

  ```
  rg: 文件浏览
  Space g: 打开lazygit
  Space c: 打开chatgpt
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
![](https://chenfjm.github.io/nvim/images/vim4.png)
