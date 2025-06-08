return {
    
    "https://github.com/nvimtools/none-ls.nvim",

    config = function()
	null_ls.setup({
	    sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
	    },
	})
	vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end,
}
