-- a list of language servers to enable
local servers = {
    'clangd',
    'pyright',
    'tsserver',
    'rust_analyzer',
}

local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    buf_set_keymap('n', '<space>qf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>ee', '<cmd>Telescope diagnostics<CR>', opts)
    buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    buf_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]]
    vim.cmd [[ command! Cleanc :silent %s/\r//g ]]
end

-- vim.g.coq_settings = { auto_start = "shut-up" }

local lsp_config = require 'lspconfig'
local coq        = require 'coq'

for _, lsp in ipairs(servers) do
    lsp_config[lsp].setup( coq.lsp_ensure_capabilities {
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            }
        }
    )
end

-- lua server {{{

-- man stands for manual
-- local sumneko_root_path = "E:/ThirdParty/LuaLsp/bin"
-- local sumneko_binary = sumneko_root_path .. "/lua-language-server.exe"
--
-- -- Make runtime files discoverable to the server
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, 'lua/?.lua')
-- table.insert(runtime_path, 'lua/?/init.lua')
--
-- lsp_config.sumneko_lua.setup( coq.lsp_ensure_capabilities {
--         cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
--         on_attach = on_attach,
--         settings = {
--             Lua = {
--                 runtime = {
--                     -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                     version = 'LuaJIT',
--                     -- Setup your lua path
--                     path = runtime_path,
--                 },
--                 diagnostics = {
--                     -- Get the language server to recognize the `vim` global
--                     globals = { 'vim', 'use' },
--                 },
--                 workspace = {
--                     -- Make the server aware of Neovim runtime files
--                     library = vim.api.nvim_get_runtime_file('', true),
--                     checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
--                 },
--                 -- Do not send telemetry data containing a randomized but unique identifier
--                 telemetry = {
--                     enable = false,
--                 },
--             },
--         },
--     }
-- )
-- }}} lua server

-- java {{{
lsp_config.java_language_server.setup(
    coq.lsp_ensure_capabilities {
        cmd = { "E:/ThirdParty/java-language-server/dist/lang_server_windows.cmd" },
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
)
-- }}}

-- disable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
       virtual_text = false,
       signs = false,
       update_in_insert = false,
       underline = false,
    }
)
