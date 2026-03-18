return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" },
    },
    opts = {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = {
          'c', 'go', 'lua', 'rust', 'typescript', 'html', 'javascript', 'css',
          'vimdoc', 'vim', 'query', 'glsl',
      },

      highlight = { enable = true },
      indent = { enable = false },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-backspace>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    },
    config = function(_, opts)
        ---@diagnostic disable: inject-field
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.templ = {
          install_info = {
            url = "https://github.com/vrischmann/tree-sitter-templ.git",
            files = { "src/parser.c", "src/scanner.c" },
            branch = "master",
          },
        }

        vim.treesitter.language.register('templ', 'templ')

        parser_config.d2 = {
          install_info = {
            url = "https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2",
            revision = "main",
            files = { "src/parser.c", "src/scanner.cc" },
          },
          filetype = "d2",
        }

        require("nvim-treesitter.configs").setup(opts)

        vim.api.nvim_create_augroup('TSJS', { clear = true })
        vim.api.nvim_create_autocmd('FileType', {
          group = 'TSJS',
          pattern = { 'javascript' },
          callback = function(ev)
            require('nvim-treesitter.configs').commands.TSBufEnable.run("indent", ev.bufnr, "javascript")
          end,
        })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    branch = "master",
  },
}
