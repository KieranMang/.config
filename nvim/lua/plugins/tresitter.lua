return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                sync_install = false,
                auto_install = true,
                highlight = {enable = true,},
                indent = {enable = true,},
            }

            vim.api.nvim_create_user_command("ListParsers", function()
                local output = vim.api.nvim_exec2("TSInstallInfo", { output = true }).output

                local buf = vim.api.nvim_create_buf(false, true)

                local function swap_and_replace(s)
                    local swapped = s:gsub("%s*(.-)%s*(%[.-%])%s*", function(text, mark)
                        if mark == "[✓]" then
                            mark = "●"
                        elseif mark == "[✗]" then
                            mark = "○"
                        end
                        return mark .. " " .. text
                    end)
                    return swapped
                end

                local lines = vim.split(output, "\n", { trimempty = true })
                for i, line in ipairs(lines) do
                    lines[i] = "  " .. swap_and_replace(line:match("^(.-%])")) or "  " .. line
                end

                local total_installed = 0
                local i = 1
                for j = 1, #lines do
                    if lines[j]:find("●") then
                        total_installed = total_installed + 1
                        if i ~= j then
                            lines[i], lines[j] = lines[j], lines[i]
                        end
                        i = i + 1
                    end
                end

                if total_installed ~= 0 then
                    table.insert(lines, 1, "Installed:")
                    table.insert(lines, total_installed+2, "")
                    table.insert(lines, total_installed+3, "Not Installed:")
                end

                vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

                vim.bo[buf].modifiable = false
                vim.bo[buf].bufhidden = "wipe"

                local width = math.floor(vim.o.columns * 0.2)
                local height = math.floor(vim.o.lines * 0.8)
                local row = math.floor((vim.o.lines - height) / 2)
                local col = math.floor((vim.o.columns - width) / 2)

                vim.api.nvim_open_win(buf, true, {
                    relative = "editor",
                    width = width,
                    height = height,
                    row = row,
                    col = col,
                    style = "minimal",
                    border = "single",
                    title = "Treesitter",
                    title_pos = "left",
                })
                vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
                vim.keymap.set("n", "<esc>", "<cmd>close<CR>", { buffer = buf, silent = true })


            end, { desc = "Show Tree-sitter parser info in a floating window" })

            vim.keymap.set("n", "<leader>tp", "<cmd>ListParsers<CR>")

        end
    }
}
