return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		local nvimtree = require("nvim-tree")
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5DD ]])

		-- configure nvim-tree
		nvimtree.setup({
			renderer = {
				icons = {
					glyphs = {
						folder = {
          						arrow_closed = "", -- arrow when folder is closed
						          arrow_open = "", -- arrow when folder is open
						  },
					  },
				  },
			  },
			  actions = {
				  open_file = {
					  window_picker = {
						  enable = false,
					  },
				  },
			  },
		  })

		  -- set keymaps
		  vim.g.mapleader = ","
		  local keymap = vim.keymap

		  keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
		  keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
		  keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
	end
}
	
