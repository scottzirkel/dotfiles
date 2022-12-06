set nocompatible

so ~/.vim/plugins.vim

" Tabs and Spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set expandtab
set autoindent
set smartindent
set smarttab
"set formatoptions=1
set wrap
set linebreak
set nolist

" Tabs and Spaces - File specific
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType blade setlocal shiftwidth=2 tabstop=2


" Misc
set number
set ruler
set showcmd
set showmatch
"set nowrap
set hidden
set modeline
set autoread       " auto-reload modified files (with no local changes)
set ignorecase     " ignore case in search
set smartcase      " override ignorecase if uppercase is used in search string
set report=0       " report all changes
set laststatus=2   " always show status-line
set cursorline     " highlight current line
set scrolloff=4
set nofoldenable
set shell=/bin/sh
set clipboard=unnamed
set linespace=15

" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store?                      " OSX crap
set wildignore+=tags/                            " Tags folders
set wildignore+=*vendor/*,public/assets/*,bower/*,composer/*,node_modules/* " Vendor Stuff
" }}}

" Swaps and backups
set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap
set undofile
set undodir=~/.vim/undo
set undoreload=10000

" Show trailing whitespace
set list listchars=tab:â†’\ ,trail:Â·

set autowrite                      "Automatically write the file on buffer switch

" Better search
set hlsearch
set incsearch

" Show trailing white-space
let ruby_space_errors = 1
let c_space_errors = 1
let javascript_space_errors = 1

set noerrorbells visualbell t_vb=
set synmaxcol=200

let mapleader = ","
set complete=.,w,b,u              "Set out desired autocompletion matching.

"---------Visuals------------"
"set guifont=Hack:h14
set guifont=Fira\ Code:h12
set background=dark
set t_CO=256
let g:gruvbox_italic=1
colorscheme gruvbox
let g:airline_theme='solarized'
set linespace=15
set macligatures
set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=e
set foldcolumn=2
hi foldcolumn guibg=bg
hi vertsplit guifg=bg guibg=bg

"---------Mappings-----------"
"Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>
nmap <Leader>es :e ~/.vim/UltiSnips/
"Add simple highlight removal."
nmap <Leader><space> :nohlsearch<cr>

" Page up & Page down easily
" Don't forget H for start of line and L for end of line by default
nnoremap K <PageUp>
nnoremap J <PageDown>

"Make NERDTreeToggle easier to toggle
nmap <D-1> :NERDTreeToggle<cr>

function! IPhpInsertUse()
  call PhpInsertUse()
  call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<cr>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<cr>

function! IPhpExpandClass()
  call PhpExpandClass()
  call feedkeys('a', 'n')
endfunction

"Automatically update ctags on save
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"---------Plugins---------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|dist|wp'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"Search for Tags in PHP
nmap <D-p> :CtrlP<cr>
nmap <c-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
nmap <D-o> <Plug>PeepOpen
"/
"/ NERDTree
"/
let NERDTreeHiJackNetrw = 0
nmap <Leader>f :tag<space>

"/
"/ Greplace
"/
set grepprg=ag                                                      "We want to use Ag for the search"
let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer"
let g:php_cs_fixer_level = 'psr2'              " set level to PSR-2
let g:php_cs_fixer_php_verbose = 1
let g:php_cs_fixer_fixers_list = '-psr0'       " disable PSR-0

autocmd FileType php noremap <Leader>pf :call PhpCsFixerFixFile()<cr><cr>

"/
"/ PDV
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<cr>

"/
"/ Ultisnips
"/
let g:UltiSnipsSnippetDirectores=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
au FileType php :UltiSnipsAddFiletypes php

"/
"/ Vim-Command-W
"/
if has('gui_running')
    macmenu &File.Close key=<nop>
    nmap <D-w> :CommandW<cr>
    imap <D-w> <Esc>:CommandW<cr>
endif
"---------Snippets-----------"
"let g:snippets_dir = '~/.vim/snippets'

"---------Laravel-Specific---------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :e app/<cr>
nmap <Leader><Leader>v :e resources/views/<cr>

" Set blade to html formatting
autocmd BufRead,BufNewFile *.blade.php set filetype=html

"---------Auto-Commands---------"
""Automatically source the Vimrc file on save
augroup autosourcing
  autocmd!
  autocm BufWritePost .vimrc source %
augroup END

"---------PHP-----------"
let@a="yiw/}O$this->pa = $pa;?constructOprotected $pa;i€kr/constu€kbtuc€kb€kb€kbruct/\", "


" Easy command mode switch
inoremap jj <Esc>

" Yank to OS X pasteboard.
noremap <leader>y "*y

" Paste from OS X pasteboard without messing up indent.
"noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
"noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

"" Fix backspace key in xterm
"" inoremap <BS>

"inoremap <C-l> <C-x><C-l>

"inoremap <C-f> function () {}<Left>

"" Enable mouse in insert and normal mode
"" set mouse=vin

"" Create an empty line underneath without moving the cursor
"noremap <CR> mlo<Esc>`l

"" Indent with spacebar
"noremap <space> >>
"noremap <BS> <<

"" Move easily between ^ and $
"noremap <C-h> ^
"noremap <C-l> $

"nnoremap Y y$
"nnoremap D d$

"" Keep search matches in the middle of the window.
"nnoremap n nzzzv
"nnoremap N Nzzzv

"" Same when jumping around
"nnoremap g; g;zz
"nnoremap g, g,zz

"" It's 2011.
"noremap j gj
"noremap k gk

"" After copying a visual block, keep cursor at end of block for easy pasting
"vnoremap y y`>

"set splitbelow
"set splitright
"" Moving around in splits
"map <C-k> <C-w><Up>
"map <C-j> <C-w><Down>
"map <C-l> <C-w><Right>
"map <C-h> <C-w><Left>

"" Removing arrow keys
"" map <Left> <Nop>
"" map <Right> <Nop>
"" map <Up> <Nop>
"" map <Down> <Nop>

"" Indent whole file
"map <Leader>i gg=G

"" Minimum window height = 0
"set wmh=0

"" Required for rubyblock
"runtime macros/matchit.vim

"syntax enable

"" Solarized theme settings
let g:solarized_termcolors=256
"" colorscheme solarized
"" colorscheme twilight256
""colorscheme tomorrow-night
""colorscheme duotone-darkearth
let base16colorspace=256
"" Powerline settings
"let g:Powerline_symbols = 'fancy'
let g:gruvbox_termcolors=16

""Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"au BufRead,BufNewFile *.js set ft=javascript syntax=javascript
"au BufRead,BufNewFile *.json set ft=json syntax=javascript
"au BufRead,BufNewFile *.twig set ft=htmldjango
"au BufRead,BufNewFile *.rabl set ft=ruby
"" automatically jump to last known position in a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"" automatically reload vimrc when it's saved
"au BufWritePost .vimrc so ~/.vimrc

""map <Leader>n :NERDTreeToggle<CR>

"" Rubytest
"map <Leader>\ <Plug>RubyTestRun
"map <Leader>' <Plug>RubyFileRun
"map <Leader>/ <Plug>RubyTestRunLast
"let g:rubytest_cmd_test = 'ruby -I "lib:test" %p'
"let g:rubytest_cmd_testcase = 'ruby -I "lib:test" %p -n "/%c/"'
"let g:rubytest_in_quickfix = 1

"" Syntastic
"let g:syntastic_enable_signs = 1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_disabled_filetypes = ['html', 'sass']
"let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'
"let g:syntastic_jsl_conf = '$HOME/.jshintrc'
"let g:syntastic_jshint_conf = '$HOME/.jshintrc'

"" Gundo
"let g:gundo_width = 30
"let g:gundo_preview_bottom = 1

"" Gundo
"nnoremap <leader>g :GundoToggle<CR>

"" Tagbar
" nnoremap <leader>q :TagbarToggle<CR>
" let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
" let g:tagbar_autoclose = 1

"" Remove search highlighting
"noremap <leader><space> :noh<cr>:match none<cr>:2match none<cr>:3match none<cr>

"" Sudo write (,W)
"noremap <leader>W :w !sudo tee %<CR>

"" Remap :W to :w
"" command W w

"" Indent/unident block (,]) (,[)
"nnoremap <leader>] >i{<CR>
"nnoremap <leader>[ <i{<CR>

"" Use <leader>S to sort properties.  Turns this:
""
""     p {
""         width: 200px;
""         height: 100px;
""         background: red;
""
""         ...
""     }
""
"" into this:

""     p {
""         background: red;
""         height: 100px;
""         width: 200px;
""
""         ...
""     }
""
" au BufNewFile,BufRead *.css  nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

"" Add dashes to the list of 'word characters' for CSS files:
""
"au Filetype css setlocal iskeyword+=-

"" Use Shift-Return to turn this:
""     <tag>|</tag>
""
"" into this:
""     <tag>
""         |
""     </tag>
au BufNewFile,BufRead *.html inoremap <buffer> <s-cr> <cr><esc>kA<cr>
au BufNewFile,BufRead *.html nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

"nore ; :

"" Clean whitespace
map <leader>s  :%s/\s\+$//<cr>:let @/=''<CR>

"" Easily move to start/end of line
"" Note that L is g_, not $, so it acts the same in normal and visual mode.
noremap H ^
noremap L g_

"command! -bar -range=% NotRocket :<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/ge

"" Notes and Tips
"" - Press 'zz' to instantly center the line where the cursor is located.
"" - Press control-] to jump to the method definition
"" - gg top - shift-g bottom
"" - shift-v to select line
"" - vit select all in tag
"" - dat select all in tag...?
"" - dst delete surrounding tag
"" - cst <new tag>
"" - cs current to new surrounding element
"" - dt remove surrounding tags
"" - select - Shift S - tag to add surrounding tag
"" - m + letter to set a mark
"" - m + captial letter to set a global mark
"" - set a mark & go to top of section. d'mark to delete up to the mark
"" - >'m and <'m to increase/decrease indentation
"" - ='m indent block

