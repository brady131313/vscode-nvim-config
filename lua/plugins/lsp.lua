local servers = {
  lua_ls = {},
  rust_analyzer = {},
  -- elixirls = {
  --   cmd = { "elixir-ls" }
  -- },
  expert = {},
  vtsls = {},
  tailwindcss = {},
  cssls = {},
  html = {}
}

local server_names = {}
for key, _ in pairs(servers) do
  table.insert(server_names, key)
end

return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = server_names,
      automatic_enable = false
    },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      for server, config in pairs(servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble"
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false }
    }
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets", "fang2hou/blink-copilot" },
    version = "1.*",
    opts = {
      keymap = { preset = "enter" },
      appearance = {
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true
          }
        }
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require('lint')
      lint.linters_by_ft = {
        elixir = { "credo" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
      }
    end
  }
}
