" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

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

"""""" === echodoc === "
"""""" Enable echodoc on startup
"""""let g:echodoc#enable_at_startup = 1
"""""
"""""" === vim-javascript === "
"""""" Enable syntax highlighting for JSDoc
"""""let g:javascript_plugin_jsdoc = 1
"""""
"""""" === vim-jsx === "
"""""" Highlight jsx syntax even in non .jsx files
"""""let g:jsx_ext_required = 0
"""""
"""""" === javascript-libraries-syntax === "
"""""let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'
"""""
"""""" === Signify === "
"""""let g:signify_sign_delete = '-'
"""""
"""""" Set floating window to be slightly transparent
"""""set winbl=10
"""""

if has("termguicolors")
	set termguicolors
endif
"
" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

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

"nnoremap <expr> vm <SID>VisualVLine()
"fun! s:VisualVLine() abort
"	let [_, lnum, col; _] = getcurpos()
"	let line = getline('.')
"	let col += strdisplaywidth(line) - strwidth(line)
"
"	let [from, to] = [lnum, lnum]
"	while strdisplaywidth(getline(from - 1)) >= col
"		let from -= 1
"	endwhile
"
"	while strdisplaywidth(getline(to + 1)) >= col
"		let to += 1
"	endwhile
"
"	return "\<C-v>" .
"				\ (to == lnum ? '' : (to - lnum . 'jo')) .
"				\ (from == lnum ? '' : (lnum - from . 'k'))
"endfun

" Wrap in try/catch to avoid errors on initial install before plugin is available
"try
"" === Denite setup ==="
"" Use ripgrep for searching current directory for files
"" By default, ripgrep will respect rules in .gitignore
""   --files: Print each file that would be searched (but don't search)
""   --glob:  Include or exclues files for searching that match the given glob
""            (aka ignore .git files)
""
"call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
"
"" Use ripgrep in place of "grep"
"call denite#custom#var('grep', 'command', ['rg'])
"
"" Custom options for ripgrep
""   --vimgrep:  Show results with every match on it's own line
""   --hidden:   Search hidden directories and files
""   --heading:  Show the file name above clusters of matches from each file
""   --S:        Search case insensitively if the pattern is all lowercase
"call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
"
"" Recommended defaults for ripgrep via Denite docs
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'final_opts', [])
"
"" Remove date from buffer list
"call denite#custom#var('buffer', 'date_format', '')
"
"" Custom options for Denite
""   auto_resize             - Auto resize the Denite window height automatically.
""   prompt                  - Customize denite prompt
""   direction               - Specify Denite window direction as directly below current pane
""   winminheight            - Specify min height for Denite window
""   highlight_mode_insert   - Specify h1-CursorLine in insert mode
""   prompt_highlight        - Specify color of prompt
""   highlight_matched_char  - Matched characters highlight
""   highlight_matched_range - matched range highlight
"let s:denite_options = {'default' : {
"\ 'split': 'floating',
"\ 'start_filter': 1,
"\ 'auto_resize': 1,
"\ 'source_names': 'short',
"\ 'prompt': 'λ ',
"\ 'highlight_matched_char': 'QuickFixLine',
"\ 'highlight_matched_range': 'Visual',
"\ 'highlight_window_background': 'Visual',
"\ 'highlight_filter_background': 'DiffAdd',
"\ 'winrow': 1,
"\ 'vertical_preview': 1
"\ }}
"
"" Loop through denite options and enable them
"function! s:profile(opts) abort
"  for l:fname in keys(a:opts)
"    for l:dopt in keys(a:opts[l:fname])
"      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
"    endfor
"  endfor
"endfunction
"
"call s:profile(s:denite_options)
"catch
"  echo 'Denite not installed. It should work after running :PlugInstall'
"endtry

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

"" === Vim airline ==== "
"" Enable extensions
"let g:airline_extensions = ['branch', 'hunks', 'coc']
"
"" Update section z to just have line number
"let g:airline_section_z = airline#section#create(['linenr'])
"
"" Do not draw separators for empty sections (only for the active window) >
"let g:airline_skip_empty_sections = 1
"
"" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"
"" Custom setup that removes filetype/whitespace from default vim airline bar
"let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
"
"" Customize vim airline per filetype
"" 'nerdtree'  - Hide nerdtree status line
"" 'list'      - Only show file type plus current line number out of total
"let g:airline_filetype_overrides = {
"  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
"  \ 'list': [ '%y', '%l/%L'],
"  \ }
"
"" Enable powerline fonts
"let g:airline_powerline_fonts = 1
"
"" Enable caching of syntax highlighting groups
"let g:airline_highlighting_cache = 1
"
"" Define custom airline symbols
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"
"" Don't show git changes to current file in airline
"let g:airline#extensions#hunks#enabled=0
"
"catch
"  echo 'Airline not installed. It should work after running :PlugInstall'
"endtry

