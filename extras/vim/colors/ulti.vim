" ulti.vim -- generated from ulti-theme.el, do not edit by hand.
" Classic Vimscript (no vim9script)

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'ulti'

if exists('+termguicolors')
  set termguicolors
endif

" == ui ===========================

hi Normal       guifg=#c7cbe4 guibg=#131629 ctermfg=252 ctermbg=234
hi NonText      guifg=#515884 ctermfg=60
hi EndOfBuffer  guifg=#515884 ctermfg=60
hi SpecialKey   guifg=#202545 ctermfg=236
hi ColorColumn  guibg=#1a1e37 ctermbg=235
hi Cursor       guifg=#131629 guibg=#e3e5f1 ctermfg=234 ctermbg=254
hi CursorLine   guibg=#202545 ctermbg=236 cterm=NONE gui=NONE
hi CursorColumn guibg=#202545 ctermbg=236
hi CursorLineNr guifg=#e3e5f1 guibg=#202545 ctermfg=254 ctermbg=236
hi LineNr       guifg=#515884 ctermfg=60
hi MatchParen   guifg=#e3e5f1 guibg=#202545 gui=bold ctermfg=254 ctermbg=236 cterm=bold
hi SignColumn   guifg=#999fc0 ctermbg=109 guibg=#202545 ctermbg=236
hi FoldColumn   guifg=#3e4365 guibg=#1f2132 ctermfg=239 ctermbg=235
hi Folded       guifg=#999fc0 ctermfg=109 guibg=#202545 ctermbg=236
hi Conceal      guifg=#515884 ctermbg=60 guibg=#1a1e37 ctermbg=235
hi Visual       guibg=#84c9e0 guifg=#131629 ctermbg=116 ctermfg=234
hi Search       guifg=#131629 guibg=#a892dc ctermfg=234 ctermbg=140
hi IncSearch    guifg=#131629 guibg=#f286bc ctermfg=234 ctermbg=211
hi QuickFixLine guibg=#202545 ctermbg=236
hi WildMenu     guifg=#131629 guibg=#c7cbe4 ctermfg=234 ctermbg=252
hi StatusLine       term=bold cterm=bold guifg=#e3e5f1 guibg=#1a1e37 ctermfg=254 ctermbg=235
hi StatusLineNC     term=bold cterm=bold guifg=#515884 guibg=#131629 ctermfg=60 ctermbg=234
hi StatusLineTerm   term=bold cterm=bold ctermfg=234 guibg=#c5c95e ctermbg=185
hi StatusLineTermNC term=bold cterm=bold ctermfg=234 guibg=#d3d684 ctermbg=186
hi VertSplit        guifg=#1a1e37 guibg=#131629 ctermfg=235 ctermbg=234
hi TabLine          guifg=#515884 guibg=#1a1e37 ctermfg=60 ctermbg=235
hi TabLineSel       guifg=#e3e5f1 guibg=#202545 ctermfg=254 ctermbg=236
hi ToolbarLine      guibg=#3e4365 ctermbg=239
hi ToolbarButton    guibg=#999fc0 ctermbg=109
hi Pmenu        guifg=#c7cbe4 guibg=#1a1e37 ctermfg=252 ctermbg=235
hi PmenuSel     guifg=#131629 guibg=#f286bc ctermfg=234 ctermbg=211
hi PmenuSbar    guibg=#202545 ctermbg=236
hi PmenuThumb   guibg=#3e4365 ctermbg=239
hi ErrorMsg     guifg=#d4615d ctermfg=167 guibg=#131629 ctermfg=234
hi WarningMsg   guifg=#a892dc ctermfg=140
hi ModeMsg      guifg=#f286bc ctermfg=211
hi MoreMsg      guifg=#84c9e0 ctermfg=116
hi Question     guifg=#f286bc ctermfg=211
hi Directory    guifg=#f286bc ctermfg=211

" == syntax =======================

hi Comment      guifg=#999fc0 gui=italic ctermfg=109 cterm=italic
hi Constant     guifg=#a892dc ctermfg=140
hi String       guifg=#c5c95e ctermfg=185
hi Identifier   guifg=#84c9e0 ctermfg=116
hi Function     guifg=#f286bc ctermfg=211
hi Statement    guifg=#5692e5 gui=bold ctermfg=68 cterm=bold
hi PreProc      guifg=#5692e5 ctermfg=68
hi Type         guifg=#a892dc ctermfg=140
hi Special      guifg=#f286bc ctermfg=211
hi Underlined   guifg=#f286bc gui=underline ctermfg=211 cterm=underline
hi Title        guifg=#84c9e0 gui=bold cterm=bold term=bold ctermfg=116
hi Todo         guifg=#131629 guibg=#a892dc ctermfg=234 ctermbg=140
hi Error        guifg=#e3e5f1 guibg=#d4615d ctermfg=254 ctermbg=167

" == diff =========================

hi DiffAdd      guibg=#c5c95e ctermbg=185 guifg=#131629 ctermfg=234
hi DiffChange   guibg=#a892dc ctermbg=140 guifg=#131629 ctermfg=234
hi DiffDelete   guibg=#d4615d ctermbg=167 guifg=#131629 ctermfg=234
hi DiffText     guibg=#f286bc ctermbg=211 guifg=#131629 ctermfg=234

" == spell ========================

hi SpellBad     guifg=#d4615d ctermfg=167 gui=underline
hi SpellCap     guifg=#a892dc ctermfg=140 gui=underline
hi SpellLocal   guifg=#c5c95e ctermfg=185 gui=underline
hi SpellRare    guifg=#f286bc ctermfg=211 gui=underline

" == term =========================

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
