vim.g.mapleader = " "
vim.g.maplocalleader = " "
 
local options = {
    clipboard = "unnamedplus",
}
 
for option, value in pairs(options) do
    vim.opt[option] = value
end
 
if vim.g.vscode then
    local vscode = require('vscode')
    local keymap = vim.keymap.set
 
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
else
 
end
