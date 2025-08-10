return {
  "mfussenegger/nvim-lint",
  -- Override LazyVim's defaults to disable markdown linting globally
  -- This prevents markdownlint (and markdownlint-cli2) from running for Markdown files.
  opts = function(_, opts)
    opts = opts or {}
    opts.linters_by_ft = opts.linters_by_ft or {}

    -- Disable linting for Markdown filetypes by setting empty linter lists
    opts.linters_by_ft.markdown = {}
    opts.linters_by_ft["markdown.mdx"] = {}

    -- If you prefer to keep markdownlint but disable only MD013 globally,
    -- consider configuring markdownlint via a global config file (e.g.,
    -- ~/.markdownlint.json or ~/.config/markdownlint/.markdownlint.json) with:
    -- { "MD013": false }
    -- Alternatively, you could customize the linter arguments here if needed.

    return opts
  end,
}