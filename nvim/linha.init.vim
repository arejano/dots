" =========================================================================== "
" ===                           CALL PLUGINS                              === "
" =========================================================================== "
call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-wombat-scheme'
Plug 'ap/vim-css-color' "CSS Colo
Plug 'vifm/vifm.vim' "ViFM FileManager
Plug 'valloric/matchtagalways' " Match tags in HTML
Plug 'fcpg/vim-fahrenheit'  " Dark Theme
Plug 'chriskempson/base16-vim'
Plug 'w0rp/ale'
Plug 'liuchengxu/vim-clap'
Plug 'jiangmiao/auto-pairs' "Auto Close tags in Python
Plug 'alvan/vim-closetag' "Auto close HTML Tags
Plug 'itchyny/vim-cursorword'
Plug 'haya14busa/vim-edgemotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense Engine
Plug 'ntpeters/vim-better-whitespace' " Trailing whitespace highlighting & automatic fixing 
Plug 'rstacruz/vim-closer'
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree' " File explorer
" === Javascript Plugins === "
Plug 'HerringtonDarkholme/yats.vim' " Typescript syntax highlighting
Plug 'mxw/vim-jsx' " ReactJS JSX syntax highlighting
Plug 'heavenshell/vim-jsdoc' " Generate JSDoc commands based on function signature
Plug 'chr4/nginx.vim' " Syntax highlighting for nginx
Plug 'othree/javascript-libraries-syntax.vim' " Syntax highlighting for javascript libraries
Plug 'othree/yajs.vim' " Improved syntax highlighting and indentation
Plug 'itchyny/lightline.vim' "Lightline
"Plug 'liuchengxu/vista.vim'
"Plug 'vim-airline/vim-airline' " Customized vim status line
"Plug 'vim-airline/vim-airline-themes'
"Plug 'tpope/vim-sensible'
call plug#end()

" =========================================================================== "
" ===                           CONFIG                                    === "
" =========================================================================== "
scriptencoding utf=8
colorscheme base16-default-dark
set noshowmode
set fillchars+=vert:\| "Divisao do Split"
set nobackup
set nowritebackup
set cmdheight=1 " Better display for messages
set shortmess+=c
"set signcolumn=yes " Coluna antes dos numeros que mostra se tem + - ou erros
set noshowcmd " Don't show last command
" === TAB/Space settings "
set expandtab " Insert spaces when TAB is pressed.
set softtabstop=2 " Change number of spaces that a <Tab> counts for during editing ops
set shiftwidth=2 " Indentation amount for < and > commands.
" Hides buffers instead of closing them
set hidden
set termguicolors     " enable true colors support
set background=dark
set ignorecase
set incsearch
set relativenumber
"set cursorline
set so=999
set nowrap
syntax on
syntax enable
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
let g:indentLine_char_list = ['┆'] "let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"Removendo background do NUmero das Linhas
highlight CursorLineNr cterm=NONE ctermbg=15 ctermfg=8 gui=NONE guibg=NONE guifg=NONE
highlight clear SignColumn
highlight clear StatusLine
highlight clear TabLineFill
highlight clear Tabline

" =========================================================================== "
" ===                           MAPS                                      === "
" =========================================================================== "
map <Space> :
imap jk <ESC>
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

let mapleader=","
map <leader>c :Clap colors<CR>
map <leader>b :Clap buffers<CR>
map <leader>j :Clap jumps<CR>
map <leader>q :q! <CR>
map <leader>f :Clap lines<CR>
map <leader>p :Prettier<CR>
nmap <leader>w :Vista!! <CR>
nmap <silent> <C-p> :FZF <CR>

map <F4> :AirlineToggle<CR>
map <F2> :NERDTreeToggle<CR>
nmap <S-Tab> :tabprevious<CR>
nmap <Tab> :tabnext <ESC> :e <CR>
"nmap <C-a> ggVG
"nmap <C-A> ggVG
nmap tt :tabnext <cr>
nmap tn :tabnew <cr>
nmap tc :tabclose <cr>
nmap qq :wq! <cr>
nmap çç :w! <cr>
imap çç <ESC> :w! <cr>
noremap <F7> mzgg=G`z

" Quickly edit init.vim while editing another file.
nnoremap <A-x> :tabnew ~/.config/nvim/init.vim<cr>
nnoremap <leader>nn :tabnew ~/git/arkk/notes.md<cr>
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
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" === NERDTree === "
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'
" Show hidden files/directories
let g:NERDTreeShowHidden = 1
" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1
" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'
" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']


" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'

function! CreateCenteredFloatingWindow()
    "let width = min([&columns - 4, max([80, &columns - 20])])
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.5)
    "let top = ((&lines - height) / 2) - 1
    let top = 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

"Claps Configuration
let &rulerformat = '%50(b%n %{&ff} %{&ft}' .
			\ '%( %{len(getqflist()) ? ("q" . len(getqflist())) : ""}%)' .
			\ '%( %{search("\\s$", "cnw", 0, 200) ? "∙$" : ""}%)' .
			\ '%( %{exists("b:stl_fn") ? call(b:stl_fn) : ""}%)' .
			\ '%= L%l,%c%V %P %*%)'

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Wrap in try/catch to avoid errors on initial install before plugin is available
"try

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


" =========================================================================== "
" ===                           EXTRAS                                    === "
" =========================================================================== "
