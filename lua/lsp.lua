-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }

		-- these will be buffer-local keybindings
		-- because they only work if you have an active language server
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
		vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local default_setup = function(server)
	require('lspconfig')[server].setup({
		capabilities = lsp_capabilities,
	})
end

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		default_setup,
	},
})

local cmp = require('cmp')
cmp.setup({
	-- 补全源配置
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
	}, {
		{ name = 'buffer' },
	}),
	-- 按键映射
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item() -- 如果补全菜单可见，选择下一个候选项
			else
				fallback() -- 如果没有候选项，执行默认的 Tab 行为
			end
		end, { 'i', 's' }), -- 在插入模式 (i) 和选择模式 (s) 下生效

		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item() -- Shift+Tab 选择上一个候选项
			else
				fallback() -- 如果没有候选项，执行默认的 Shift+Tab 行为
			end
		end, { 'i', 's' }), -- 在插入模式 (i) 和选择模式 (s) 下生效
	}),
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- 为搜索命令（/ 和 ?）启用缓冲区内容补全
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- 为命令行模式（:）启用路径和命令补全
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

-- 保存时自动格式化
vim.api.nvim_create_augroup("LspFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "LspFormatting",
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
})

-- 突出光标所在的符号
-- 创建一个组来管理 LSP 相关的自动命令，避免重复定义
local lsp_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })

-- 在普通模式下，当光标停留时，高亮当前光标下的符号
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	group = lsp_group,
	buffer = 0, -- 当前缓冲区
	callback = function()
		vim.lsp.buf.document_highlight()
	end,
})

-- 在插入模式下，当光标停留时，高亮当前光标下的符号
vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
	group = lsp_group,
	buffer = 0, -- 当前缓冲区
	callback = function()
		vim.lsp.buf.document_highlight()
	end,
})

-- 当光标移动时，清除高亮
vim.api.nvim_create_autocmd({ "CursorMoved" }, {
	group = lsp_group,
	buffer = 0, -- 当前缓冲区
	callback = function()
		vim.lsp.buf.clear_references()
	end,
})
