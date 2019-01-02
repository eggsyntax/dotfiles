" Add/remove plugins. https://github.com/tpope/vim-pathogen
"   Install: mkdir -p ~/.vim/autoload ~/.vim/bundle &&  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" For MacVim: shift-arrow to select
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
else
    " Copy/paste to system clipboard (if mouse-highlighted):
    " " http://unix.stackexchange.com/a/140584
    " set mouse=v
    " set mouse=a
endif

" TODO decide what mouse behavior should be in MacVim and terminal vim
" separately (using the if statement above). MacVim seems to work fine
" without any 'set mouse', but terminal copy/paste stuff gets weird.

set nocompatible " Don't restrict to vanilla vi
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin " GUI like windows, except:
set selectmode="cmd" # Enter visual mode with 'v' and 'V'

" Programming font of choice: http://levien.com/type/myfonts/inconsolata.html
set guifont=Inconsolata:h14
"hi Search guibg=LightGreen

" Change cursor shape between insert and normal mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

" Share system clipboard (MacVim/Windows Gvim)
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
" set clipboard=unnamed

syntax enable
set background=light
" Preferred colorscheme, which I love and use everywhere
" http://ethanschoonover.com/solarized
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" allows ctrl-uparrow & -downarrow to scroll the screen. may need adjustment
" on *nix systems.
unmap <C-Y>
map <C-Down> <C-E>
map <C-Up> <C-Y>

" By default, jumping to a mark with ' just jumps to the line. Let's
" make it jump to the actual point instead (formerly mapped to `)
nnoremap ' `

" Let's try having non-shifty chars for beginning/end of line.
" In other words use =\ instead of ^$. Only sensible in Dvorak.
onoremap = ^
onoremap \ $
nnoremap = ^
nnoremap \ $
vnoremap = ^
vnoremap \ $

" let shift-esc mean "enter normal mode, leaving the cursor where it is"
inoremap <S-Esc> <Esc>`^

" Screw shifting for every :
" Use the ; instead and let the : clear highlighting
nnoremap <silent> : :noh<CR>
nnoremap ; :
" Also in visual mode:
xnoremap <silent> : :noh<CR>
xnoremap ; :

" Unmap ctrl-a from 'select all' so it can increment numbers like god intended. ctrl-x is fine already.
unmap <C-A>

set hls " highlight search terms

"This unsets the 'last search pattern' register by hitting escape
" On MBA, doesn't work -- inserts funky chars on startup.
" See http://stackoverflow.com/questions/657447/vim-clear-last-search-highlightingu
"nnoremap <ESC> ;noh<CR><ESC>

" initial window size
"set co=80
"set lines=40
" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set sw=4 " indentation width

set tw=120 " line length
" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-

"Delete trailing whitespace on save (only certain filetypes)
autocmd BufWritePre *.cljs :%s/\s\+$//e
autocmd BufWritePre *.clj :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
"autocmd FileType clj, cljs, py autocmd BufWritePre <buffer> :%s/\s\+$//e

"set list
" temp comment TODO


" Hide buffers instead of closing them
"set hidden

" auto folding based on indent
set foldmethod=indent
set nofen " start with all folds open
set autoindent
set wrap linebreak textwidth=0

" these two options cause visual word wrap like most text editors.
set formatoptions=l
set lbr

" put all those damn swap files in one place
set backupdir=~/tmp/vim_backup
set dir=~/tmp/vim_backup

" same for persistent undo files
" https://stackoverflow.com/questions/15660669/what-is-a-un-file-or-or-why-does-vim-in-the-terminal-make-the-un-file
set undodir=~/tmp/vim_backup

set ic smartcase " ignore case

set incsearch " start searching as you type

" aliasii
"ab #!pl #!/usr/bin/env perl
"ab #!py #!/usr/bin/env python
"
"Note the need to double-escape in this next one
command Getcols execute "%s/\\v\\s*(\\w+).*/'\\1',/ | %join | %s/,$/)/ | %s/^/\\(/"

" do some smart things with filetypes
filetype on
filetype plugin on
filetype indent on

" Reopen files to exact position, not start-of-line
set nostartofline

" Don't do backup files for certain directories (fixes http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place)
set backupskip=/tmp/*,/private/tmp/*

" Let's timeout of insert mode :)
:set ut=30000 " 30 sec
:au CursorHoldI * stopinsert

" Hey, let's do lots of stuff to make vim a better python ide!
" http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide

if has("autocmd")
  autocmd FileType python set nu
  " reopen files at same location:
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Tab = omnicomplete, but only when appropriate:
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Tab triggers omni completion
set omnifunc=syntaxcomplete#Complete
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <Cmd-.> <c-r>=InsertTabWrapper()<cr>
"inoremap <Cmd-.> <C-X><C-O>

" Auto spellcheck for .txt files
autocmd BufRead,BufNewFile *.txt setlocal spell

" Python-mode:
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_lint_ignore = "E501"

" change the mapleader from \ to ,
let mapleader=","
" And make it take longer to time out
" (But fast to exit insert mode)
set timeoutlen=4000 ttimeoutlen=10

" It's a pain in the ass when you have to hit append-space-escape-right-paste
" to get a space before the thing you're pasting. Make <Leader>p do that
" automatically. (and <Leader>P to do it before the cursor)
noremap <Leader>p <ESC>a <ESC>p
noremap <Leader>P <ESC>i <ESC>P

" Backspace in normal mode should delete so you don't have to hit shift-x.
nnoremap <BS> X

" Ctrl-P is awkward, so let's map Alt-C to word completion
" Note! To remap alt-keys on mac, gotta actually insert the weird char. https://stackoverflow.com/questions/5379837/is-it-possible-to-mapping-alt-hjkl-in-insert-mode
nnoremap ç <C-X><C-P>
inoremap ç <C-X><C-P>

" Crontab files must be edited in place
" http://stackoverflow.com/a/21194148
autocmd FileType crontab setlocal nowritebackup

" Share system clipboard (MacVim/Windows Gvim)
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
set clipboard=unnamed

" show statusline
set noruler
set laststatus=2

" set statusline to be useful
set statusline=%t           "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=[%{&ff}]   "file format
set statusline+=%h      	"help file flag
set statusline+=%m      	"modified flag
set statusline+=%r      	"read only flag
"set statusline+=%y         "filetype
set statusline+=%=      	"left/right separator
set statusline+=%c:      "cursor column
set statusline+=%4l\ \/\    	"current line
set statusline+=%L      	"total lines
set statusline+=\ %P    	"percent through file
