" session 管理
"
" Maintainer:  tujiawei <jiaweitu@marchthepolo.com>
" Last Change: 2023-09-06

if !exists('g:session_load') || g:session_load == 1
  finish
endif

let g:session_load = 1

" 快捷键映射，还没想好用什么映射
if !exists('g:session_auto_map') || g:session_auto_map != 0

endif

" 命令
if !exists('g:session_auto_command') || g:session_auto_command != 0
  " 保存会话
  command! -n=1 -complete=customlist,session#get_list -bar SessionSave :call session#save(<f-args>)

  " 加载会话列表
  command! -n=1 -complete=customlist,session#get_list -bar SessionLoad :call session#load(<f-args>)

  " 删除会话
  command! -n=1 -complete=customlist,session#get_list -bar SessionDelete :call session#delete(<f-args>)
endif
