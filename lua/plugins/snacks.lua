return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    explorer = {
    },
    picker = {
      sources = {
        explorer = {
        }
      },
    },
    statuscolumn = {},
  },
  keys = {
    { "<leader>e",  function() Snacks.explorer() end,             desc = "File Explorer" },
    -- find
    { "<leader>ff", function() Snacks.picker.files() end,         desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end,     desc = "Find Git Files" },
    { "<leader>fb", function() Snacks.picker.buffers() end,       desc = "Buffers" },
    { "<leader>fw", function() Snacks.picker.grep() end,          desc = "Grep" },
    { "<leader>fr", function() Snacks.picker.recent() end,        desc = "Recent" },
    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end,  desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end,       desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end,    desc = "Git Status" },
    -- search
    { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
    { "<leader>sh", function() Snacks.picker.help() end,          desc = "Help Pages" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,       desc = "Keymaps" },
    -- LSP
    -- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    -- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    -- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    -- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    -- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    -- { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    -- { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  }
}
