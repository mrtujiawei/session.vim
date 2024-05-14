" session 管理
"
" Maintainer:  tujiawei <jiaweitu@marchthepolo.com>
" Last Change: 2023-09-06

if exists('g:session_load_autoload')
  finish
endif

let g:session_load_autoload = 1

let s:session_dir = expand('$HOME/.vim/.session/')
let s:session_delete_after_load = 1

if exists('g:session_dir')
  let s:session_dir = g:session_dir
endif

if exists('g:session_delete_after_load')
  let s:session_load_after_delete = g:session_delete_after_load
endif

" 如果目录不存在则新建
if !isdirectory(s:session_dir)
  silent call mkdir(s:session_dir, 'p')
endif

" 保存 session
func! session#save(filename)
  exec "mksession! " . s:session_dir . a:filename
endfunc

" 删除 session
func! session#delete(filename)
  call delete(s:session_dir . a:filename)
endfunc

" 获取已存的 session 列表
func! session#get_list(A, L, P)
  let l:sessions = glob(s:session_dir . '*', 0, 1)

  let l:index = 0
  for l:session in l:sessions 
    let l:paths = split(l:session, '/')
    let l:sessions[l:index] = l:paths[len(l:paths) - 1]
    let l:index = l:index + 1
  endfor

  return l:sessions
endfunc

" 加载 session
func! session#load(filename)
  let l:file = s:session_dir . a:filename

  if filereadable(l:file)
    exec 'source ' . l:file
    if s:session_delete_after_load == 1
      call session#delete(a:filename)
    endif
  else
    echo '文件不存在'
  endif
endfunc

