local colors = {
	base = "#131629",
	surface = "#1a1e37",
	overlay = "#202545",
	muted = "#515884",
	faint = "#999fc0",
	text = "#c7cbe4",
	light = "#e3e5f1",
	whoswho = "#d4615d",
	sasaki = "#c5c95e",
	pageone = "#8861e5",
	ulti = "#f286bc",
	drake = "#5692e5",
	blackmaria = "#84c9e0",
	sabretooth = "#de8986",
	triceratops = "#d3d684",
	spinosaurus = "#a98cec",
	pachycephalos = "#f7b5d6",
	allosaurus = "#82aeec",
	rosamygale = "#addbea",
	low = "#1f2132",
	med = "#2e324b",
	high = "#3e4365",
}

local highlights = {
	-- ui
	Normal = { bg = colors.base, fg = colors.text },
	NormalFloat = { bg = colors.surface, fg = colors.text },
	NormalNC = { bg = colors.base, fg = colors.faint },

	FloatBorder = { bg = colors.surface, fg = colors.muted },
	FloatTitle = { bg = colors.surface, fg = colors.blackmaria, bold = true },
	FloatFooter = { link = "FloatBorder" },

	ColorColumn = { bg = colors.surface },
	Conceal = { fg = colors.muted },
	CursorLine = { bg = colors.overlay },
	CursorColumn = { bg = colors.overlay },
	CursorLineNr = { fg = colors.text, bold = true },
	LineNr = { fg = colors.muted },
	LineNrAbove = { link = "LineNr" },
	LineNrBelow = { link = "LineNr" },

	SignColumn = { bg = colors.base },
	FoldColumn = { fg = colors.high, bg = colors.surface },
	Folded = { bg = colors.low, fg = colors.faint },

	StatusLine = { bg = colors.overlay, fg = colors.text },
	StatusLineNC = { bg = colors.surface, fg = colors.muted },
	WinBar = { bg = colors.med, fg = colors.faint },
	WinBarNC = { bg = colors.med, fg = colors.muted },
	WinSeparator = { fg = colors.surface }, -- 0.9+
	VertSplit = { fg = colors.surface }, -- for compatibility

	TabLine = { bg = colors.surface, fg = colors.muted },
	TabLineFill = { bg = colors.base },
	TabLineSel = { bg = colors.overlay, fg = colors.blackmaria, bold = true },

	Pmenu = { bg = colors.surface, fg = colors.text },
	PmenuSel = { bg = colors.overlay, fg = colors.blackmaria, bold = true },
	PmenuKind = { bg = colors.surface, fg = colors.drake },
	PmenuKindSel = { bg = colors.overlay, fg = colors.drake, bold = true },
	PmenuExtra = { bg = colors.surface, fg = colors.muted },
	PmenuExtraSel = { bg = colors.overlay, fg = colors.faint },
	PmenuSbar = { bg = colors.overlay },
	PmenuThumb = { bg = colors.high },
	PmenuMatch = { fg = colors.blackmaria, bold = true }, -- 0.11 fuzzy match
	PmenuMatchSel = { fg = colors.blackmaria, bold = true, underline = true },

	MsgArea = { fg = colors.text },
	MsgSeparator = { fg = colors.overlay },
	ModeMsg = { fg = colors.text, bold = true },
	MoreMsg = { fg = colors.sasaki },
	Question = { fg = colors.ulti },
	WarningMsg = { fg = colors.pageone },
	ErrorMsg = { fg = colors.whoswho, bold = true },

	Cursor = { bg = colors.text, fg = colors.base },
	lCursor = { link = "Cursor" },
	CursorIM = { link = "Cursor" },
	TermCursor = { bg = colors.blackmaria, fg = colors.base },
	TermCursorNC = { bg = colors.faint, fg = colors.base },

	Visual = { bg = colors.blackmaria, fg = colors.base },
	VisualNOS = { link = "Visual" },
	CurSearch = { bg = colors.pageone, fg = colors.base },
	IncSearch = { link = "CurSearch" },
	Search = { bg = colors.med, fg = colors.pageone },
	Substitute = { bg = colors.ulti, fg = colors.base },

	MatchParen = { bg = colors.high, bold = true },

	NonText = { fg = colors.muted },
	Whitespace = { fg = colors.overlay },
	SpecialKey = { fg = colors.muted },
	EndOfBuffer = { fg = colors.muted },

	Directory = { fg = colors.ulti },
	Title = { fg = colors.blackmaria, bold = true },
	WildMenu = { bg = colors.text, fg = colors.base },

	QuickFixLine = { bg = colors.overlay, bold = true },

	-- diffs
	DiffAdd = { bg = colors.sasaki, fg = colors.base },
	DiffChange = { bg = colors.blackmaria, fg = colors.base },
	DiffDelete = { fg = colors.whoswho, bold = true },
	DiffText = { bg = colors.ulti, fg = colors.base },

	-- spell
	SpellBad = { fg = colors.whoswho, undercurl = true },
	SpellCap = { fg = colors.pageone, undercurl = true },
	SpellLocal = { fg = colors.sasaki, undercurl = true },
	SpellRare = { fg = colors.ulti, undercurl = true },

	-- misc
	Underlined = { underline = true },
	Ignore = { fg = colors.muted },
	Error = { bg = colors.whoswho, fg = colors.light },
	Todo = { fg = colors.pageone, bold = true },

	-- traditional syntax
	Comment = { fg = colors.faint, italic = true },

	Constant = { fg = colors.pageone },
	String = { fg = colors.sasaki },
	Character = { link = "Constant" },
	Number = { link = "Constant" },
	Boolean = { link = "Constant" },
	Float = { link = "Constant" },

	Identifier = { fg = colors.drake },
	Function = { fg = colors.blackmaria },

	Statement = { fg = colors.ulti, bold = true },
	Conditional = { link = "Statement" },
	Repeat = { link = "Statement" },
	Label = { link = "Statement" },
	Operator = { fg = colors.text },
	Keyword = { link = "Statement" }, -- maybe change
	Exception = { link = "Statement" },

	PreProc = { fg = colors.ulti },
	Include = { link = "PreProc" },
	Define = { link = "PreProc" },
	Macro = { link = "PreProc" },
	PreCondit = { link = "PreProc" },

	Type = { fg = colors.sasaki },
	StorageClass = { link = "Type" },
	Structure = { link = "Type" },
	Typedef = { fg = colors.sasaki, italic = true },

	Special = { fg = colors.drake },
	SpecialChar = { link = "Special" },
	Tag = { link = "Special" },
	Delimiter = { fg = colors.text },
	SpecialComment = { fg = colors.faint, bold = true },
	Debug = { link = "Special" },

	-- diagonistics
	DiagnosticError = { fg = colors.whoswho },
	DiagnosticWarn = { fg = colors.pageone },
	DiagnosticInfo = { fg = colors.ulti },
	DiagnosticHint = { fg = colors.blackmaria },
	DiagnosticOk = { fg = colors.sasaki },

	DiagnosticVirtualTextError = { fg = colors.whoswho, italic = true },
	DiagnosticVirtualTextWarn = { fg = colors.pageone, italic = true },
	DiagnosticVirtualTextInfo = { fg = colors.ulti, italic = true },
	DiagnosticVirtualTextHint = { fg = colors.blackmaria, italic = true },
	DiagnosticVirtualTextOk = { fg = colors.sasaki, italic = true },

	DiagnosticUnderlineError = { fg = colors.whoswho, undercurl = true },
	DiagnosticUnderlineWarn = { fg = colors.pageone, undercurl = true },
	DiagnosticUnderlineInfo = { fg = colors.ulti, undercurl = true },
	DiagnosticUnderlineHint = { fg = colors.blackmaria, undercurl = true },
	DiagnosticUnderlineOk = { fg = colors.sasaki, undercurl = true },

	DiagnosticFloatingError = { link = "DiagnosticError" },
	DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
	DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
	DiagnosticFloatingHint = { link = "DiagnosticHint" },
	DiagnosticFloatingOk = { link = "DiagnosticOk" },

	DiagnosticSignError = { link = "DiagnosticError" },
	DiagnosticSignWarn = { link = "DiagnosticWarn" },
	DiagnosticSignInfo = { link = "DiagnosticInfo" },
	DiagnosticSignHint = { link = "DiagnosticHint" },
	DiagnosticSignOk = { link = "DiagnosticOk" },
	DiagnosticDeprecated = { strikethrough = true, fg = colors.muted },

	-- treesitter

	-- identifiers
	["@variable"] = { fg = colors.text, italic = true },
	["@variable.builtin"] = { fg = colors.blackmaria, bold = true, italic = true },
	["@variable.parameter"] = { link = "Type" }, -- (injected_functions)
	["@variable.member"] = { fg = colors.text }, -- struct fields, object keys

	["@constant"] = { link = "Constant" },
	["@constant.builtin"] = { fg = colors.sasaki, bold = true, italic = true },
	["@constant.macro"] = { link = "Define" },

	["@module"] = { fg = colors.pageone },
	["@module.builtin"] = { fg = colors.pageone, bold = true, italic = true },
	["@label"] = { fg = colors.ulti },

	-- literals
	["@string"] = { link = "String" },
	["@string.escape"] = { fg = colors.blackmaria },
	["@string.special"] = { fg = colors.blackmaria },
	["@string.regexp"] = { fg = colors.pageone },
	["@string.special.url"] = { fg = colors.ulti, underline = true },

	["@character"] = { link = "Character" },
	["@character.special"] = { link = "SpecialChar" },
	["@boolean"] = { link = "Boolean" },
	["@number"] = { link = "Number" },
	["@number.float"] = { link = "Float" },

	-- types
	["@type"] = { link = "Type" },
	["@type.builtin"] = { fg = colors.sasaki, bold = true, italic = true },
	["@type.definition"] = { link = "Typedef" },

	-- functions
	["@function"] = { link = "Function" },
	["@function.builtin"] = { fg = colors.drake, bold = true, italic = true },
	["@function.macro"] = { link = "Macro" },
	["@function.method"] = { link = "Function" },
	["@constructor"] = { fg = colors.blackmaria },

	-- keywords
	["@keyword"] = { link = "Keyword" },
	["@keyword.function"] = { fg = colors.ulti, italic = true },
	["@keyword.operator"] = { fg = colors.ulti },
	["@keyword.import"] = { link = "Include" },
	["@keyword.repeat"] = { link = "Repeat" },
	["@keyword.return"] = { fg = colors.whoswho, italic = true },
	["@keyword.exception"] = { link = "Exception" },
	["@keyword.conditional"] = { link = "Conditional" },
	["@keyword.directive"] = { link = "PreProc" },

	-- punctuation
	["@punctuation.delimiter"] = { fg = colors.muted },
	["@punctuation.bracket"] = { fg = colors.text },
	["@punctuation.special"] = { fg = colors.blackmaria },

	-- comments
	["@comment"] = { link = "Comment" },
	["@comment.documentation"] = { fg = colors.faint, italic = true },
	["@comment.error"] = { fg = colors.whoswho, bold = true },
	["@comment.warning"] = { fg = colors.pageone, bold = true },
	["@comment.todo"] = { fg = colors.pageone, bold = true },
	["@comment.note"] = { fg = colors.ulti, bold = true },

	-- markup (markdown, rst, etc.)
	["@markup.raw"] = { fg = colors.sasaki },
	["@markup.raw.block"] = { fg = colors.sasaki },
	["@markup.link"] = { fg = colors.ulti, underline = true },
	["@markup.link.url"] = { fg = colors.ulti, underline = true, italic = true },
	["@markup.link.label"] = { fg = colors.blackmaria },
	["@markup.list"] = { fg = colors.pageone },
	["@markup.heading"] = { fg = colors.blackmaria, bold = true },
	["@markup.heading.1"] = { fg = colors.blackmaria, bold = true },
	["@markup.heading.2"] = { fg = colors.pageone, bold = true },
	["@markup.heading.3"] = { fg = colors.sasaki, bold = true },
	["@markup.heading.4"] = { fg = colors.drake, bold = true },
	["@markup.heading.5"] = { fg = colors.ulti, bold = true },
	["@markup.heading.6"] = { fg = colors.whoswho, bold = true },
	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.strikethrough"] = { strikethrough = true, fg = colors.muted },
	["@markup.quote"] = { fg = colors.faint, italic = true },

	-- misc TS
	["@operator"] = { link = "Operator" },
	["@attribute"] = { fg = colors.pageone },
	["@attribute.builtin"] = { fg = colors.pageone, bold = true, italic = true },
	["@property"] = { fg = colors.blackmaria, italic = true }, -- would love to change this
	["@tag"] = { fg = colors.ulti },
	["@tag.builtin"] = { fg = colors.ulti, bold = true, italic = true },
	["@tag.attribute"] = { fg = colors.pageone },
	["@tag.delimiter"] = { fg = colors.muted },

	["@diff.plus"] = { fg = colors.sasaki },
	["@diff.minus"] = { fg = colors.whoswho },
	["@diff.delta"] = { fg = colors.ulti },

	-- LSP semantic tokens (0.9+)
	["@lsp.type.class"] = { link = "Type" },
	["@lsp.type.decorator"] = { fg = colors.pageone },
	["@lsp.type.enum"] = { link = "Type" },
	["@lsp.type.enumMember"] = { link = "Constant" },
	["@lsp.type.function"] = { link = "Function" },
	["@lsp.type.interface"] = { link = "Typedef" },
	["@lsp.type.macro"] = { link = "Macro" },
	["@lsp.type.method"] = { link = "Function" },
	["@lsp.type.namespace"] = { fg = colors.text, italic = true },
	["@lsp.type.parameter"] = { fg = colors.drake, italic = true },
	["@lsp.type.property"] = { fg = colors.text },
	["@lsp.type.struct"] = { link = "Structure" },
	["@lsp.type.type"] = { link = "Type" },
	["@lsp.type.typeParameter"] = { link = "Typedef" },
	["@lsp.type.variable"] = { fg = colors.text },
	["@lsp.type.keyword"] = { link = "Keyword" },
	["@lsp.type.comment"] = { link = "Comment" },
	["@lsp.type.string"] = { link = "String" },
	["@lsp.type.number"] = { link = "Number" },
	["@lsp.type.operator"] = { link = "Operator" },

	["@lsp.mod.deprecated"] = { strikethrough = true, fg = colors.muted },
	["@lsp.mod.readonly"] = { italic = true },
	["@lsp.mod.defaultLibrary"] = { italic = true },

	-- markdown
	markdownH1 = { fg = colors.blackmaria, bold = true },
	markdownH2 = { fg = colors.pageone, bold = true },
	markdownH3 = { fg = colors.sasaki, bold = true },
	markdownH4 = { fg = colors.drake, bold = true },
	markdownH5 = { fg = colors.ulti, bold = true },
	markdownH6 = { fg = colors.whoswho, bold = true },
	markdownH1Delimiter = { link = "markdownH1" },
	markdownH2Delimiter = { link = "markdownH2" },
	markdownH3Delimiter = { link = "markdownH3" },
	markdownH4Delimiter = { link = "markdownH4" },
	markdownH5Delimiter = { link = "markdownH5" },
	markdownH6Delimiter = { link = "markdownH6" },

	-- plugins
	GitSignsAdd = { link = "@diff.plus" },
	GitSignsChange = { link = "@diff.delta" },
	GitSignsDelete = { link = "@diff.minus" },

	RenderMarkdownH1Bg = { link = "@markup.heading.1" },
	RenderMarkdownH2Bg = { link = "@markup.heading.2" },
	RenderMarkdownH3Bg = { link = "@markup.heading.3" },
	RenderMarkdownH4Bg = { link = "@markup.heading.4" },
	RenderMarkdownH5Bg = { link = "@markup.heading.5" },
	RenderMarkdownH6Bg = { link = "@markup.heading.6" },

	MiniDiffSignAdd = { fg = colors.sasaki, italic = true },
	MiniDiffSignChange = { fg = colors.ulti, italic = true },
	MiniDiffSignDelete = { fg = colors.whoswho, italic = true },
	MiniStatuslineModeNormal = { bg = colors.high, fg = colors.text, bold = true },
	MiniStatuslineModeInsert = { bg = colors.text, fg = colors.base, bold = true },
	MiniStatuslineModeVisual = { bg = colors.blackmaria, fg = colors.base, bold = true },
	MiniStatuslineModeReplace = { bg = colors.whoswho, fg = colors.base, bold = true },
	MiniStatuslineModeCommand = { bg = colors.ulti, fg = colors.base, bold = true },
	MiniStatuslineModeOther = { bg = colors.sasaki, fg = colors.base, bold = true },
	MiniStatuslineDevinfo = { bg = colors.overlay, fg = colors.text },
	MiniStatuslineFilename = { bg = colors.surface, fg = colors.faint },
	MiniStatuslineFileinfo = { link = "MiniStatuslineDevinfo" },
	MiniStatuslineInactive = { bg = colors.base, fg = colors.muted },
	MiniTablineCurrent = { link = "TabLineSel" },
	MiniTablineVisible = { fg = colors.pageone, bg = colors.surface },
	MiniTablineHidden = { link = "TabLine" },

	TroubleIndent = { bg = colors.surface, fg = colors.faint },
	TroublePos = { bg = colors.surface, fg = colors.faint },

	IblIndent = { fg = colors.med },
	IblScope = { link = "Function" },
	IblWhitespace = { link = "Whitespace" },
}

local U = {}

U.setup = function(opts)
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "ulti"

	for group, opts_tbl in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts_tbl)
	end
end

return U
