return {
	global = function ()
		-- disable leader
		vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

		-- Remap for dealing with word wrap
		vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
		vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

		-- Diagnostic keymaps
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
		vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
		vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
	end,

	nvterm = function ()
		vim.keymap.set('n', '<A-h>', function () require('nvterm.terminal').toggle('horizontal') end)
		vim.keymap.set('n', '<A-v>', function () require('nvterm.terminal').toggle('vertical') end)
		vim.keymap.set('n', '<A-f>', function () require('nvterm.terminal').toggle('float') end)
	end,

	telescope = function ()
		pcall(require('telescope').load_extension, 'fzf')
		vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
		vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
		vim.keymap.set('n', '<leader>s', function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = 'Fuzzily [s]earch in current buffer' })

		vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
		vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
		vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
		vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
		vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
		vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
	end,

	nvimtree = function ()
		vim.keymap.set('n', '<C-n>', '<CMD> NvimTreeToggle <CR>')
		vim.keymap.set('n', '<C-f>', '<CMD> NvimTreeFocus <CR>')
	end,

	hover = function ()
		vim.keymap.set('n', 'K', require("hover").hover, { desc = "hover.nvim"})
		vim.keymap.set('n', '<C-k>', require("hover").hover_select, { desc = "hover.nvim (select)"})
	end
}
