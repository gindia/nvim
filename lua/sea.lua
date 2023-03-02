-- vim :set sw=2:
function floating_make_run()
    buffer = vim.api.nvim_create_buf(false, true) -- scratch

    vim.api.nvim_buf_set_lines(buffer, 0, -1, true, {})

    opts = {
        relative= 'editor',

        width=  100,
        height= 50,

        row= 5,
        col= 10,

        focusable= true,

        style= 'minimal',
        border='rounded',
    }

    window = vim.api.nvim_open_win(buffer, true, opts)

    vim.api.nvim_win_set_option(window, 'winhl', 'Normal:MyHighlight')
    vim.cmd([[term make run]])
end
