return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priorty = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight-night")
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      float_opts = {
        height = 30
      }
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        theme = "tokyonight"
      }
    },
  },
  {
    "max397574/better-escape.nvim",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "RRethy/nvim-treesitter-endwise",
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
    }
  },
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      window = {
        position = "float",
        width = "80%",
        height = "70%",
        row = "center",
        col = "center",
        relative = "editor",
        border = "double"
      },
      keymaps = {
        toggle = {
          normal = false,
          terminal = false,
          variants = false
        },
        window_navigation = false,
        scrolling = false
      }
    }
  }
}
