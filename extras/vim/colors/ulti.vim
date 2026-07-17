" ulti.vim -- generated from ulti-theme.el, do not edit by hand.
" Classic Vimscript (no vim9script)

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'ulti'

if has('termguicolors')
  set termguicolors
endif

" --- core editor ---------------------------------------------------------
hi Normal       guifg=#c7cbe4 guibg=#131629 ctermfg=252 ctermbg=234
hi NonText      guifg=#515884 ctermfg=60
hi ColorColumn  guibg=#1a1e37 ctermbg=235
hi Cursor       guifg=#131629 guibg=#e3e5f1 ctermfg=234 ctermbg=254
hi CursorLine   guibg=#202545 ctermbg=236 cterm=NONE gui=NONE
hi CursorLineNr guifg=#e3e5f1 guibg=#202545 ctermfg=254 ctermbg=236
hi LineNr       guifg=#515884 ctermfg=60
hi Visual       guibg=#84c9e0 guifg=#131629 ctermbg=116 ctermfg=234
hi Search       guifg=#131629 guibg=#a892dc ctermfg=234 ctermbg=140
hi IncSearch    guifg=#131629 guibg=#f286bc ctermfg=234 ctermbg=211
hi MatchParen   guifg=#e3e5f1 guibg=#202545 gui=bold ctermfg=254 ctermbg=236 cterm=bold

hi StatusLine   guifg=#e3e5f1 guibg=#1a1e37 ctermfg=254 ctermbg=235
hi StatusLineNC guifg=#515884 guibg=#1a1e37 ctermfg=60 ctermbg=235
hi VertSplit    guifg=#1a1e37 guibg=#131629 ctermfg=235 ctermbg=234
hi TabLine      guifg=#515884 guibg=#1a1e37 ctermfg=60 ctermbg=235
hi TabLineSel   guifg=#e3e5f1 guibg=#202545 ctermfg=254 ctermbg=236
hi Pmenu        guifg=#c7cbe4 guibg=#1a1e37 ctermfg=252 ctermbg=235
hi PmenuSel     guifg=#131629 guibg=#f286bc ctermfg=234 ctermbg=211

" --- syntax ----------------------------------------------------------------
hi Comment      guifg=#999fc0 gui=italic ctermfg=109 cterm=italic
hi Constant     guifg=#a892dc ctermfg=140
hi String       guifg=#c5c95e ctermfg=185
hi Identifier   guifg=#84c9e0 ctermfg=116
hi Function     guifg=#f286bc ctermfg=211
hi Statement    guifg=#5692e5 gui=bold ctermfg=68 cterm=bold
hi PreProc      guifg=#5692e5 ctermfg=68
hi Type         guifg=#d4615d ctermfg=167
hi Special      guifg=#f286bc ctermfg=211
hi Underlined   guifg=#f286bc gui=underline ctermfg=211 cterm=underline
hi Error        guifg=#e3e5f1 guibg=#d4615d ctermfg=254 ctermbg=167
hi Todo         guifg=#131629 guibg=#a892dc ctermfg=234 ctermbg=140

hi DiffAdd      guibg=#c5c95e ctermbg=185
hi DiffChange   guibg=#a892dc ctermbg=140
hi DiffDelete   guibg=#d4615d ctermbg=167
hi DiffText     guibg=#f286bc ctermbg=211

" --- :terminal -------------------------------------------------------------
let g:terminal_ansi_colors = [
      \ '#1f2132', '#d4615d', '#c5c95e', '#a892dc',
      \ '#f286bc', '#5692e5', '#84c9e0', '#c7cbe4',
      \ '#2e324b', '#de8986', '#d3d684', '#c7b9e8',
      \ '#f7b5d6', '#82aeec', '#addbea', '#e3e5f1'
      \ ]

let g:terminal_color_0  = '#1f2132'
let g:terminal_color_1  = '#d4615d'
let g:terminal_color_2  = '#c5c95e'
let g:terminal_color_3  = '#a892dc'
let g:terminal_color_4  = '#f286bc'
let g:terminal_color_5  = '#5692e5'
let g:terminal_color_6  = '#84c9e0'
let g:terminal_color_7  = '#c7cbe4'
let g:terminal_color_8  = '#2e324b'
let g:terminal_color_9  = '#de8986'
let g:terminal_color_10 = '#d3d684'
let g:terminal_color_11 = '#c7b9e8'
let g:terminal_color_12 = '#f7b5d6'
let g:terminal_color_13 = '#82aeec'
let g:terminal_color_14 = '#addbea'
let g:terminal_color_15 = '#e3e5f1'
