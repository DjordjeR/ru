-- File: lua/lsp/keymaps.lua
local M = {}

function M.on_attach(_, buffer)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = buffer, silent = true, desc = desc })
  end

  -- LSP basic navigation
  map("n", "gd", function()
    vim.lsp.buf.definition()
    vim.cmd("normal! zz")
  end, "Goto Definition")
  map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
  map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
  map("n", "gy", vim.lsp.buf.type_definition, "Goto Type Definition")
  map("n", "gr", vim.lsp.buf.references, "References")

  -- Info and documentation
  map("n", "K", vim.lsp.buf.hover, "Hover Info")
  map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
  map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")

  -- Code actions and renaming
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
  map("n", "<leader>cr", vim.lsp.buf.rename, "Rename Symbol")

  -- Formatting
  map("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, "Format File")

  -- Diagnostics
  map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
  map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")

  -- CodeLens (optional; only works if LSP supports it)
  map("n", "<leader>cc", vim.lsp.codelens.run, "Run CodeLens")
  map("n", "<leader>cC", vim.lsp.codelens.refresh, "Refresh CodeLens")
end

return M

