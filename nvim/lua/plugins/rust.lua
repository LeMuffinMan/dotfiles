
return {
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("rust-tools").setup({
        server = {
          on_attach = function(_, bufnr)
            -- raccourcis spécifiques Rust
            vim.keymap.set("n", "<leader>rr", "<cmd>RustRunnables<CR>", { buffer = bufnr })
          end,
        },
      })
    end,
  },
}
