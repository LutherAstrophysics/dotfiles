if !has('nvim')
    " By default vim starts in mode comptible with VI;
    " this means advanced features in vim are turned off;
    " So turning on nocomptile mode
    set nocompatible
endif

set noerrorbells
set nu
set backspace=indent,eol,start
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
" set ignorecase
set noswapfile
set nobackup
set incsearch

set mouse=a
set laststatus=2        

let mapleader = " "
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l

filetype plugin indent on

" Vim Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'Nash0x7E2/awesome-flutter-snippets'
Plug 'eslint/eslint'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'javascriptreact', 'typescriptreact', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html', 'mjml'] }
call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Run Make Silently
nnoremap <leader>make :w <bar> :silent make\|redraw!\|cc<CR>

" Window Size
nnoremap <leader>sm :res -10<CR>
nnoremap <leader>lg :res +10<CR>
nnoremap <leader>eq <C-W>=
" Remap the emmet <C-Y> leader:
let g:user_emmet_leader_key=","

" Copy to clipboard
vnoremap <leader>y "*y


set splitbelow
set splitright

set foldmethod=indent
"""
"zo - opens folds
"zc - closes fold
"zm - increases auto fold depth
"zr - reduces auto fold depth
"and if you ever get bored
"set foldmethod=syntax
"""
set foldcolumn=2

" Toggle Relative Number
function RelativeNumberToggle()
    set relativenumber!
endfunction

nnoremap <leader>n :call RelativeNumberToggle()<CR>
" Make the current work CAPITAL in insert mode
inoremap <c-U> <esc>bvegUea
" Make the current work lowercase in insert mode
inoremap <c-u> <esc>bveguea

imap <c-c> <esc>Vgc<esc>gi<esc>lla
nmap <c-c> <esc>Vgc<esc>

" Run make silently
nnoremap <leader>m :w <bar> !make > /dev/null<cr><cr>

" Run command in current line terminal
noremap Q !!$SHELL<CR>

" quit current file/window?
nnoremap <c-x> :q<CR>


" Cycle through tabs l-> forward h-> backwards
nnoremap <Tab>l :tabnext<CR>
nnoremap <Tab>h :-tabnext<CR>
" Make it easier to open new file in newtab
nnoremap <Tab>n :tabnew 
" Go to last & first tab
nnoremap <Tab>0 :tabfirst<CR>
nnoremap <Tab>9 :tabl<CR>
" Cycle through tabs l-> forward h-> backwards
nnoremap <c-l> :tabmove +<CR>
nnoremap <c-h> :tabmove -<CR>

"Substitute currentworld
nnoremap <c-s> :call ChangeCurrentWord()<CR>

function ChangeCurrentWord()
    let l:current = expand("<cword>")
    let l:replace_with = input(':s/'.current.'/')
    execute 's/'.current.'/'.replace_with
endfunction

" Close the window above
nnoremap <leader><c-l>  <C-W>k:q<CR>
nnoremap <leader><c-h>  <C-W>h:q<CR>
nnoremap <leader><c-k>  <C-W>k:q<CR>
nnoremap <leader><c-j>  <C-W>j:q<CR>

" Allow moviing with < > multiple times
vnoremap < <gv
vnoremap > >gv

" move up or down, but maintain cursor position
nnoremap zz i<esc>zzgi<esc>
nnoremap zt i<esc>ztgi<esc>
nnoremap zb i<esc>zbgi<esc>
inoremap <C-z><C-z> <esc>zzgi<esc>a
inoremap <C-b> <esc>zzgi<esc>a
inoremap <C-z><C-t> <esc>ztgi<esc>a
inoremap <C-z><C-b> <esc>zbgi<esc>a

" Go to beginning of next line
nnoremap <c-\> <esc>o<CR><esc>
inoremap <c-\> <esc>o<CR><esc>i

" Correct comment highlighting in jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'


" move a line before the current line or after
nnoremap M :m+<CR>
nnoremap K :m-2<CR>


" TODO
" match lines with about 75 characters then break the line " match lines with 
"
function TrimLine(m)
        execute 's/\(.\{70}.\{-}\s\)/\1\r/g' 
endfunction

vnoremap <leader>t :<C-U>call TrimLine(count)<CR>
nnoremap <leader>t :<C-U>call TrimLine(count)<CR>

function DFA()
    execute 's/(\(\w\+\)\s\("\w"\)\s\(\w\+\))/\1 -> \3 [label = \2];'
endfunction

"
" MY FAV VIM COMMAND
"    apply recent susbstition
" generally, & repeats last substitution
" and :%& repeats last substituion on all lines
" in visual mode, :%& repeats last sub on selected lines
" and this is my favorite
nnoremap <leader>s :%sg<CR>
vnoremap <leader>s :%sg<CR>

" set textwidth in *.md files
au BufRead,BufNewFile *.md* setlocal textwidth=70
au BufRead,BufNewFile *.txt* setlocal textwidth=70

" for ycm
set encoding=utf-8
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" markdownpreview for all files
let g:mkdp_command_for_global = 1 

" in case the screen gets messed up with something like command K
nnoremap <leader>i :redraw!<CR>

""" if opening a directory using vim (which happens sometimes, accidentally)
""" open nnn instead
""" https://unix.stackexchange.com/questions/297844/how-can-i-stop-vim-from-editing-directories
for f in argv() 
  if isdirectory(f)
    autocmd BufWinLeave * ! n argv() 
    quit
  endif
endfor

""" pasting in tmux while in vim has many issues
""" this is a fix to that
""" https://vi.stackexchange.com/questions/23110/pasting-text-on-vim-inside-tmux-breaks-indentation 
if &term =~ "screen"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    exec "set t_PS=\e[200~"
    exec "set t_PE=\e[201~"
endif


vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Set textwidth
set textwidth=80
" Color column one char after textwidth
set cc=+1
" set the color of column
highlight ColorColumn ctermbg=7
