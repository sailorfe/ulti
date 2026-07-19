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

hi Normal       guifg={{text}} guibg={{base}} ctermfg={{text-cterm}} ctermbg={{base-cterm}}
hi NonText      guifg={{muted}} ctermfg={{muted-cterm}}
hi EndOfBuffer  guifg={{muted}} ctermfg={{muted-cterm}}
hi SpecialKey   guifg={{overlay}} ctermfg={{overlay-cterm}}
hi ColorColumn  guibg={{surface}} ctermbg={{surface-cterm}}
hi Cursor       guifg={{base}} guibg={{light}} ctermfg={{base-cterm}} ctermbg={{light-cterm}}
hi CursorLine   guibg={{overlay}} ctermbg={{overlay-cterm}} cterm=NONE gui=NONE
hi CursorColumn guibg={{overlay}} ctermbg={{overlay-cterm}}
hi CursorLineNr guifg={{light}} guibg={{overlay}} ctermfg={{light-cterm}} ctermbg={{overlay-cterm}}
hi LineNr       guifg={{muted}} ctermfg={{muted-cterm}}
hi MatchParen   guifg={{light}} guibg={{overlay}} gui=bold ctermfg={{light-cterm}} ctermbg={{overlay-cterm}} cterm=bold
hi SignColumn   guifg={{faint}} ctermbg={{faint-cterm}} guibg={{overlay}} ctermbg={{overlay-cterm}}
hi FoldColumn   guifg={{high}} guibg={{low}} ctermfg={{high-cterm}} ctermbg={{low-cterm}}
hi Folded       guifg={{faint}} ctermfg={{faint-cterm}} guibg={{overlay}} ctermbg={{overlay-cterm}}
hi Conceal      guifg={{muted}} ctermbg={{muted-cterm}} guibg={{surface}} ctermbg={{surface-cterm}}
hi Visual       guibg={{blackmaria}} guifg={{base}} ctermbg={{blackmaria-cterm}} ctermfg={{base-cterm}}
hi Search       guifg={{base}} guibg={{pageone}} ctermfg={{base-cterm}} ctermbg={{pageone-cterm}}
hi IncSearch    guifg={{base}} guibg={{ulti}} ctermfg={{base-cterm}} ctermbg={{ulti-cterm}}
hi QuickFixLine guibg={{overlay}} ctermbg={{overlay-cterm}}
hi WildMenu     guifg={{base}} guibg={{text}} ctermfg={{base-cterm}} ctermbg={{text-cterm}}
hi StatusLine       term=bold cterm=bold guifg={{light}} guibg={{surface}} ctermfg={{light-cterm}} ctermbg={{surface-cterm}}
hi StatusLineNC     term=bold cterm=bold guifg={{muted}} guibg={{base}} ctermfg={{muted-cterm}} ctermbg={{base-cterm}}
hi StatusLineTerm   term=bold cterm=bold ctermfg={{base-cterm}} guibg={{sasaki}} ctermbg={{sasaki-cterm}}
hi StatusLineTermNC term=bold cterm=bold ctermfg={{base-cterm}} guibg={{triceratops}} ctermbg={{triceratops-cterm}}
hi VertSplit        guifg={{surface}} guibg={{base}} ctermfg={{surface-cterm}} ctermbg={{base-cterm}}
hi TabLine          guifg={{muted}} guibg={{surface}} ctermfg={{muted-cterm}} ctermbg={{surface-cterm}}
hi TabLineSel       guifg={{light}} guibg={{overlay}} ctermfg={{light-cterm}} ctermbg={{overlay-cterm}}
hi ToolbarLine      guibg={{high}} ctermbg={{high-cterm}}
hi ToolbarButton    guibg={{faint}} ctermbg={{faint-cterm}}
hi Pmenu        guifg={{text}} guibg={{surface}} ctermfg={{text-cterm}} ctermbg={{surface-cterm}}
hi PmenuSel     guifg={{base}} guibg={{ulti}} ctermfg={{base-cterm}} ctermbg={{ulti-cterm}}
hi PmenuSbar    guibg={{overlay}} ctermbg={{overlay-cterm}}
hi PmenuThumb   guibg={{high}} ctermbg={{high-cterm}}
hi ErrorMsg     guifg={{whoswho}} ctermfg={{whoswho-cterm}} guibg={{base}} ctermfg={{base-cterm}}
hi WarningMsg   guifg={{pageone}} ctermfg={{pageone-cterm}}
hi ModeMsg      guifg={{ulti}} ctermfg={{ulti-cterm}}
hi MoreMsg      guifg={{blackmaria}} ctermfg={{blackmaria-cterm}}
hi Question     guifg={{ulti}} ctermfg={{ulti-cterm}}
hi Directory    guifg={{ulti}} ctermfg={{ulti-cterm}}

" == syntax =======================

hi Comment      guifg={{faint}} gui=italic ctermfg={{faint-cterm}} cterm=italic
hi Constant     guifg={{pageone}} ctermfg={{pageone-cterm}}
hi String       guifg={{sasaki}} ctermfg={{sasaki-cterm}}
hi Identifier   guifg={{blackmaria}} ctermfg={{blackmaria-cterm}}
hi Function     guifg={{ulti}} ctermfg={{ulti-cterm}}
hi Statement    guifg={{drake}} gui=bold ctermfg={{drake-cterm}} cterm=bold
hi PreProc      guifg={{drake}} ctermfg={{drake-cterm}}
hi Type         guifg={{pageone}} ctermfg={{pageone-cterm}}
hi Special      guifg={{ulti}} ctermfg={{ulti-cterm}}
hi Underlined   guifg={{ulti}} gui=underline ctermfg={{ulti-cterm}} cterm=underline
hi Title        guifg={{blackmaria}} gui=bold cterm=bold term=bold ctermfg={{blackmaria-cterm}}
hi Todo         guifg={{base}} guibg={{pageone}} ctermfg={{base-cterm}} ctermbg={{pageone-cterm}}
hi Error        guifg={{light}} guibg={{whoswho}} ctermfg={{light-cterm}} ctermbg={{whoswho-cterm}}

" == diff =========================

hi DiffAdd      guibg={{sasaki}} ctermbg={{sasaki-cterm}} guifg={{base}} ctermfg={{base-cterm}}
hi DiffChange   guibg={{pageone}} ctermbg={{pageone-cterm}} guifg={{base}} ctermfg={{base-cterm}}
hi DiffDelete   guibg={{whoswho}} ctermbg={{whoswho-cterm}} guifg={{base}} ctermfg={{base-cterm}}
hi DiffText     guibg={{ulti}} ctermbg={{ulti-cterm}} guifg={{base}} ctermfg={{base-cterm}}

" == spell ========================

hi SpellBad     guifg={{whoswho}} ctermfg={{whoswho-cterm}} gui=underline
hi SpellCap     guifg={{pageone}} ctermfg={{pageone-cterm}} gui=underline
hi SpellLocal   guifg={{sasaki}} ctermfg={{sasaki-cterm}} gui=underline
hi SpellRare    guifg={{ulti}} ctermfg={{ulti-cterm}} gui=underline

" == term =========================

let g:terminal_ansi_colors = [
      \ '{{low}}', '{{whoswho}}', '{{sasaki}}', '{{pageone}}',
      \ '{{ulti}}', '{{drake}}', '{{blackmaria}}', '{{text}}',
      \ '{{med}}', '{{sabretooth}}', '{{triceratops}}', '{{spinosaurus}}',
      \ '{{pachycephalos}}', '{{allosaurus}}', '{{rosamygale}}', '{{light}}'
      \ ]

let g:terminal_color_0  = '{{low}}'
let g:terminal_color_1  = '{{whoswho}}'
let g:terminal_color_2  = '{{sasaki}}'
let g:terminal_color_3  = '{{pageone}}'
let g:terminal_color_4  = '{{ulti}}'
let g:terminal_color_5  = '{{drake}}'
let g:terminal_color_6  = '{{blackmaria}}'
let g:terminal_color_7  = '{{text}}'
let g:terminal_color_8  = '{{med}}'
let g:terminal_color_9  = '{{sabretooth}}'
let g:terminal_color_10 = '{{triceratops}}'
let g:terminal_color_11 = '{{spinosaurus}}'
let g:terminal_color_12 = '{{pachycephalos}}'
let g:terminal_color_13 = '{{allosaurus}}'
let g:terminal_color_14 = '{{rosamygale}}'
let g:terminal_color_15 = '{{light}}'
