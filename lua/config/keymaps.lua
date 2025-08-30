local keymap = vim.keymap.set

if vim.g.vscode then
  local vscode = require('vscode')

  keymap('n', '<leader>ff', function()
    vscode.action('workbench.action.quickOpen')
  end, {})

  keymap('n', '<leader>x', function()
    vscode.action('workbench.action.closeActiveEditor')
  end, {})

  -- Better tab navigation
  keymap('n', 'H', function()
    vscode.call('workbench.action.previousEditorInGroup')
  end, {})

  keymap('n', 'L', function()
    vscode.call('workbench.action.nextEditorInGroup')
  end, {})

  -- Better window navigation
  keymap('n', '<C-j>', function()
    vscode.action('workbench.action.navigateDown')
  end, {})

  keymap('n', '<C-k>', function()
    vscode.action('workbench.action.navigateUp')
  end, {})

  keymap('n', '<C-h>', function()
    vscode.action('workbench.action.navigateLeft')
  end, {})

  keymap('n', '<C-l>', function()
    vscode.action('workbench.action.navigateRight')
  end, {})

  return
end


-- better up/down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- save file
keymap({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete buffer" })

-- terminal
keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Terminal (Root Dir)" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminal (Root Dir)" })

-- format
keymap("n", "<leader>fm", "<cmd>Format<cr>", { desc = "Format" })

-- diagnostics
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
keymap("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
keymap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Claude Code
keymap("n", "<leader>ai", "<cmd>ClaudeCode<CR>", { desc = "Claude Code" })
keymap("n", "<leader>ac", "<cmd>ClaudeCodeContinue<CR>", { desc = "Claude Code COntinue" })
