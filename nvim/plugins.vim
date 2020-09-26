" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
	if executable('curl')
		let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
		if v:shell_error
			echom "Error downloading vim-plug. Please install it manually.\n"
			exit
		endif
	else
		echom "vim-plug not installed. Please install it manually or install curl.\n"
		exit
	endif
endif

call plug#begin('~/.config/nvim/plugged')

"Minimap
Plug 'severin-lemaignan/vim-minimap'

"CSS Colors
Plug 'ap/vim-css-color'

"Lightline
Plug 'itchyny/lightline.vim'

"ViFM FileManager
Plug 'vifm/vifm.vim'

" Match tags in HTML
Plug 'valloric/matchtagalways'

" Dark Theme
Plug 'fcpg/vim-fahrenheit'

" Theming
Plug 'chriskempson/base16-vim'

Plug 'w0rp/ale'
"Plug 'tpope/vim-sensible'
Plug 'liuchengxu/vim-clap'
"Plug 'liuchengxu/vista.vim'

"Auto Close tags in Python
Plug 'jiangmiao/auto-pairs'

"Auto close HTML Tags
Plug 'alvan/vim-closetag'

" Movimentação inteligente
Plug 'itchyny/vim-cursorword'
Plug 'haya14busa/vim-edgemotion'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Denite - Fuzzy finding, buffer management
"Plug 'Shougo/denite.nvim'

" auto-close plugin
Plug 'rstacruz/vim-closer'

" Customized vim status line
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'


" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

call plug#end()
