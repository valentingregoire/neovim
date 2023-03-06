local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    -- prompt_prefix = "   ",
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },

  extensions_list = { "themes", "terms" },
}

-- colors
local colors = {
    black = "#181b20",
    light_grey = "#3a3d45",
    lighter_grey = "#282c34",
    grey = "#1f2329",
    white = "#dddddd",
    red = "#cc7777",
    green = "#77cc77",
    yellow = "#cccc77",
}

local TelescopeColor = {
    TelescopeBorder = { fg = colors.black, bg = colors.black },
	TelescopePromptPrefixBorder = { fg = colors.lighter_grey, bg = colors.lighter_grey },
    TelescopePromptBorder = { fg = colors.lighter_grey, bg = colors.lighter_grey },
    TelescopePreviewBorder = { fg = colors.black, bg = colors.black },
    TelescopeResultsBorder  = { fg = colors.black, bg = colors.black },
	TelescopePromptPrefix = { fg = colors.red, bg = colors.lighter_grey },
	TelescopePromptNormal = { fg = colors.white, bg = colors.lighter_grey },
	TelescopePromptTitle = { fg = colors.black, bg = colors.red },
    TelescopeNormal = { bg = colors.black },
    TelescopePreviewTitle = { fg = colors.black, bg = colors.green },
    TelescopeResultsTitle = { fg = colors.black, bg = colors.yellow },
    TelescopeSelection = { fg = colors.white, bg = colors.light_grey },
    TelescopeResultsDiffAdd = { fg = colors.green },
    TelescopeResultsDiffChange = { fg = colors.yellow },
    TelescopeResultsDiffDelete = { fg = colors.red },
}

for hl, col in pairs(TelescopeColor) do
	vim.api.nvim_set_hl(0, hl, col)
end

-- extra extensions
telescope.load_extension("vim_bookmarks")
telescope.load_extension("notify")



