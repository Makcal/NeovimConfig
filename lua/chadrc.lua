---@type ChadrcConfig
local M = {
	base46 = {
		theme = "onedark",
		hl_override = {
			NonText = { fg = "light_grey" },
			LineNr = { fg = "white" },
			StatusLine = { bg = "NONE" },
			NormalFloat = { bg = "NONE" },

			IblScopeChar = { fg = "light_grey" },

			CmpDoc = { bg = "NONE" },
			CmpPmenu = { bg = "NONE" },

			TbFill = { bg = "NONE" },
			TbBufOn = { bg = "NONE" },
			TbBufOff = { bg = "NONE" },
			TbBufOnClose = { bg = "NONE" },
			TbBufOffClose = { bg = "NONE" },
			TbBufOnModified = { bg = "NONE" },
			TbBufOffModified = { bg = "NONE" },

			NvimTreeNormal = { bg = "NONE" },
			NvimTreeNormalNC = { bg = "NONE" },
			NvimTreeWinSeparator = { bg = "NONE", fg = "white" },
			NvimTreeCursorLine = { bg = "NONE" },

			TelescopeNormal = { bg = "NONE" },
			TelescopeBorder = { bg = "NONE", fg = "white" },
			TelescopeSelection = { bg = "light_grey" },
			TelescopeResultsTitle = { bg = "sun" },
			TelescopeMatching = { bg = "NONE" },
			TelescopePromptNormal = { bg = "NONE" },
			TelescopePromptBorder = { bg = "NONE", fg = "white" },
			TelescopePromptPrefix = { bg = "NONE" },
		},
	},
	mason = {
		pkgs = {
			"pyright",
		},
	},
}
return M
