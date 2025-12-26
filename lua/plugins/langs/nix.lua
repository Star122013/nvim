return require('utils.lang').setup {
  treesitter = { 'nix' },

  linters = { 'deadnix' },

  format = {
    nix = { 'nixfmt' }
  },

  lsp = {
    nix = {
      cmd = { 'nixd' },
      filetypes = { 'nix' },
      root_markers = { 'flake.nix', '.git' },
      settings = {
        nixd = {
          nixpkgs = {
            expr = 'import <nixpkgs> { }',
          },
          formatting = {
            command = { 'nixfmt' },
          },
          options = {
            nixos = {
              expr = '(builtins.getFlake ("git+file://" + toString ~/nix-config/.)).nixosConfigurations.Moon.options',
            },
            flake_parts = {
              expr = '(builtins.getFlake ("git+file://" + toString ~/nix-config/.)).debug.options',
            },
            flake_parts2 = {
              expr = '(builtins.getFlake ("git+file://" + toString ~/nix-config/.)).currentSystem.options',
            },
          },
        },
      },
    },
  }
}
