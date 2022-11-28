local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, 'typescript')
if not typescript_setup then
	return
end


local keymap = vim.keymap
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set('n', 'gf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
	keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', opts)
	keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	keymap.set('n', '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
	keymap.set('n', '<leader>rm', '<Cmd>Lspsaga rename<CR>', opts)
	keymap.set('n', '<leader>d', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
	keymap.set('n', '<leader>d', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
	keymap.set('n', '[d', '<Cmd>Lspsaga diagnostics_jump_prev<CR>', opts)
	keymap.set('n', ']d', '<Cmd>Lspsaga diagnostics_jump_next<CR>', opts)
	keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
	keymap.set('n', '<leader>o', '<Cmd>LSoutlineToggle<CR>', opts)

	if client.name == 'tsserver' then
		keymap.set('n', '<leader>rf', ':TypescriptRenameFile<CR>')	
	end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig['html'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	}
})

lspconfig['cssls'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig['tailwindcss'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig['sumneko_lua'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.stdpath('config') .. '/lua'] = true,
				}
			}
		}
	}
})
