let g:gstatus_flag = bufexists('.git/index')
let g:nerd_tree_flag = bufexists('NERD_tree_1')

" 1が実行中で0が非実行中
function! Call_nerd_tree_toggle()
  let g:gstatus_flag = bufexists('.git/index')
  if g:gstatus_flag == 1
    call Call_gstatus_toggle()
  endif
  NERDTreeToggle
endfunction


function! Call_gstatus_toggle()
  let g:nerd_tree_flag = bufexists('NERD_tree_1')
  if g:nerd_tree_flag == 1
    call Call_nerd_tree_toggle()
  endif
  if buflisted(bufname('.git/index'))
    bd .git/index
  else
    vertical Gstatus
  endif
endfunction

function! Echo_all()
  echo g:nerd_tree_flag
  echo g:gstatus_flag
  echo bufexists('NERD_tree_1')
  echo bufexists('.git/index')
endfunction

command! MyNtreeToggle call Call_nerd_tree_toggle()
command! MyGstatusToggle call Call_gstatus_toggle()


