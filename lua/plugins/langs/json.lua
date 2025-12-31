return require("utils.lang").setup {
  treesitter = { "json", "jsonc" },

  format = {
    json = { "biome" },
    jsonc = { "biome" }
  }
}
