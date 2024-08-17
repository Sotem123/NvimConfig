local mod = {};

function mod.GetBufferSelection()
    local _, line1, col1, _ = table.unpack(vim.fn.getpos("'<"))
    local _, line2, col2, _ = table.unpack(vim.fn.getpos("'>"))

    -- Adjust col2 to include the last character if the visual selection ends at the end of the line
    if col2 == vim.fn.col('$') - 1 then
        col2 = col2 + 1
    end

    -- Get the lines in the selection
    local lines = vim.fn.getline(line1, line2)

    -- If the selection is on one line, trim the text to the selected columns
    if #lines == 1 then
        lines[1] = string.sub(lines[1], col1, col2)
    else
        -- Trim the first and last lines to the selected columns
        lines[1] = string.sub(lines[1], col1)
        lines[#lines] = string.sub(lines[#lines], 1, col2)
    end

	return lines;
end

return mod;
