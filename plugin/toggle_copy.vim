" Toggle mouse and line numbering for copying
" Maintainer: Charles LeDoux chaz8705@gmail.com
" Version: Vim 7
" URL: https://github.com/karategeek6/vim-togglecopy
" 
" Forked from vim-togglemouse. Information below:
" Toggle mouse plugin for quickly toggling mouse between Vim and terminal
" Maintainer:   Vincent Driessen <vincent@datafox.nl>
" Version:      Vim 7 (may work with lower Vim versions, but not tested)
" URL:          http://github.com/nvie/vim-togglemouse
"
" Only do this when not done yet for this buffer
if exists("b:loaded_toggle_mouse_plugin")
    finish
endif
let b:loaded_toggle_mouse_plugin = 1

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

fun! s:ToggleCopy()
    call s:ToggleMouse()
    set number!
endfunction

" Add mappings, unless the user didn't want this.
" The default mapping is registered under to <F3> by default, unless the user
" remapped it already (or a mapping exists already for <F3>)
if !exists("no_plugin_maps") && !exists("no_toggle_mouse_maps")
    if !hasmapto('<SID>ToggleCopy()')
        noremap <F3> :call <SID>ToggleCopy()<CR>
        inoremap <F3> <Esc>:call <SID>ToggleCopy()<CR>
    endif
endif
