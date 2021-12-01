if has("syntax")
	syntax enable
endif

"vi와의 호환성 X
set nocompatible

" 들여쓰기 설정
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4

" 줄번호 설정
set number
set numberwidth=2

"커서 위치 표시
set ruler
"커서에 밑줄 표시
set cursorline

"normal 모드 명령어 우하단에 표시
set showcmd

"title 표시
set title

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

"검색어 하이라이팅
set hlsearch
"매칭되는 괄호 보여줌
set showmatch
"한글자 입력할때마다 매치되는 부분 표시하기
set incsearch
"현재 커서가 놓여진 괄호의 짝을 표시하기
set showmatch
"단어단위로 짤림
set linebreak
"잘린 줄임을 좌단에 표시
set showbreak=+++\

"자동완성을 좀 더 편리하게 확장
set wildmenu

"파일저장 인코딩 : utf-8, euc-kr
set fileencodings=utf-8,euc-kr
"한글 파일은 euc-kr, 유니코드는 유니코드
set fencs=ucs-bom,utf-8,euc-kr

"현재 사용하고 있는 파일이 외부에서 수정된 경우 자동으로 읽기
set autoread

"vim에서 기억할 히스토리 라인 수
set history=1000

set visualbell

"코멘트 하이라이트
highlight Comment term=bold cterm=bold ctermfg=4

"상태바 표시를 항상한다
set laststatus=2

" 문법 강조에 사용할 컬러테마 설정"
colorscheme vividchalk




if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim-plug
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

Plug 'raimondi/delimitmate'
Plug 'nathanaelkane/vim-indent-guides'	"indent guide

Plug 'tpope/vim-fugitive'				"git in vim
Plug 'airblade/vim-gitgutter'			"git check

Plug 'https://github.com/preservim/tagbar.git'

Plug 'neoclide/coc.nvim'

Plug 'SirVer/ultisnips'

call plug#end()


" Airline
" airline
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
" let g:airline_right_sep = ''
" let g:airline_left_sep = ''
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.spell = 'Ꞩ'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='luna'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_left_sep=''
"let g:airline_right_sep='<'
let g:airline_detect_crypt=1
let g:airline#extensions#tabline#fnamemod = ':t'

"let g:airline_mode_map = {
    "      \ '__' : '-',
    "      \ 'n'  : 'N',
    "      \ 'i'  : 'I',
    "      \ 'R'  : 'R',
    "      \ 'c'  : 'C',
    "      \ 'v'  : 'V',
    "      \ 'V'  : 'V',
    "      \ '^V' : 'V',
    "      \ 's'  : 'S',
    "      \ 'S'  : 'S',
    "      \ '^S' : 'S',
    "      \ }


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim indent guide
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd guibg=red ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1
let g:indent_guides_space_guides = 1
let g:indent_guides_tab_guides = 1
let g:indent_guides_enable_on_vim_startup = 1

" nerdcommenter
let g:NERDSpaceDelims = 2

" Tagbar

" KEY MAPPING
" <F1> 폴딩
"map <F1> v]}zf
map <F1> :tabnew<cr>
" <F2> 창이동
map <F2> <C-w><C-w>
" <F3> NERDTree
map <F3> :NERDTreeToggle<cr>
" <F4> Tlist
"map <F4> :Tlist<cr>
map <F4> :TagbarToggle<cr>

"파일 종류에 따른 구문 강조
filetype plugin indent on
