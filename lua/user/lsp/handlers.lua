local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()
  local signs = {

    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = true, -- disable virtual text
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end


-- generates options for keymaps
local function getOptions(desc)
	return {
		noremap = true,
		silent = true,
		desc = desc,
	}
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", getOptions("  Declaration"))
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", getOptions("  Definition"))
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", getOptions("  Hover"))
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", getOptions("  Implementation"))
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", getOptions("   References"))
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", getOptions("  Line diagnostics"))
  keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", getOptions("  Format code"))
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", getOptions("  LSP info"))
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", getOptions("  LSP install info"))
  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", getOptions("  Code actions"))
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", getOptions("ﭠ  Go to next problem"))
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", getOptions("ﭢ  Go to previous problem"))
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", getOptions("凜 Rename"))
  keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", getOptions("  Signature"))
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", getOptions("裸 Diagnostics"))
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end

  if client.name == "sumneko_lua" then
    client.resolved_capabilities.document_formatting = false
  end

  lsp_keymaps(bufnr)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

return M
