syntax on                      "语法支持

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType make setlocal noexpandtab

"set autoindent              "设置自动缩进
set bs=2                    "在insert模式下用退格键删除
"set expandtab     "是否在缩进和遇到 Tab 键时使用空格替代；使用 noexpandtab 取消设置
set tabstop=8               "制表符的宽度，参考ceph
"set softtabstop=4 "软制表符宽度，设置为非零数值后使用 Tab 键和 Backspace 时光标移动的格数等于该数值，但实际插入的字符仍受 tabstop 和 expandtab 控制
set number                  "显示行号
set autoread                "文件在Vim之外修改过，自动重新读入
set showbreak=↪             "显示换行符
set backspace=indent,eol,start "允许任意地方使用backspace键
set completeopt=longest,menuone,preview "更好的insert模式自动完成

set hidden              "switching buffers without saving
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set wildmenu            " show enhanced completion 
set wildmode=list:longest "together with wildmenu
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
set visualbell          "flash screen when bell rings
set cursorline          "highline cursor line
set ttyfast             "indicate faster terminal connection
set laststatus=2        "always show status line
set cpoptions+=J
set lbr                 " break the line by words
set scrolloff=3         " show at least 3 lines around the current cursor position
set sidescroll=1
set sidescrolloff=10
set virtualedit+=block
set lazyredraw
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set splitbelow
set splitright
set fillchars=diff:⣿
" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*" 

" Resize splits when the window is resized
au VimResized * :wincmd =

"保证vim在reopen一个文件时定位到同一行
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"设置mapleader前缀
    let mapleader = ','
"设置快捷开启鼠标的定义
    map <leader>m :set mouse=a<CR>

"搜索相关的设置
    set gdefault   "all matches in a line a subsituted instead of one.
    set showmatch  " show matching brackets/parenthesis
    set incsearch  " find as you type search
    set hlsearch   " 高亮搜索结果
    set magic      " 根据vim说明默认开启此参数
    set ignorecase " 忽略大小写
    set smartcase  " case sensitive when uc present
    nnoremap <leader>/ :nohlsearch<CR> "清空搜索结果高亮显示

"在屏幕中各子窗口之间切换
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l

" tab navigation mappings
    map tn :tabn<CR>
    map tp :tabp<CR>
    map tm :tabm
    map tt :tabnew
    map ts :tab split<CR>
    map <C-S-Right> :tabn<CR>
    imap <C-S-Right> <ESC>:tabn<CR>
    map <C-S-Left> :tabp<CR>
    imap <C-S-Left> <ESC>:tabp<CR>

"代码折叠相关配置
"    set foldmethod=syntax       "代码折叠 共有6中方式如下
        "1. manual 手工定义折叠
        "2. indent 用缩进表示折叠
        "3. expr　 用表达式来定义折叠
        "4. syntax 用语法高亮来定义折叠
        "5. diff   对没有更改的文本进行折叠
        "6. marker 用标志折叠
"    vnoremap <Space> zah "空格键折叠，h是为了解决Space会导致焦点右移一位的问题
"设置菜单和帮助的语言，默认改为英语
    set fileencodings=utf-8,gbk "使用utf-8或gbk打开文件
    set encoding=utf8
    set langmenu=en_US.UTF-8
    language message en_US.UTF-8

"pathogen是Vim用来管理插件的插件
    call pathogen#infect()

" Airline ------------------------------

    "let g:airline_powerline_fonts = 1
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#tabline#enabled = 1 
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'

    " to use fancy symbols for airline, uncomment the following lines and use a
    " patched font (more info on the README.rst)
    if !exists('g:airline_symbols')
       let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'

" Syntastic ------------------------------
    " show list of errors and warnings on the current file
    nmap <leader>e :Errors<CR>
    " check also when just opened the file
    let g:syntastic_check_on_open = 1
    " don't put icons on the sign column (it hides the vcs status icons of signify)
    let g:syntastic_enable_signs = 0
    " custom icons (enable them if you use a patched font, and enable the previous
    " setting)
    "let g:syntastic_error_symbol = '✗'
    "let g:syntastic_warning_symbol = '⚠'
    "let g:syntastic_style_error_symbol = '✗'
    "let g:syntastic_style_warning_symbol = '⚠'
    
    " Python-mode ------------------------------
    
    " don't use linter, we use syntastic for that
    let g:pymode_lint_on_write = 0
    let g:pymode_lint_signs = 0
    " don't fold python code on open
    let g:pymode_folding = 0
    " don't load rope by default. Change to 1 to use rope
    let g:pymode_rope = 0
    " open definitions on same window, and custom mappings for definitions and
    " occurrences
    let g:pymode_rope_goto_definition_bind = ',d'
    let g:pymode_rope_goto_definition_cmd = 'e'
    nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
    nmap ,o :RopeFindOccurrences<CR>

"Tagbar配置
    let g:tagbar_width=26
    noremap <silent> <F4> :TagbarToggle<CR>
    let g:tagbar_autofocus = 1

"jellybeans配色方案配置
    colorscheme jellybeans

" NeoComplCache ------------------------------
    " most of them not documented because I'm not sure how they work
    " (docs aren't good, had to do a lot of trial and error to make
    " it play nice)
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_auto_select = 1
    let g:neocomplcache_enable_fuzzy_completion = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_fuzzy_completion_start_length = 1
    let g:neocomplcache_auto_completion_start_length = 1
    let g:neocomplcache_manual_completion_start_length = 1
    let g:neocomplcache_min_keyword_length = 1
    let g:neocomplcache_min_syntax_length = 1
    " complete with workds from any opened file
    let g:neocomplcache_same_filetype_lists = {}
    let g:neocomplcache_same_filetype_lists._ = '_'

"NerdTree配置
    map <F3> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.o','\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
    let NERDTreeQuitOnOpen=0 "the Nerdtree window will be close after a file is opend.
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1

"rainbow_parentheses括号匹配着色插件配置
    nnoremap <leader>R :RainbowParenthesesToggle<cr>
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['black',       'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]
    let g:rbpt_max = 16

"Fugitive配置
    nnoremap <Leader>gs :Gstatus<CR>
    nnoremap <Leader>gr :Gremove<CR>
    nnoremap <Leader>gl :Glog<CR>
    nnoremap <Leader>gb :Gblame<CR>
    nnoremap <Leader>gm :Gmove 
    nnoremap <Leader>gp :Ggrep 
    nnoremap <Leader>gR :Gread<CR>
    nnoremap <Leader>gg :Git 
    nnoremap <Leader>gd :Gdiff<CR>

"Autoclose自动成对补充括号插件
    nmap <Leader>x <Plug>ToggleAutoCloseMappings

" CtrlP ------------------------------
    " file finder mapping
    let g:ctrlp_map = ',e'
    " tags (symbols) in current file finder mapping
    nmap ,g :CtrlPBufTag<CR>
    " tags (symbols) in all files finder mapping
    nmap ,G :CtrlPBufTagAll<CR>
    " general code finder in all files mapping
    nmap ,f :CtrlPLine<CR>
    " recent files finder mapping
    nmap ,m :CtrlPMRUFiles<CR>
    " commands finder mapping
    nmap ,c :CtrlPCmdPalette<CR>
    " to be able to call CtrlP with default search text
    function! CtrlPWithSearchText(search_text, ctrlp_command_end)
        execute ':CtrlP' . a:ctrlp_command_end
        call feedkeys(a:search_text)
    endfunction
    " same as previous mappings, but calling with current word as default text
    nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
    nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
    nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
    nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
    nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
    nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
    nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
    " don't change working directory
    let g:ctrlp_working_path_mode = 0
    " ignore these files and folders on file finder
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
      \ 'file': '\.pyc$\|\.pyo$',
      \ }

"自定义快捷扫描ctags命令
"command Ctags !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
command Ctags !ctags -R *
command Hex %!xxd
command Asc %!xxd -r

