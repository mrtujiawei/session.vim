# session

会话管理

```vimscript
" 自动保存session
let g:session_auto_save = 1

" 禁止加载插件
let g:session_load = 1

" 禁止添加 command
let g:session_auto_command = 0

" session 文件保存地址
let g:session_dir = '$HOME/.vim/session/'

" 加载 session 后保留 session 文件, 默认删除
let g:session_delete_after_load = 0
```
