" to hot reload vimrc ":so %":
set encoding=UTF-8
scriptencoding utf-8          " We have special characters showing indentation
" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Remember the last editing place in a file
Plugin 'farmergreg/vim-lastplace'
" Git plugin
Plugin 'tpope/vim-fugitive'
" GitHub plugin for vim-fugitive simple ":Gbrowse" a file on git
Plugin 'tpope/vim-rhubarb.git'
" Displays inline git blame like the cool Gitlens users on VS Code
Plugin 'APZelos/blamer.nvim'
let g:blamer_enabled = 1
let g:blamer_relative_time = 1
let g:blamer_template = '<committer>, <committer-time> • <summary>'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Tab intercepto, which will hopefully get ultisnips and youcompleteme to work
" happily together
Plugin 'ervandew/supertab'
" Start page enhancement
Plugin 'mhinz/vim-startify'
" File navigation tool
Plugin 'ctrlpvim/ctrlp.vim'
" File tree plugin (don't tell the Vim purists)
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Automatic "end" "fi" etc upon CR
Plugin 'tpope/vim-endwise'
" Automatic closing of XML / HTML tags
Plugin 'alvan/vim-closetag'
" Comment Lines: gcc
Plugin 'tpope/vim-commentary'
" vimrc key mappings and stuff
Plugin 'tpope/vim-unimpaired'
" Surround a word with quotes and things
Plugin 'tpope/vim-surround'
" Async linter - This is my favorite plugin in teh whole world
Plugin 'dense-analysis/ale'
" Enable completion where available.
let g:ale_completion_enabled = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%] [%code%]'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_error = '❌'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:python_pylint_auto_pipenv = 1
let g:ale_python_pylint_executable = 'python3'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'sh': 'shfmt',
\   'yaml': 'yamlfix',
\   'php': 'php_cs_fixer'
\}
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
set number relativenumber
" Hugo static site generator helper plugin
Plugin 'robertbasic/vim-hugo-helper'
" LaTeX
Plugin 'lervag/vimtex'
let g:tex_flavor = 'latex'
" Crazy auto-completion for lots of languages
" NOTE: After update run the Zsh alias "recompile-ymcd"
Plugin 'ycm-core/YouCompleteMe'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ '/usr/local/bin/yaml-language-server', '--stdio' ],
  \     'filetypes': [ 'yaml' ]
  \   }
  \ ]
" For TypeScript linting
Plugin 'leafgarland/typescript-vim'
" Since it kept detecting .ts as XML...
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
" Detect wscript (zarf/waf) files correctly
autocmd BufNewFile,BufRead wscript setlocal filetype=python
" One syntax highlighting package to rule them all, faster. Replaces PowerShell,
" Nginx, and HAProxy (among others)
Plugin 'sheerun/vim-polyglot'
" Cool status bar at the bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#ale#enabled = 1
" Automatic editor config support for projects, written in an editor-agnostic
" manner
Plugin 'editorconfig/editorconfig-vim'
" shfmt auto-formatter. Call with ':Shfmt' to auto-format shell scripts
Plugin 'z0mbix/vim-shfmt'
let g:shfmt_extra_args = '--indent 2 --case-indent --simplify'
" BATS shell testing syntax highlighting
" TODO: Submit to polyglot and remove
Plugin 'aliou/bats.vim'
" Auto-formatting for things like SQL (with sqlformat)
Plugin 'Chiel92/vim-autoformat'
" Markdown stuff, needs tabular first
" Tabular is awesome for more than just markdown
" Run `:Tabularize /=` to align all the things by an equal sign
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
" Cisco IOS syntax highlighting
Plugin 'momota/cisco.vim'
" Ansible + Jinja2
Plugin 'pearofducks/ansible-vim'
" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'
" Automatic snippets (works with YouCompleteMe)
Plugin 'SirVer/ultisnips'
" Honza's gigantic repo of snippets for ultisnips
Plugin 'honza/vim-snippets'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" CSV / TSV / Excel-style
Plugin 'chrisbra/csv.vim'
" Vader - Vim testing framework. I needed this for syntax highlighting the
" .vader files
Plugin 'junegunn/vader.vim'
" NerdFonts for Vim
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on    " required
syntax on
" Vundle Help:
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Automatically change to light style background for Solarized-Light iTerm
" profile, assume others are dark
if $ITERM_PROFILE ==? 'Solarized-Light'
    set background=light
else
    set background=dark
endif
colorscheme solarized

" Diff before saving
" https://stackoverflow.com/questions/749297/can-i-see-changes-before-i-save-my-file-in-vim
function! s:DiffWithSaved()
  let filetype=&filetype
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe 'setlocal bt=nofile bh=wipe nobl noswf ro ft=' . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

function! StripWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! StripWhitespace call StripWhitespace()

" rg is faster than grep for our fast fuzzy file searching with CtrlP
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif
" Automatically open NERDTree if you open vim without any file

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Map key to open NERDTreee
map <C-n> :NERDTreeToggle<CR>

" Make switching vim panes as easy as CTRL + JKHL
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K> 
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H>
" Sets vim command completion (e.g. for ":w") to show up on the bottom
set wildmenu
set wildmode=longest:full,full
" Mouse reporting in vim. Hold "alt" in iTerm2 to disable
set mouse=a
" Indentation
set tabstop=8 softtabstop=2 expandtab shiftwidth=4 smarttab

" Fix for backspace not working after using compiled vim on CentOS
set backspace=indent,eol,start
" Highlight 80 columns
highlight ColorColumn ctermbg=black
call matchadd('ColorColumn', '\%81v', 80) 
" Autowrapping
set textwidth=80
set formatoptions+=t
" Show a line across all lines at the current column of the cursor. Useful for
" Python especially
set cursorcolumn
" Spellecheck in Markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
autocmd FileType gitcommit setlocal spell
" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
" Fix for crontab editing on macOS not working
" https://superuser.com/questions/359580/error-adding-cronjobs-in-mac-os-x-lion
autocmd filetype crontab setlocal nobackup nowritebackup

""""""" vim-startify stuff
" More pretty, less compatible
let g:startify_fortune_use_unicode = 1
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
"""""""
" Vim Tricks:
" Deleting blank lines:
"   g/^\s*$/d
