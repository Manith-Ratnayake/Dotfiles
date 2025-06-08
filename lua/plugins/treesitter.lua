return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" ,

  config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({ensure_installed = 
                          {"lua", "python", "javascript", "typescript", "r", "html", "css", "c", "bash",
                           "cmake","dockerfile", "java", "json", "powershell", "cpp", "awk"},

                      highlight = {enable = True},
                      indent = { enable = True}, 
        })
  end 
}



