nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>ph :lua require('telescope.builtin').find_files({ hidden=true })<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>pe :lua require('session-lens').search_session()<CR>

nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

