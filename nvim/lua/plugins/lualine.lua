local function get_wordcount()
	local word_count = 0

	if vim.fn.mode():find("[vV]") then
		word_count = vim.fn.wordcount().visual_words
	else
		word_count = vim.fn.wordcount().words
	end

	return word_count
end

local function wordcount()
	local label = "word"
	local word_count = get_wordcount()

	if word_count > 1 then
		label = label .. "s"
	end

	return word_count .. " " .. label
end

local function readingtime()
	-- 200 is about the average words read per minute.
	return tostring(math.ceil(get_wordcount() / 200.0)) .. " min"
end

local function is_prose()
	return vim.bo.filetype == "markdown" or vim.bo.filetype == "text"
end

return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				-- Disable the default clock and replace it with word stats.
				lualine_z = {
					{ wordcount, cond = is_prose },
					{ readingtime, cond = is_prose },
				},
			},
		},
	},
}
