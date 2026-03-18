return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- Register custom parsers
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          ---@diagnostic disable: inject-field, missing-fields
          require("nvim-treesitter.parsers").templ = {
            install_info = {
              url = "https://github.com/vrischmann/tree-sitter-templ.git",
              files = { "src/parser.c", "src/scanner.c" },
              branch = "master",
            },
          }
          require("nvim-treesitter.parsers").d2 = {
            install_info = {
              url = "https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2",
              revision = "main",
              files = { "src/parser.c", "src/scanner.c" },
            },
          }
        end,
      })

      vim.treesitter.language.register("templ", "templ")

      -- Install parser (no-op if already installed)
      local ok, ts = pcall(require, "nvim-treesitter")
      if ok and ts.install then
        require("nvim-treesitter").install({
          "c", "go", "lua", "rust", "typescript", "html",
          "javascript", "css", "vimdoc", "vim", "query", "glsl",
          "php",
        })
      end

      -- Enable treesitter highlighting for all filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      -- Enable treesitter indentation for JavaScript
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "javascript" },
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
      })

      -- Select textobjects
      local select_fn = require("nvim-treesitter-textobjects.select")
      for _, mode in ipairs({ "x", "o" }) do
        vim.keymap.set(mode, "aa", function() select_fn.select_textobject("@parameter.outer", "textobjects") end, { desc = "Select outer parameter" })
        vim.keymap.set(mode, "ia", function() select_fn.select_textobject("@parameter.inner", "textobjects") end, { desc = "Select inner parameter" })
        vim.keymap.set(mode, "af", function() select_fn.select_textobject("@function.outer", "textobjects") end, { desc = "Select outer function" })
        vim.keymap.set(mode, "if", function() select_fn.select_textobject("@function.inner", "textobjects") end, { desc = "Select inner function" })
        vim.keymap.set(mode, "ac", function() select_fn.select_textobject("@class.outer", "textobjects") end, { desc = "Select outer class" })
        vim.keymap.set(mode, "ic", function() select_fn.select_textobject("@class.inner", "textobjects") end, { desc = "Select inner class" })
      end

      -- Move between textobjects
      local move = require("nvim-treesitter-textobjects.move")
      vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function start" })
      vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end, { desc = "Next class start" })
      vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end, { desc = "Next function end" })
      vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@class.outer", "textobjects") end, { desc = "Next class end" })
      vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Previous function start" })
      vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end, { desc = "Previous class start" })
      vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end, { desc = "Previous function end" })
      vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@class.outer", "textobjects") end, { desc = "Previous class end" })

      -- Swap parameters
      local swap = require("nvim-treesitter-textobjects.swap")
      vim.keymap.set("n", "<leader>a", function() swap.swap_next("@parameter.inner", "textobjects") end, { desc = "Swap next parameter" })
      vim.keymap.set("n", "<leader>A", function() swap.swap_previous("@parameter.inner", "textobjects") end, { desc = "Swap previous parameter" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {},
  },
}
