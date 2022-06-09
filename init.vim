
"                                 CHEN                                     "
"                              VIM-CONFIG                                  "
"                                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                插件管理
set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
 let mapleader=" "
 syntax on
 let g:rainbow_active = 1
"
"自动、智能缩进
 autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
 autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab
 autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
 autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
 autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.css setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.json setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.vue setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.wxml setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.wxml setfiletype html
 autocmd BufRead *.wxss setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.wxss setfiletype css
 autocmd BufRead *.yaml setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.conf setf dosini

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
 set foldmethod=indent
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
 set textwidth=90
"自动折行
 "set nowrap
 set wrap
"自动读取文件修改
 set autoread
"激活鼠标的使用
 set mouse=a
 " set selection=exclusive
 " set selectmode=mouse,key
"支持系统剪切板
 " set clipboard=unnamed
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
set cmdheight=2
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
nmap wc  :close!<cr>
nmap :wq :wqa!<cr>
nmap :q :qa!<cr>
"分割窗口
nmap wv  <C-w>v     
"打开quickfix
nmap wq :copen<cr>
nmap wl :lopen<cr>
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
nmap rg :FloatermNew --width=0.9 --height=0.99 --wintype=float --position=center ranger<cr>
nmap git :FloatermNew --width=0.9 --height=0.99 --wintype=float --position=center lazygit<cr>
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
"                                tree-sitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
function! TreesitterConfig()
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "go", "vue", "javascript"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c"},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}
EOF
endfunction
autocmd VimEnter * call TreesitterConfig()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
	\ 'coc-pyright',
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
au FileType vue nmap <silent> <C-]> gd
" au FileType javascript nmap <silent> <C-]> gd
" au FileType typescript nmap <silent> <C-]> gd
nmap <silent> <C-]> gd
" Formatting selected code.
vmap = <Plug>(coc-format-selected)

inoremap <silent><expr> <C-j>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
"                                    lightline
let g:lightline = {
	 \ 'colorscheme': 'nord',
	 \ 'active': {
	 \   'left': [ [ 'mode', 'paste' ],
	 \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
	 \ },
	 \ 'component_function': {
	 \   'gitbranch': 'FugitiveHead'
	 \ },
	 \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							nerdtree
"
"<Shift-c> 进入当前目录
"u 返回上层目录
"o 打开目录/文件
"
"不显示帮助信息
let NERDTreeMinimalUI=1
"鼠标点击							 
let NERDTreeMouseMode = 1
"宽度
let g:NERDTreeWinSize = 30
"忽略文件、隐藏文件
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.meta']
let NERDTreeSortOrder=['\/$', 'Makefile', 'makefile', '*', '\~$']
nmap wm :NERDTreeToggle<cr>
"autocmd BufRead *.py :NERDTreeToggle
"关闭窗口
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							nerdcomment
let g:NERDSpaceDelims=1
map <silent> <C-c> <plug>NERDCommenterToggle 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							 tagbar
autocmd BufRead *.* nmap tb :Tagbar<cr>
" let tagbar_ctags_bin='/usr/local/bin/ctags'
" let tagbar_ctags_bin='/usr/bin/ctags'
let tagbar_width=30
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ale-错误检查
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_use_global_executables = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_fixers = {'python': ['isort','yapf'], 'javascript': ['prettier','eslint']}
let b:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let b:ale_linters = {'python': ['pylint']}
let g:ale_python_pylint_options='--disable="E501"'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               jedi-vim
"
let g:jedi#goto_assignments_command = "<C-]>"
let g:jedi#goto_command = "<C-]>"
let g:jedi#usages_command = "<C-u>"
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								ultisnips
" Track the engine.
"Bundle 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Bundle 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Emmet
"
let g:user_emmet_expandabbr_key = '<C-e>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 SimpylFold
" 代码折叠
let g:SimpylFold_docstring_preview=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  py文件头
autocmd bufnewfile *.py call HeaderPython()
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
    normal o
endf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 docstring
nmap <silent> pd <Plug>(pydocstring)
" let g:pydocstring_doq_path = '/usr/local/bin/doq'
" let g:pydocstring_doq_path = '/usr/bin/doq'
"template
""""
":param {{_args_}}:
"{{_indent_}}:return:
""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
autocmd BufRead *.md nmap tb :Toc<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-go
" let g:go_metalinter_autosave = 0
" let g:go_list_type = "quickfix"
let g:go_def_mapping_enabled = 0
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1
let g:go_doc_popup_window = 1
au FileType go nmap <Leader>r :GoRename<cr>
au FileType go nmap <C-]> :GoDef<cr>
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
let g:vim_json_syntax_conceal = 0
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
"                           indentLine
let g:indentLine_enabled = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vim-autoformat
let g:formatterpath = ['/usr/local/go/bin', '/usr/local/bin']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
nnoremap = :Autoformat<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  vim-floaterm
"切换终端
let g:floaterm_wintype='split'
let g:floaterm_position='belowright'
let g:floaterm_height=0.3
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
let g:fzf_layout = { 'down': '~50%' }
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

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
autocmd! FileType fzf tmap <C-k> <Up>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

