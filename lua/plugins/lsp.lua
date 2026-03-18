return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
    },
    config = function()
        -- LSP settings.
        -- This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(_, bufnr)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
          end

          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
          nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
          nmap('<leader>ds', vim.lsp.buf.document_symbol, '[D]ocument [S]ymbols')
          nmap('<leader>ws', vim.lsp.buf.workspace_symbol, '[W]orkspace [S]ymbols')
          nmap('<leader>si', vim.lsp.buf.incoming_calls, '[S]how [I]ncoming')
          nmap('<leader>so', vim.lsp.buf.outgoing_calls, '[S]how [O]utgoing')

          -- See `:help K` for why this keymap
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
          -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

          -- Lesser used LSP functionality
          nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
          nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
          nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '[W]orkspace [L]ist Folders')

          -- Create a command `:Format` local to the LSP buffer
          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
          end, { desc = 'Format current buffer with LSP' })
        end

        -- nnvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        -- Enable (broadcasting) snippet compatibility for completion
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd", "gopls", "rust_analyzer", "html", "templ",
                "lua_ls",
            },
        })
        require("fidget").setup()

        -- Wire on_attach and capabilities into all servers
        -- using the LspAttach autocmd (works with both patterns)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                on_attach(nil, args.buf)
            end
        })

        -- Servers using vim.lsp.config (0.11+ style)
        vim.lsp.config("gopls", { capabilities = capabilities })
        vim.lsp.enable("gopls")

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = { checkThirdPart = false },
                    telemetry = { enable = false },
                },
            },
        })
        vim.lsp.enable("lua_ls")

        vim.lsp.config("html", { capabilities = capabilities })
        vim.lsp.enable("html")

        vim.lsp.config("clangd", { capabilities = capabilities })
        vim.lsp.enable("clangd")

        vim.lsp.config("rust_analyzer", { capabilities = capabilities })
        vim.lsp.enable("rust_analyzer")

        vim.lsp.config("templ", { capabilities = capabilities })
        vim.lsp.enable("templ")

        vim.lsp.config("glsl_analyzer", { capabilities = capabilities })
        vim.lsp.enable("glsl_analyzer")

        vim.lsp.config("nim_langserver", { capabilities = capabilities })
        vim.lsp.enable("nim_langserver")

        vim.lsp.config("zls", { capabilities = capabilities })
        vim.lsp.enable("zls")

        vim.lsp.config("phpactor", { capabilities = capabilities })
        vim.lsp.enable("phpactor")

        vim.lsp.config("twiggy-language-server", { capabilities = capabilities })
        vim.lsp.enable("twiggy-language-server")
    end,
}
