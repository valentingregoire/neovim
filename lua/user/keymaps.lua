-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

-- generates options for keymaps
function getOptions(desc)
    return {
        noremap = true,
        silent = true,
        desc = desc
    }
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader
keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", getOptions("פּ  Toggle explorer"))
keymap("n", "<Leader>n", "<cmd>noh<CR>", getOptions("  Remove seach highlights"))
keymap("", "<Leader>h", "<cmd>Alpha<CR>", getOptions("  Home"))

-- default editor
keymap("n", "<c-s>", ":w<CR>", {})
keymap("i", "<c-s>", "<ESC>:w<CR>a", {})

-- window management
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)
-- resize
keymap("n", "<c-Up>", ":resize -2<CR>", opts)
keymap("n", "<c-Down>", ":resize +2<CR>", opts)
keymap("n", "<c-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<c-Right>", ":vertical resize +2<CR>", opts)

-- move text up and down
keymap("v", "<A-j>", "<cmd>m .+1<CR>==gv", opts)
keymap("v", "<A-k>", "<cmd>m .-2<CR>==gv", opts)
keymap("n", "<A-j>", "<cmd>m .+1<CR>==", opts)
keymap("n", "<A-k>", "<cmd>m .-2<CR>==", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- comment
keymap("n", "<C-/>", "<cmd>norm gcc<CR>", opts)
keymap("v", "<C-/>", "<cmd>visual gc<CR>", opts)
keymap("n", "<leader>/", "<cmd>norm gcc<CR>", getOptions("  Comment line style"))
keymap("v", "<leader>/", "<cmd>norm gcc<CR>", getOptions("  Comment line style"))

-- Buffers
keymap("", "<S-E>", "<cmd>bp<CR>", getOptions("  Previous buffer"))
keymap("", "<S-R>", "<cmd>bn<CR>", getOptions("  Next buffer"))
keymap("", "<Leader>bcc", "<cmd>bw<CR>", getOptions("  Close buffer"))
keymap("", "<Leader>bcl", "<cmd>BufferLineCloseLeft<CR>", getOptions("  Close buffers to the left"))
keymap("", "<Leader>bcr", "<cmd>BufferLineCloseRight<CR>", getOptions("  Close buffers to the right"))
keymap("", "<Leader>bp", "<cmd>bp<CR>", getOptions("  Previous buffer"))
keymap("", "<Leader>bn", "<cmd>bn<CR>", getOptions("  Next buffer"))


-- Plugins --

-- NvimTree
keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", getOptions("פּ  Toggle explorer"))

-- Telescope
keymap("n", "ft", ":Telescope live_grep<CR>", getOptions("Live grep"))
keymap("n", "fp", ":Telescope projects<CR>", getOptions("Projects"))
keymap("n", "fb", ":Telescope buffers<CR>", getOptions("Buffers"))
keymap("n", "ff", "<cmd>Telescope find_files<CR>", getOptions("Find file"))
keymap("n", "fr", "<cmd>Telescope oldfiles<CR>", getOptions("Open recent file"))
keymap("n", "fn", "<cmd>new<CR>", getOptions("New file"))

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- toggle terminal
keymap("", "<C-t>","<cmd>ToggleTerm direction=float<CR>", getOptions("  Toggle floating terminal"))
keymap("t", "<C-t>","<cmd>ToggleTerm direction=float<CR>", getOptions("  Toggle floating terminal"))
keymap("i", "<C-t>","<cmd>ToggleTerm direction=float<CR>", getOptions("  Toggle floating terminal"))
keymap("", "<Leader>tf", "<cmd>ToggleTerm direction=float<CR>", getOptions("  Toggle floating terminal"))
keymap("", "<Leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", getOptions("  Toggle horizontal terminal"))
keymap("", "<Leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", getOptions("  Toggle vertical terminal"))
keymap("t", "<Leader>t", "<cmd>ToggleTerm<CR>", getOptions("  Toggle terminal"))


-- WHich key
local wk = require("which-key")
wk.register({
    b = { name = "ﴵ  Buffers" },
    bc = { name = "  Close buffer" },
    s = { name = "  Sessions" },
    t = { name = "  Terminal" },
}, { prefix = "<leader>" })
