local M = {}

local colors = {
	red = "#ff5f5f",
	green = "#5fff87",
	blue = "#5f87ff",
	yellow = "#ffd75f",
	white = "#ffffff",
	black = "#000000",
	darker_black = "#121212",
	black2 = "#1c1c1c",
	one_bg = "#262626",
	one_bg3 = "#3a3a3a",
}

local function set(name, opts)
	vim.api.nvim_set_hl(0, name, opts)
end

function M.apply(style)
	-- base highlights
	set("TelescopeNormal", { bg = colors.darker_black })

	set("TelescopePromptPrefix", {
		fg = colors.red,
		bg = colors.black2,
	})

	set("TelescopePromptTitle", {
		fg = colors.black,
		bg = colors.red,
	})

	set("TelescopePreviewTitle", {
		fg = colors.black,
		bg = colors.green,
	})

	set("TelescopeSelection", {
		bg = colors.black2,
		fg = colors.white,
	})

	set("TelescopeResultsDiffAdd", { fg = colors.green })
	set("TelescopeResultsDiffChange", { fg = colors.yellow })
	set("TelescopeResultsDiffDelete", { fg = colors.red })

	set("TelescopeMatching", {
		fg = colors.blue,
		bg = colors.one_bg,
	})

	-- styles
	if style == "borderless" then
		set("TelescopeBorder", { fg = colors.darker_black, bg = colors.darker_black })
		set("TelescopePromptBorder", { fg = colors.black2, bg = colors.black2 })
		set("TelescopePromptNormal", { fg = colors.white, bg = colors.black2 })
		set("TelescopeResultsTitle", { fg = colors.darker_black, bg = colors.darker_black })
	elseif style == "bordered" then
		set("TelescopeBorder", { fg = colors.one_bg3 })
		set("TelescopePromptBorder", { fg = colors.one_bg3 })
		set("TelescopeResultsTitle", { fg = colors.black, bg = colors.green })
		set("TelescopePreviewTitle", { fg = colors.black, bg = colors.blue })
		set("TelescopePromptPrefix", { fg = colors.red })
		set("TelescopeNormal", { bg = "none" })
		set("TelescopePromptNormal", { bg = "none" })
	end
end

return M
