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
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
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
" Plug 'terryma/vim-multiple-cursors'
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
" Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'mhinz/vim-startify'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jackMort/ChatGPT.nvim'
Plug 'neomake/neomake'
Plug 'mbbill/undotree'
"Plug 'ryanoasis/vim-devicons'

"python
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
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
