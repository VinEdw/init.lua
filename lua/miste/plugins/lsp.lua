return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()

    -- Set buffer-local keybindings where there is an active language server
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = {buffer = event.buf}
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, opts)
      end
    })

    -- Connect to nvim-cmp package
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local default_setup = function(server)
      require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
      })
    end

    -- Enable the desired language servers
    -- Included is a short note on how to install each

    -- npm install -g awk-language-server
    vim.lsp.enable('awk_ls')

    -- dnf install clang clang-tools-extra
    vim.lsp.enable('clangd')

    -- julia --project=@nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer"); Pkg.add("SymbolServer"); Pkg.add("StaticLint")'
    -- julia --project=@nvim-lspconfig -e 'using Pkg; Pkg.update()'
    vim.lsp.config('julials', {
      on_new_config = function(new_config,new_root_dir)
      server_path = "~/.julia/environments/nvim-lspconfig"
      cmd = {
        "julia",
        "--project="..server_path,
        "--startup-file=no",
        "--history-file=no",
        "-e", [[
          using Pkg
          Pkg.instantiate()
          using LanguageServer
          depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
          project_path = let
              dirname(something(
                  ## 1. Finds an explicitly set project (JULIA_PROJECT)
                  Base.load_path_expand((
                      p = get(ENV, "JULIA_PROJECT", nothing);
                      p === nothing ? nothing : isempty(p) ? nothing : p
                  )),
                  ## 2. Look for a Project.toml file in the current working directory,
                  ##    or parent directories, with $HOME as an upper boundary
                  Base.current_project(),
                  ## 3. First entry in the load path
                  get(Base.load_path(), 1, nothing),
                  ## 4. Fallback to default global environment,
                  ##    this is more or less unreachable
                  Base.load_path_expand("@v#.#"),
              ))
          end
          @info "Running language server" VERSION pwd() project_path depot_path
          server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
          server.runlinter = true
          run(server)
        ]]
      };
      new_config.cmd = cmd
    end
    })
    vim.lsp.enable('julials')

    -- https://github.com/Myriad-Dreamin/tinymist/releases
    vim.lsp.enable('tinymist')

    -- npm install -g vscode-langservers-extracted
    -- npm install -g @olrtg/emmet-language-server
    vim.lsp.enable('html')
    vim.lsp.enable('cssls')
    vim.lsp.enable('emmet_language_server')
    -- npm install -g typescript-language-server typescript
    vim.lsp.enable('ts_ls')

    -- npm install -g pyright
    vim.lsp.enable('pyright')

  end,
}
