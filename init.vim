
"                                 CHEN                                     "
"                              VIM-CONFIG                                  "
"                                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                插件管理
set nocompatible              " be iMproved, required
filetype off                  " required

" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin("~/.config/nvim/plugged")
if filereadable(expand("~/.config/nvim/plug.vim"))
  	source ~/.config/nvim/plug.vim
endif
call plug#end() 

" Brief help
" :PlugList          - list configured plugins
" :PlugInstall(!)    - install (update) plugins
" :PlugSearch(!) foo - search (or refresh cache first) for foo
" :PlugClean(!)      - confirm (or auto-approve) removal of unused plugins
" see :h plug for more details or wiki for FAQ

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      	                          主题                                      
"colorscheme monokai
"colorscheme solarized
 colorscheme nord
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               基本配置
"
"开启语法高亮
 syntax on
 let mapleader=" "
 set termguicolors
 let g:rainbow_active = 0
"
"自动、智能缩进
 autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
 autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab
 autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
 autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
 autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
 autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
 autocmd FileType proto setlocal ts=4 sts=4 sw=4 expandtab
 autocmd BufRead *.css setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.vue setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.wxml setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.wxml setfiletype html
 autocmd BufRead *.wxss setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.wxss setfiletype css
 autocmd BufRead *.yaml setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.vim setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.conf setf dosini
 autocmd BufRead *.nvue setf html

 set autoindent
 set fileformat=unix
 filetype indent on

"Always show the status line - use 2 lines for the status bar
 set laststatus=2

 set cursorline
 set modifiable
"paste toggle
 set pastetoggle=<C-t>
"中文乱码"
 set encoding=utf-8
 set fileencodings=utf-8,chinese
"默认展开所有代码
 " set foldmethod=indent
 nnoremap <space><space> za
 set foldlevel=99
 set foldenable
"显示当前的行号列号：
 set ruler
"显示行号：
 set number
 map <Leader>nu :set nu<cr>
 map <Leader>no :set nonu<cr>
"设置tab：
 set tabstop=4
"行宽
 set textwidth=120
"自动折行
 set nowrap
 " set wrap
"自动读取文件修改
 set autoread
"激活鼠标的使用
 set mouse=n
 " set selection=exclusive
 set selectmode=mouse,key
"支持系统剪切板
 set clipboard=unnamed
"文件类型自动检测，代码智能补全
 set completeopt=longest,preview,menu

"在html标签之间跳转(%)
 runtime macros/matchit.vim 
" 搜索
set hlsearch                    " highlight searches
set incsearch                   " do incremental searching, search as you type
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present
"在当前目录及子目录下用find打开指定文件
 set path=./**
"恢复上次光标位置
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"启动界面
set shortmess=atIc
set cmdheight=1
"Alt 组合键不映射到菜单上
set winaltkeys=no
"TextEdit might fail if hidden is not set.
set hidden

"exec commandavascriptirtualedit=block
" set re=0

imap jj <Esc>
imap <C-h> <left>
imap <C-l> <right>
cmap q<CR> qa<CR>

"关闭当前窗口
nmap wn  :tabnew<cr>
nmap wc  :close!<cr>
nmap :wq :wqa!<cr>
nmap :q :qa!<cr>
"分割窗口
nmap wv  <C-w>v     
"打开quickfix
nmap wq :copen<cr>
nmap wl :lopen<cr>
"tab移动快捷键
nmap <A-h> :tabprevious<cr>
nmap <A-l> :tabnext<cr>
"分割窗口移动快捷键
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

"MacOS
set backspace=indent,eol,start

"loclist&quickfix
autocmd filetype qf call QuickfixMap()
function QuickfixMap()
   if get(getwininfo(win_getid())[0], 'loclist', 0)
        nnoremap <buffer> j :lnext<CR>zz<C-w>w
        nnoremap <buffer> k :lprevious<CR>zz<C-w>w
        nnoremap <buffer> gg :lfirst<CR>zz<C-w>w
        nnoremap <buffer> G :llast<CR>zz<C-w>w
   elseif get(getwininfo(win_getid())[0], 'quickfix', 0)
        nnoremap <buffer> j :cnext<CR>zz<C-w>w
        nnoremap <buffer> k :cprevious<CR>zz<C-w>w
        nnoremap <buffer> gg :cfirst<CR>zz<C-w>w
        nnoremap <buffer> G :clast<CR>zz<C-w>w
   endif
endf

"command
nmap rg :FloatermNew --width=1000 --height=1000 --wintype=float --position=center ranger<cr>
nmap git :FloatermNew --width=1000 --height=1000 --wintype=float --position=center lazygit<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   mac os map
if has('mac') && ($TERM == 'xterm-256color' || $TERM == 'screen-256color')
map <Esc>OP <F1>
map <Esc>OQ <F2>
map <Esc>OR <F3>
map <Esc>OS <F4>
map <Esc>[16~ <F5>
map <Esc>[17~ <F6>
map <Esc>[18~ <F7>
map <Esc>[19~ <F8>
map <Esc>[20~ <F9>
map <Esc>[21~ <F10>
map <Esc>[23~ <F11>
map <Esc>[24~ <F12>
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               standard-plugin-list
" netrw
let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_winsize = 25
let g:netrw_chgwin = 2
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_home = '~/.config'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 startify
let g:startify_custom_header = startify#pad([''])
let g:startify_change_to_dir = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                tree-sitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {"vim", "lua", "python", "go", "vue", "bash", "css", "html", "json", "make", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = { "dockerfile" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      -- scope_incremental = "<CR>",
      node_decremental = "<BS>",
    },
  },
  indent = {
    enable = true
  }
}
EOF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-hexokinase
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                文件头
" py
autocmd BufRead *.py if line("$") < 2 | call HeaderPython() | endif
autocmd VimEnter *.py if line("$") < 2 | call HeaderPython() | endif
function HeaderPython()
	call setline(1, "#!/usr/bin/env python")
	call setline(2, "# -*- coding: utf-8 -*-")
endf

" sh
autocmd BufRead *.sh if line("$") < 2 | call HeaderShell() | endif
autocmd VimEnter *.sh if line("$") < 2 | call HeaderShell() | endif
function HeaderShell()
    call setline(1, "#!/bin/bash")
endf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                coc.nvim
"Use the command :CocConfig to open your user configuration file
":CocInstall <tab>
":CocUninstall
":CocUpdate <tab>
":CocList extensions
"
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:coc_global_extensions = [
	\ 'coc-diagnostic',
	\ 'coc-docker',
	\ 'coc-gitignore',
	\ 'coc-git',
	\ 'coc-html',
	\ 'coc-wxml',
  \ 'coc-css',
  \ 'coc-json',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-jedi',
	\ 'coc-go',
	\ 'coc-sh',
	\ 'coc-sql',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-snippets',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-vimlsp',
	\ 'coc-yank']

nmap <Leader>r <Plug>(coc-rename)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd FileType vue nmap <silent> <C-]> gd
autocmd FileType javascript nmap <silent> <C-]> gd
autocmd FileType typescript nmap <silent> <C-]> gd
nmap <silent> <C-]> gd
" Formatting selected code.
vmap = <Plug>(coc-format-selected)

inoremap <expr><C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"    
inoremap <expr><C-k> coc#pum#visible() ?  coc#pum#prev(1) : "\<C-k>"    
                                                                                                                                               
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()    
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> <Leader>d :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    air-line
"statusline
let g:airline_theme='nord'
let g:airline_symbols_ascii = 0
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1
let g:airline_skip_empty_sections = 1
let g:airline_statusline_ontop = 0
let g:airline_section_c = '%t'
let g:airline_section_z = '%p%% %l:%v'

"tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#alt_sep = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1

"map
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0

"extensions
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#fzf#enabled = 1

function! NvimTree(...)
  if &filetype == 'NvimTree'
    let w:airline_section_a = ''
    " let w:airline_section_b = ''
    let w:airline_section_c = 'NvimTree'
    let w:airline_section_z = ''
    let w:airline_section_x = ''
    let g:airline_variable_referenced_in_statusline = 'foo'
  endif
endfunction
call airline#add_statusline_func('NvimTree')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							nerdcomment
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
map <silent> <C-c> <plug>NERDCommenterToggle 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							 tagbar
autocmd BufRead *.* nmap tb :Tagbar<cr>
" let tagbar_ctags_bin='/usr/local/bin/ctags'
let tagbar_ctags_bin='/opt/homebrew/bin/ctags'
let tagbar_width=30
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ale-错误检查
let g:ale_enabled = 1
let g:ale_use_neovim_diagnostics_api = 0
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
let g:ale_open_list = 0
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_use_global_executables = 1
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_completion_delay = 500
let g:ale_echo_delay = 500
let g:ale_lint_delay = 50
let g:ale_lint_on_text_changed = 'normal'
let g:ale_fixers = {'python': ['isort', 'yapf', 'black'], 'javascript': ['prettier','eslint']}
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint']}
let g:ale_python_pylint_options = '--errors-only'
let g:ale_python_flake8_options = '--ignore=W,E501,E203,E252'
let g:ale_python_isort_options = '--line-length 88 --profile black --dont-follow-links'

nmap <silent> <Leader>p <Plug>(ale_previous_wrap)
nmap <silent> <Leader>n <Plug>(ale_next_wrap)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               jedi-vim
"
let g:jedi#usages_command = "<C-u>"
let g:jedi#goto_command = "<C-]>"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#goto_stubs_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""
let g:jedi#popup_on_dot = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 black
let g:black_linelength = 120
let g:black_use_virtualenv = 0
let g:black_quiet = 1
let g:black_preview = 0
" augroup black_on_save
  " autocmd!
  " autocmd BufWritePre *.py Black
" augroup end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vimspector
"安装调试器:
"VimspectorInstall <Tab> debugpy  delve
"项目配置文件:
"cp ~/.config/nvim/plugged/vimspector/support/test/python/simple_python/.vimspector.json .
"cp ~/.config/nvim/plugged/vimspector/support/test/go/Stdio/.vimspector.json . 
"使用:
"F9 加断点
"F5 执行
let g:vimspector_enable_mappings = 'HUMAN'
let g:ycm_semantic_triggers =  {
  \   'VimspectorPrompt': [ '.', '->', ':', '<' ]
  \}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Emmet
"
let g:user_emmet_expandabbr_key = '<C-e>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 docstring
nmap <silent> pd <Plug>(pydocstring)
let g:pydocstring_doq_path = 'doq'
let g:pydocstring_templates_path = '~/.config/nvim/docstring'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-markdown
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
autocmd BufRead *.md nmap tb :Toc<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              markdown-preview
nmap <C-s> <Plug>MarkdownPreviewToggle
nmap mp <Plug>MarkdownPreview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  vim-go
" let g:go_metalinter_autosave = 0
" let g:go_list_type = "quickfix"
let g:go_def_mapping_enabled = 0
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1
let g:go_doc_popup_window = 1
au FileType go nmap <Leader>r :GoRename<cr>
" au FileType go nmap <C-]> :GoDef<cr>
au FileType go nmap <C-u> :GoCallers<cr>
au FileType go nmap gr :GoRun .<cr>
au FileType go nmap gb :GoBuild<cr>:make<cr>
au FileType go nmap gi :GoInstall<cr>
au FileType go nmap gt :GoTest<cr>
"Show all variables to which the pointer under the cursor may point to
au FileType go nmap gp :GoPointsTo<cr>
"See which code is covered by tests
au FileType go nmap gc :GoCoverage<cr>
"Call staticcheck
au FileType go nmap gm :GoMetaLinter<cr>
au FileType go nmap gat :GoAddTags<cr>
au FileType go nmap grt :GoRemoveTags<cr>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-json
let g:vim_json_syntax_conceal = 1
let g:indentLine_concealcursor=""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-m>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<C-m>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          vim-gitgutter
"<Leader>hp: preview hunks
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
" let g:gitgutter_sign_added = 'xx'
" let g:gitgutter_sign_modified = 'yy'
" let g:gitgutter_sign_removed = 'zz'
command! Gqf GitGutterQuickFix | copen
nmap ff :Gqf<CR>
nmap mm :G blame<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            gitsigns
lua << EOF
require('gitsigns').setup{
  current_line_blame = true
}
EOF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           indentLine
let g:indentLine_enabled = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vim-autoformat
let g:formatterpath = ['/usr/local/go/bin', '/usr/local/bin']
let g:formatters_python = ['black']
let g:autoformat_autoindent = 1
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1
map = :Autoformat<CR>
au FileType python nmap <silent> = :Autoformat<cr>:ALEFix<cr>
au FileType json nmap <silent> = :%!jq .<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  vim-floaterm
"切换终端
let g:floaterm_wintype='split'
let g:floaterm_position='belowright'
let g:floaterm_height=0.4
let g:floaterm_autoinsert=v:true
nmap wt :FloatermToggle<cr>
tmap <silent> wc <C-\><C-n>:FloatermKill<CR>
tmap <silent> wt <C-\><C-n>:FloatermHide<CR>
" tmap <silent> jj <C-\><C-n>
autocmd User FloatermOpen tmap <silent> <C-k> <C-\><C-n><C-w>k
autocmd User FloatermOpen tmap <silent> <C-h> <C-\><C-n><C-w>h
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               	 fzf
" export BAT_THEME=Nord
" - down / up / left / right
let g:fzf_layout = { 'down': '100%' }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(red)%an %C(black)%C(bold)%cd"
	\ --date="format:%Y-%m-%d %H:%M:%S"'

nmap <C-p> :Files<CR>
nmap <C-a> :Rg!<CR>
nmap rr :Buffers<CR>
nmap cc :Commits!<CR>
nmap bb :BCommits!<CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

autocmd! FileType fzf tmap <C-k> <Up>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               eggjs-jf
let g:eggjs_gf_loadpath = 'service\|proxy\|model\|controller\|io'
au FileType javascript nmap <silent> <C-[> gf
au FileType typescript nmap <silent> <C-[> gf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               undotree
nnoremap wu :UndotreeToggle<CR>
let g:undotree_WindowLayout = 3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              vim-grepper
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
nnoremap <leader>a :Grepper -tool rg<cr>
nnoremap <leader>g :Grepper -tool git<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         	    csv.vim
"删除列:
"DeleteColumn 2/cursor
let g:csv_highlight_column = 'y'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								               nvim-tree
lua << EOF
--- function
function RunLazyGit()
  local lib = require'nvim-tree.lib'
  local node = lib.get_node_at_cursor()
  local path = node.absolute_path
  vim.cmd('FloatermNew --width=1000 --height=1000 --wintype=float --position=center lazygit -p ' .. path)
end
function my_on_attach(bufnr)
	local api = require('nvim-tree.api')
	local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
  api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set('n', '<C-]>',   api.tree.change_root_to_node,        opts('CD'))
	vim.keymap.set('n', '<C-o>',       api.tree.change_root_to_parent,      opts('Up'))
	vim.keymap.set('n', 'C',       api.tree.toggle_git_clean_filter,    opts('Toggle Filter: Git Clean'))
	vim.keymap.set('n', '<Leader>p',      api.node.navigate.git.prev,          opts('Prev Git'))
	vim.keymap.set('n', '<Leader>n',      api.node.navigate.git.next,          opts('Next Git'))
	vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
	vim.keymap.set('n', 'c',       api.fs.copy.node,                    opts('Copy'))
	vim.keymap.set('n', 'e',       api.tree.expand_all,                 opts('Expand All'))
	vim.keymap.set('n', 'w',       api.tree.collapse_all,               opts('Collapse'))
	vim.keymap.set('n', 's',       api.node.run.system,                 opts('Run System'))
  vim.keymap.set('n', 'h',       api.tree.toggle_hidden_filter,       opts('Toggle Filter: Dotfiles'))
  vim.api.nvim_set_keymap('n', '<Leader>g', ':lua RunLazyGit()<CR>', { noremap = true, silent = true })
end
---

require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  on_attach = my_on_attach,
  view = {
    width = 30,
    side = 'left',
  },
  filters = {
    dotfiles = true,
    custom = { '.pyc$', '__pycache__' },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
  renderer = {
    highlight_opened_files = "all",
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "✹",
          staged = "✚",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "✖",
          ignored = "◌",
        },
      },
    },
  },
}
-- 设置状态栏内容为空
EOF

" Key mapping to toggle NvimTree
nnoremap wm :NvimTreeToggle<CR>

" Auto close NvimTree if it's the last window
autocmd BufEnter * ++nested if winnr('$') == 1 && exists('b:nvim_tree') | quit | endif

autocmd StdinReadPre * let s:std_in=1
cnoreabbrev e Edit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                which-key
lua << EOF
  require("which-key").setup {}
  local wk = require("which-key")
  wk.register({
        c = {
          name = "ChatGPT",
          c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
          i = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
          e = { "<cmd>ChatGPTRun complete_code<CR>", "Complete Code", mode = { "n", "v" } },
          g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
          t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
          k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
          d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
          a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
          o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
          s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
          f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
          x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
          r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
          l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
        }
      }, { prefix = "<leader>" })
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                copilot
let b:copilot_enabled = v:false
let g:codeium_enabled = v:false
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            	  Supermaven
"
"
lua << EOF
require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<C-l>",
    clear_suggestion = "<C-k>",
    accept_word = "<C-j>",
  },
  log_level = "no", -- set to "off" to disable logging completely
  disable_inline_completion = false, -- disables inline completion for use with cmp
})
EOF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            	   ChatGPT
"
" export OPENAI_API_TYPE="azure"
" export OPENAI_API_BASE="https://{your-resource-name}.openai.azure.com"
" export OPENAI_API_AZURE_ENGINE="gpt-35-turbo"
" export OPENAI_API_AZURE_VERSION="2024-02-15-preview"
" export OPENAI_API_KEY=""
"
lua << EOF
require("chatgpt").setup{
  actions_paths = {
    "~/.config/nvim/chatgpt/actions.json"
  },
}
EOF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 llm
" lua << EOF
" require('llm').setup{}
" EOF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

