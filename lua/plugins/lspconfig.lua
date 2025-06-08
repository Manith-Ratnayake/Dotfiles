return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
	automatic_enable = { "lua_ls", "vimls" } 
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")
      lspconfig.lua_ls.setup({

	single_file_support = true,
	root_dir = function(name) 
		return util.root_pattern(".git", ".luarc.json", ".luarc.jsonc")(name)
			or util.path.dirname(name)
	end,
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
				library = {},
			       },
			telemetry = {enable = false}
		},
	},
	})



      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end,
  },
}

