-- See lazy.lua for leaders

--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>;", "maA;<esc>`a<cmd>delmarks a<CR>")

vim.keymap.set("n", "<leader>k", "maO<esc>`a<cmd>delmarks a<CR>")
vim.keymap.set("n", "<leader>j", "mao<esc>`a<cmd>delmarks a<CR>")

vim.keymap.set("n", "<leader>fm", "magg=G`a<cmd>delmarks a<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "L", "<cmd>Lazy<CR>")

local function transform_repeated_digits()
    local mode = vim.fn.visualmode()

    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local start_line = start_pos[2]
    local end_line = end_pos[2]
    local start_col = start_pos[3]
    local end_col = end_pos[3]

    if mode == '\22' or mode == '^V' then  -- \22 is Ctrl-V
        local col_start = math.min(start_col, end_col)
        local col_end = math.max(start_col, end_col)

        local selected_chars = {}
        for line_num = start_line, end_line do
            local line = vim.fn.getline(line_num)
            local selected = line:sub(col_start, col_end)
            table.insert(selected_chars, selected)
        end

        local first_char = selected_chars[1]:sub(1, 1)
        local all_same = true

        for _, chars in ipairs(selected_chars) do
            if not chars:match("^" .. first_char .. "+$") or not first_char:match("%d") then
                all_same = false
                break
            end
        end

        if not all_same then
            print("Selection must be repeated single digit")
            return
        end

        local start_digit = tonumber(first_char)
        local count = (end_line - start_line + 1) * (col_end - col_start + 1)
        local numbers = {}

        for i = 0, count - 1 do
            table.insert(numbers, tostring(start_digit + i))
        end

        local num_idx = 1
        for line_num = start_line, end_line do
            local line = vim.fn.getline(line_num)
            local width = col_end - col_start + 1
            local line_numbers = {}

            for _ = 1, width do
                if num_idx <= #numbers then
                    table.insert(line_numbers, numbers[num_idx])
                    num_idx = num_idx + 1
                end
            end

            local result = table.concat(line_numbers, "")
            local new_line = line:sub(1, col_start - 1) .. result .. line:sub(col_end + 1)
            vim.fn.setline(line_num, new_line)
        end

    elseif mode == 'v' or mode == 'V' then
        if start_line ~= end_line then
            print("Multi-line selection only supported in visual block mode (Ctrl-v)")
            return
        end

        local line = vim.fn.getline(start_line)
        local selected = line:sub(start_col, end_col)

        local first_char = selected:sub(1, 1)
        if selected:match("^" .. first_char .. "+$") and first_char:match("%d") then
            local start_digit = tonumber(first_char)
            local count = #selected
            local result = ""

            for i = 0, count - 1 do
                result = result .. tostring(start_digit + i)
            end

            local new_line = line:sub(1, start_col - 1) .. result .. line:sub(end_col + 1)
            vim.fn.setline(start_line, new_line)
        else
            print("Selection must be repeated single digit")
        end
    end
end

vim.api.nvim_create_user_command('TransformDigits', transform_repeated_digits, { range = true })
vim.keymap.set('v', '<leader>ms', ':TransformDigits<CR>', { noremap = true, silent = true, desc = 'Make sequence from repeated digits' })
