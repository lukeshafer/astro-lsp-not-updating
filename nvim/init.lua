local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.lsp.set_log_level("debug")

require("lazy").setup({ "neovim/nvim-lspconfig" })

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

require'lspconfig'.tsserver.setup({})
require'lspconfig'.astro.setup({})
