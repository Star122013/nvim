return require("utils.lang").setup {
  treesitter = { "json" },

  format = {
    json = { "biome" },
    jsonc = { "biome" }
  }
}
