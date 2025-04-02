" ==================
" CoC Configurations
" ==================

" Coc Git bindings
nnoremap <leader>gb :CocCommand git.showBlameDoc<CR>|  " git blame
nnoremap <leader>gi :CocCommand git.chunkInfo<CR>|     " git chunk info
nnoremap ]g :CocCommand git.nextChunk<CR>|             " git next chunk
nnoremap [g :CocCommand git.prevChunk<CR>|             " git prev chunk
nnoremap <leader>go :CocCommand git.browserOpen<CR>|   " open current line in browser
nnoremap <leader>gc :CocCommand git.copyPermalink<CR>| " copy current line permalink

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>fo <Plug>(coc-format-selected)
nmap <leader>fo <Plug>(coc-format-selected)

" Setup formatexpr specified filetype(s)
augroup cocformatgroup
  autocmd!
  autocmd FileType git,vim,json,yaml,toml,sh,bash,zsh,java,python setl formatexpr=CocAction('formatSelected')
augroup end

" Code actions
" For e.g. `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)| " Apply code actions to the selected code block
nmap <leader>a  <Plug>(coc-codeaction-selected)| " Apply code actions to the indicated code block
nmap <leader>ac <Plug>(coc-codeaction-cursor)|   " Apply code actions at the cursor position
nmap <leader>as <Plug>(coc-codeaction-source)|   " Apply code actions on the whole buffer
nmap <leader>qf <Plug>(coc-fix-current)|         " Apply the most preferred quickfix on current line

" Run the Code Lens action on the current line
nmap <leader>ol <Plug>(coc-codelens-action)

" Map function and class text objects
" Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-d> and <C-u> to scroll float windows/popups
nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OrganizeImports` command for organize imports of the current buffer
command! -nargs=0 OrganizeImports :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" CoCList Mappings
nnoremap <silent><nowait> <space>d :CocList diagnostics<cr>| " Show all diagnostics
nnoremap <silent><nowait> <space>e :CocList extensions<cr>|  " Manage extensions
nnoremap <silent><nowait> <space>c :CocList commands<cr>|    " Show commands
nnoremap <silent><nowait> <space>o :CocList outline<cr>|     " Find symbol of current document
nnoremap <silent><nowait> <space>s :CocList -I symbols<cr>|  " Search workspace symbols
nnoremap <silent><nowait> <space>j :CocNext<CR>|             " Do default action for next item
nnoremap <silent><nowait> <space>k :CocPrev<CR>|             " Do default action for previous item
nnoremap <silent><nowait> <space>p :CocListResume<CR>|       " Resume latest coc list
