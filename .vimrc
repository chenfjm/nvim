
"                                 CHEN                                     "
"                              VIM-PYTHON                                  "
"                                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								插件管理
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/.vim/local'
"call vundle#rc(path)

if filereadable(expand("~/.vim/.vimrc.bundle"))
  	source ~/.vim/.vimrc.bundle
endif
call vundle#end() 

filetype plugin indent on 
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

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
 " set selection=exclusive
 " set selectmode=mouse,key
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
"Alt 组合键不映射到菜单上
set winaltkeys=no

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
"                             YouCompleteMe
"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu                
" 不用每次提示加载.ycm_extra_conf.py文件
let g:ycm_confirm_extra_conf = 0              
" 关闭ycm的syntastic
let g:ycm_show_diagnostics_ui = 0

" 评论中也应用补全
let g:ycm_complete_in_comments = 1        
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 两个字开始补全
let g:ycm_min_num_of_chars_for_completion = 2
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_filetype_specific_completion_to_disable = {"python":1}
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 关键字补全	
let g:ycm_seed_identifiers_with_syntax = 1
"set YouCompleteMe trigger key 
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
"let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
"let g:ycm_key_list_previous_completion = ['<Up>']

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	

let g:ycm_key_invoke_completion = '<Enter>'
let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#'], 'cpp,objcpp' : ['->', '.', '::'], 'php' : ['->', '::'], 'cs,java,javascript,vim,coffee,python,scala,go' : ['.'], 'ruby' : ['.', '::']}

autocmd BufRead *.py nnoremap <C-]> :YcmCompleter GoTo<CR>
autocmd BufRead *.js nnoremap <C-]> :TernDef<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vimspector
"安装调试器:
"VimspectorInstall <Tab> debugpy  delve
"项目配置文件:
"cp ~/.vim/bundle/vimspector/support/test/python/simple_python/.vimspector.json .
"cp ~/.vim/bundle/vimspector/support/test/go/Stdio/.vimspector.json . 
"使用:
"F9 加断点
"F5 执行
let g:vimspector_enable_mappings = 'HUMAN'
let g:ycm_semantic_triggers =  {
  \   'VimspectorPrompt': [ '.', '->', ':', '<' ]
  \}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               pydiction 
 let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
 let g:pydiction_menu_height = 30
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
"let g:go_metalinter_autosave = 0
"let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1
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
tmap <silent> jj <C-\><C-n>
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

