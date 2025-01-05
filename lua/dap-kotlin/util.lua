local M = {}

local path_sep = vim.loop.os_uname().sysname == "Windows" and "\\" or "/"

---Joins given strings together using system's path separator
---@vararg string path segments to join together
---@return string joined path
function M.path_join(...)
    return table.concat(vim.tbl_flatten({ ... }), path_sep)
end

function M.get_package()
    local file_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:h")
    local sub_path = string.match(
        file_path,
        "src" .. path_sep .. "[^%s]+" .. path_sep .. "kotlin" .. path_sep .. "(.*)"
    )
    return (sub_path:gsub("%/", "."))
end

return M
