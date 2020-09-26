
source ~/.config/nvim/coc.nvimrc


" =========================================================================== "
" ===                           CALL PLUGINS                              === "
" =========================================================================== "
call plug#begin('~/.vim/plugged')

" Plugin Git Fugitive
"Plug 'altercation/vim-colors-solarized'
"Plug 'christianchiarulli/nvcode.vim'
"Plug 'jnurmine/Zenburn'
"Plug 'joshdick/onedark.vim'
"Plug 'leafoftree/vim-vue-plugin'
"Plug 'majutsushi/tagbar'
"Plug 'mattn/emmet-vim'
"Plug 'mg979/vim-visual-multi'
"Plug 'pangloss/vim-javascript'
"Plug 'psliwka/vim-smoothie'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'mhinz/vim-startify'
"Plug 'tomasiser/vim-code-dark'
"Plug 'valloric/matchtagalways'
"Plug 'vim-scripts/indentpython.vim'
"Plug 'voldikss/vim-floaterm'
Plug 'junegunn/goyo.vim'
Plug 'posva/vim-vue'
Plug 'liuchengxu/vim-clap'
Plug 'unblevable/quick-scope'       " Plug
Plug 'RRethy/vim-illuminate'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'chriskempson/base16-vim'
Plug 'haya14busa/vim-edgemotion'
Plug 'itchyny/lightline.vim' 
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'branch': 'release/0.x',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
      \ }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'

call plug#end()
" ==================================jjj========================================= "
""" Processo para instlação das fontes do nedtree
"mkdir ~/.fonts
"cd ~/.fonts 
"wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
"fc-cache

" Use K to show documentation in preview window.


" =========================================================================== "
" ===                           CONFIG                                    === "
" =========================================================================== "
let g:sneak#label = 1

set clipboard=unnamedplus
set foldmethod=syntax
set foldlevel=99
set guifont=Fira\ Code\ Nerd\ Font
set ruler
set termguicolors     " enable true colors support
set fillchars+=vert:\| "Divisao do Split"
set hidden " if hidden is not set, TextEdit might fail.
set nobackup
set nowritebackup
set cmdheight=1 " Better display for messages
set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.
set timeoutlen=500
set noshowmode
set shortmess+=c " don't give |ins-completion-menu| messages.
set background=dark
set ignorecase
set incsearch
set encoding=UTF-8
set wildmenu
set relativenumber
set cursorline
set so=10
set nowrap
set mouse=a
set noshowmode
set history=5000

let g:indentLine_char_list = ['┆']
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentguides_ignorelist = ['text']
"let g:indentguides_spacechar = '┆'
"let g:indentguides_tabchar = '|'

" =========================================================================== "
" ===                           MAPS                                      === "
" =========================================================================== "
noremap <Space> :

nmap <F8> :TagbarToggle<CR>

let mapleader=","

nmap <silent> <C-p> :FZF <CR>
nmap <silent> <S-b> :Buffers <CR>
"nmap <silent> <C-p> :Clap files<CR>
nmap <leader>w :Vista!! <CR>
map <leader>c :Clap colors<CR>
map <leader>g :GitFiles<CR>
map <leader>b :Clap buffers<CR>
map <leader>j :Clap jumps<CR>
map <leader>q :q! <CR>
map <leader>f :Clap lines <CR>
map <leader>p :Prettier <CR>
nnoremap <leader>e :MtaJumpToOtherTag<cr>

nnoremap <leader>k :call <SID>show_documentation()<CR>

map <leader>t :call <SID>tmux_hide()<CR>
map <leader>T :call <SID>tmux_shoshoww()<CR>

function! s:tmux_hide()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
endfunction

function! s:tmux_show()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
endfunction

map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)
map <F4> :AirlineToggle<CR>
map <F2> :NERDTreeToggle<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <S-Tab> :tabprevious<CR>
nmap <Tab> :tabnext <ESC> :e <CR>
imap jk <ESC>
imap kj <ESC>
nmap tt :tabnext <cr>
nmap tn :tabnew <cr>
nmap <C-t> :tabnew <cr>
nmap tc :tabclose <cr>
nmap qq :wq! <cr>
nmap çç :w! <cr>
nmap ÇÇ :w! <cr>
imap çç <ESC> :w! <cr>
noremap <F7> mzgg=G`z


" Resize Windows ALT
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>



" Rodar scripts python diretamente no terminal do vim
nmap <buffer> <C-B> :exec '!python3' shellescape(@%, 1)<cr>
noremap <F3> :Autoformat<CR>
noremap <F1> :GitMessenger<CR>
nnoremap <A-x> :tabnew ~/.config/nvim/init.vim<cr>
nnoremap <A-z> :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>nn :tabnew ~/git/arkk/notes.md<cr>
nnoremap <leader>td :tabnew ~/git/arkk/todo.todo<cr>
"
" Disable the arrow keys
" In NORMAL mode
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
" In INSERT mode
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
" In VISUAL mode
xnoremap <up>    <nop>
xnoremap <down>  <nop>
xnoremap <left>  <nop>
xnoremap <right> <nop>
" Split window
nmap sv :split<Return><C-w>w
nmap ss :vsplit<Return><C-w>w
" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l


" =========================================================================== "
" ===                           PLUGINS CONFIG                            === "
" =========================================================================== "
"   Lightline
"\   'left': [ [ 'mode', 'paste' ],
"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'arejano' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'readonly': 'LightlineReadonly',
      \   'filename': 'LightlineFilename',
      \   'mode': 'LightlineMode'
      \ },
      \ 'mode_map': {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'T',
      \ },
      \ }


function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


function! LdightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineMode()
  return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction


" Airline
syntax on
syntax enable
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
"hi LineNr ctermbg=NONE ctermfg=black
"hi LineNr guibg=#CCC
:let g:airline_theme='base16'
":let g:airline_theme='minimalist'

hi Normal ctermbg=none
hi Terminal ctermbg=none
hi Terminal guibg=none
hi Normal guibg=none


" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1

let ayucolor="mirage"  " for light version of theme
" Rainbow
"let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
"colorscheme ayu
colorscheme base16-default-dark
"colorscheme miramare


if has("termguicolors")
  set termguicolors
endif
"Removendo background do Numero das Linhas
highlight clear LineNr
highlight clear SignColumn
highlight clear StatusLine
highlight clear TabLineFill
highlight clear Tabline
hi LineNr guifg=grey
"let g:loaded_airline =1


" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'
" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" Function to create the custom floating window
"Claps Configuration
"
let &rulerformat = '%50(b%n %{&ff} %{&ft}' .
      \ '%( %{len(getqflist()) ? ("q" . len(getqflist())) : ""}%)' .
      \ '%( %{search("\\s$", "cnw", 0, 200) ? "∙$" : ""}%)' .
      \ '%( %{exists("b:stl_fn") ? call(b:stl_fn) : ""}%)' .
      \ '%= L%l,%c%V %P %*%)'


" Customize vim airline per filetype
" 'nerdtree'  - Hide nerdtree status line
" 'list'      - Only show file type plus current line number out of total
let g:airline_filetype_overrides = {
      \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
      \ 'list': [ '%y', '%l/%L'],
      \ }

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0

filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

function! TabHTML()
  filetype plugin indent on
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set smartindent
endfunction

function! PySyntax()
  set expandtab
  set tabstop=4
  set shiftwidth=4
  set textwidth=79
  syntax enable
  filetype indent on
  set autoindent
  set fileformat=unix
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


autocmd FileType html,css,javascript,typescript :call TabHTML()
autocmd FileType py :call PySyntax()

hi VertSplit guibg=bg
let g:indentLine_char_list = ['┆']

function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 90% of the height
  let height = float2nr(&lines * 0.5)
  " 60% of the height
  let width = float2nr(&columns * 0.6)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction


hi Normal ctermbg=none
hi Terminal ctermbg=none
hi Terminal guibg=none
hi Normal guibg=none

"highlight Pmenu ctermbg=gray guibg=gray

