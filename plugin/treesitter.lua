require('nvim-treesitter.configs').setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "lua", "vim", "vimdoc", "go" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- 启用高亮
	highlight = {
		enable = true,
		disable = { "help" },
		-- 禁用 vim 基于正则达式的语法高亮，太慢
		additional_vim_regex_highlighting = false,
	},
	-- 启用缩进
	indent = {
		enable = true,
	},
}
