return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require("tree-sitter-manager").setup({
      ensure_installed = {
        "javascript",
        "html",
        "css",
        "json",
        "python",
        "lua",
        "vim",
        "vimdoc",
        "gitcommit",
        "diff",
        "yaml",
        "markdown",
        "markdown_inline",
        "cpp",
        "awk",
        "ruby",
      },
    })
  end
}
