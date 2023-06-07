--
-- This function has been generated from your
--   view.mappings.list
--   view.mappings.custom_only
--   remove_keymaps
--
-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
--
-- Although care was taken to ensure correctness and completeness, your review is required.
--
-- Please check for the following issues in auto generated content:
--   "Mappings removed" is as you expect
--   "Mappings migrated" are correct
--
-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
--

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
  vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
  vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
  vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
  vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
  vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
  vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
  vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
  vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
  vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
  vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
  vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
  vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
  vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
  vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
  vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
  vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
  vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
  vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
  vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
  vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
  vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
  vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
  vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
  vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  -- END_DEFAULT_ON_ATTACH


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))

end


-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

-- generates options for keymaps
local function getOptions(desc)
	return {
		noremap = true,
		silent = true,
		desc = desc,
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
keymap("n", "<Leader>n", "<cmd>noh<CR>", getOptions("  Remove search highlights"))
keymap("", "<Leader>h", "<cmd>Alpha<CR>", getOptions("  Home"))
keymap("", "<Leader>m", "<cmd>Notifications<CR>", getOptions("  Notifications"))

-- leader leader (vim stuff)
keymap("n", "<Leader><Leader>x", ":source %<CR>", getOptions("勒 Reload configs"))

-- default editor
keymap("n", "<c-s>", ":w<CR>", getOptions("  Save"))
keymap("i", "<c-s>", "<ESC>:w<CR>a", getOptions("  Save"))
keymap("n", '<leader>"', 'ciw""<Esc>P', getOptions("  Double quotes"))
keymap("n", "<leader>'", "ciw''<Esc>P", getOptions("  Single quotes"))

-- window management
keymap("n", "<c-h>", "<c-w>h", getOptions("  Window left"))
keymap("n", "<c-j>", "<c-w>j", getOptions("  Window down"))
keymap("n", "<c-k>", "<c-w>k", getOptions("  Window up"))
keymap("n", "<c-l>", "<c-w>l", getOptions("  Window right"))
-- resize
keymap("n", "<c-Up>", ":resize -2<CR>", getOptions("ﲗ  Vertical smaller"))
keymap("n", "<c-Down>", ":resize +2<CR>", getOptions("ﲔ  Vertical larger"))
keymap("n", "<c-Left>", ":vertical resize -2<CR>", getOptions("ﲕ  Horizontal smaller"))
keymap("n", "<c-Right>", ":vertical resize +2<CR>", getOptions("ﲖ  Horizontal larger"))

-- move text up and down
keymap("v", "<A-j>", "<cmd>m .+1<CR>==gv", getOptions("  Move lines down"))
keymap("v", "<A-k>", "<cmd>m .-2<CR>==gv", getOptions("  Move lines up"))
keymap("n", "<A-j>", "<cmd>m .+1<CR>==", getOptions("  Move lines down"))
keymap("n", "<A-k>", "<cmd>m .-2<CR>==", getOptions("  Move lines up"))
keymap("v", ">", ">gv", getOptions("  Increase indentation"))
keymap("v", "<", "<gv", getOptions("  Decrease indentation"))

-- comment
keymap("n", "<C-/>", "<cmd>norm gcc<CR>", getOptions("  Comment line style"))
keymap("v", "<C-/>", "<cmd>visual gc<CR>", getOptions("  Comment line style"))
keymap("n", "<leader>/", "<cmd>norm gcc<CR>", getOptions("  Comment line style"))
keymap("v", "<leader>/", "<cmd>norm gcc<CR>", getOptions("  Comment line style"))

-- Buffers
keymap("", "<S-E>", "<cmd>bp<CR>", getOptions("  Previous buffer"))
keymap("", "<S-R>", "<cmd>bn<CR>", getOptions("  Next buffer"))
keymap("", "<Leader>bcc", "<cmd>bw<CR>", getOptions("  Close buffer"))
keymap("", "<Leader>bcC", "<cmd>bw!<CR>", getOptions("  Force close buffer"))
keymap("", "<Leader>bcl", "<cmd>BufferLineCloseLeft<CR>", getOptions("  Close buffers to the left"))
keymap("", "<Leader>bcr", "<cmd>BufferLineCloseRight<CR>", getOptions("  Close buffers to the right"))
keymap("", "<Leader>bp", "<cmd>bp<CR>", getOptions("  Previous buffer"))
keymap("", "<Leader>bn", "<cmd>bn<CR>", getOptions("  Next buffer"))
keymap("", "<Leader>bl", "<cmd>Telescope buffers<CR>", getOptions("  List buffers"))
keymap("", "<Leader>bp", "<cmd>BufferLineTogglePin<CR>", getOptions("車 Toggle pin"))
keymap("", "<S-Tab>", "<cmd>:b#<CR>", getOptions(" Jump to last used buffer"))

-- Session manager
keymap("", "<Leader>sa", "<cmd>SessionManager load_last_session<CR>", getOptions("  Load last session"))
keymap("", "<Leader>ss", "<cmd>SessionManager save_current_session<CR>", getOptions("  Save session"))
keymap("", "<Leader>sl", "<cmd>SessionManager load_session<CR>", getOptions("  Load session"))
keymap("", "<Leader>sd", "<cmd>SessionManager delete_session<CR>", getOptions("  Delete session"))
-- keymap("n", "<Leader>ss", "<cmd>SessionManager load_session " .. input('What session?') .. "<CR>", getOptions("Load session"))

-- NvimTree
keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", getOptions("פּ  Toggle explorer"))

-- Telescope
keymap("n", "<c-p>", "<cmd>Telescope<CR>", getOptions("  Telescope"))
keymap("n", "<leader>f<CR>", ":Telescope<CR>", getOptions("  Telescope"))
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", getOptions("  Live grep"))
keymap("n", "<leader>fp", ":Telescope projects<CR>", getOptions("  Projects"))
keymap("n", "<leader>fb", ":Telescope buffers<CR>", getOptions("裡 Buffers"))
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", getOptions("  Find file"))
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", getOptions("ﭯ  Open recent file"))
keymap("n", "<leader>fn", "<cmd>new<CR>", getOptions("  New file"))

-- -- Git
-- --[[ keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", getOptions("  Git")) ]]
-- keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", getOptions("  Git"))

-- -- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- -- run code
-- keymap("n", "<F3>", "<cmd>SnipRun<CR>", getOptions("  Run selection"))
-- keymap("v", "<F3>", "<cmd>SnipRun<CR>", getOptions("  Run selection"))
-- keymap("n", "<F4>", "<cmd>Jaq<CR>", getOptions("  Run code"))

-- -- DAP debugging
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", getOptions("  Toggle breakpoint"))
-- keymap(
-- 	"n",
-- 	"<leader>dB",
-- 	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
-- 	getOptions("ﳁ  Toggle conditional breakpoint")
-- )
-- keymap(
-- 	"n",
-- 	"<leader>dl",
-- 	"<cmd>lua require'dap'.set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
-- 	getOptions("  Set log point")
-- )
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", getOptions("  Continue"))
-- keymap("n", "<F8>", "<cmd>lua require'dap'.continue()<cr>", getOptions("  Continue"))
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", getOptions("  Step into"))
-- keymap("n", "<F5>", "<cmd>lua require'dap'.step_into()<cr>", getOptions("  Step into"))
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", getOptions("  Step over"))
-- keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", getOptions("  Step over"))
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", getOptions("  Step out"))
-- keymap("n", "<F7>", "<cmd>lua require'dap'.step_out()<cr>", getOptions("  Step out"))
-- keymap("n", "<leader>dm", "<cmd>lua require'dap-python'.test_method()<cr>", getOptions("  Test method"))
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", getOptions("  Toggle REPL"))
-- keymap("n", "<leader>dL", "<cmd>lua require'dap'.run_last()<cr>", getOptions("漏 Run last"))
-- keymap("n", "<leader>dg", "<cmd>lua require'dapui'.toggle()<cr>", getOptions("拓 Toggle GUI"))
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", getOptions("栗 Stop"))
-- keymap("n", "<leader>du", "<cmd>lua require('dapui').eval()<CR>", getOptions("  Evaluate expression"))
-- keymap("v", "<leader>du", "<cmd>lua require('dapui').eval()<CR>", getOptions("  Evaluate expression"))

-- toggle terminal
keymap("", "<C-t>", "<cmd>ToggleTerm direction=horizontal<CR>", getOptions("  Toggle floating terminal"))
keymap("t", "<C-t>", "<cmd>ToggleTerm direction=horizontal<CR>", getOptions("  Toggle floating terminal"))
keymap("i", "<C-t>", "<cmd>ToggleTerm direction=horizontal<CR>", getOptions("  Toggle floating terminal"))
keymap("", "<Leader>tf", "<cmd>ToggleTerm direction=float<CR>", getOptions("禎 Toggle floating terminal"))
keymap("", "<Leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", getOptions("ﬠ  Toggle horizontal terminal"))
keymap("", "<Leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", getOptions("ײַ  Toggle vertical terminal"))
keymap("t", "<Leader>t", "<cmd>ToggleTerm<CR>", getOptions("  Toggle terminal"))

-- markdown preview
keymap("", "<Leader>p", "<cmd>MarkdownPreviewToggle<CR>", getOptions("  Markdown preview"))

-- Which key
local wk = require("which-key")
-- -- bookmarks
-- wk.register({
-- 	m = {
-- 		name = "  Bookmarks",
-- 		a = "  Show all bookmarks",
-- 		c = "  Clear bookmark",
-- 		m = "  Toggle bookmark",
-- 		g = "  Move bookmark to line",
-- 		i = "  Annotate bookmark",
-- 		x = "  Clear all bookmarks",
-- 		n = "ﰳ  Next bookmark",
-- 		p = "ﰰ  Previous bookmark",
-- 		j = { name = "ﰭ  Move bookmark down", j = "ﰭ  Move bookmark down" },
-- 		k = { name = "ﰶ  Move bookmark up", j = "ﰭ  Move bookmark up" },
-- 	},
-- })

-- <leader>
wk.register({
	b = { name = "裡 Buffers" },
	bc = { name = "  Close buffer" },
	d = { name = "ﴫ  Debug" },
	f = { name = "  Telescope" },
	g = { name = "  Git" },
	l = { name = "  LSP" },
	s = { name = "  Sessions" },
	t = { name = "  Terminal" },
}, { prefix = "<leader>" })
