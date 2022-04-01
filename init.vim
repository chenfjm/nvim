
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
 syntax on
 let g:rainbow_active = 1
"
"自动、智能缩进
 autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
 autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab
 autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
 autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.css setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.json setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.vue setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.wxml setlocal ts=2 sts=2 sw=2 expandtab
 autocmd BufRead *.wxss setlocal ts=2 sts=2 sw=2 expandtab
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
 set selection=exclusive
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
set shortmess=atI
set cmdheight=2
"Alt 组合键不映射到菜单上
set winaltkeys=no

"exec command in init.vim
set exrc
"safely do command above
set secure
"auto change directory
set autochdir
"show cmd inputing like key combine
set showcmd
"auto finish vim command
set wildmenu
"show substitution automatically
set inccommand=split
"make scrolling faster
set ttyfast
set visualbell
set virtualedit=block
set re=0

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
nmap lg :FloatermNew --width=0.9 --height=0.99 --wintype=float --position=center lazygit<cr>
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
"<C-c> 进入当前目录
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
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
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
let g:jedi#usages_command = "<C-u>"
let g:jedi#documentation_command = "<C-g>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                coc.nvim
"Use the command :CocConfig to open your user configuration file
":CocInstall <tab>
":CocUninstall
":CocUpdate <tab>
":CocList extensions
let g:coc_global_extensions = [
	\ 'coc-diagnostic',
	\ 'coc-explorer',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-pyright',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-snippets',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-vimlsp',
	\ 'coc-yank']
inoremap <silent><expr> <C-j>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
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
au FileType go nmap <C-]> :GoDef<cr>
au FileType go nmap <C-u> :GoCallers<cr>
au FileType go nmap gd :GoDoc<cr>
au FileType go nmap gr :GoRun .<cr>
au FileType go nmap gb :GoBuild<cr>:make<cr>
au FileType go nmap gi :GoInstall<cr>
au FileType go nmap gt :GoTest<cr>
au FileType go nmap gn :GoRename<cr>
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
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
" let g:gitgutter_sign_added = 'xx'
" let g:gitgutter_sign_modified = 'yy'
" let g:gitgutter_sign_removed = 'zz'
nmap mm :G blame<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           indentLine
let g:indentLine_enabled = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vim-autoformat
let g:formatterpath = ['/usr/local/go/bin', '/usr/local/bin']
noremap = :Autoformat<CR>
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

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
autocmd! FileType fzf tmap <C-k> <Up>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

