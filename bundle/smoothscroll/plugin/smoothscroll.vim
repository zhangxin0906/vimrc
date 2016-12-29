function SmoothScroll(up)
    if a:up
        let scrollaction="\<C-y>"
        let cursoraction="k"
    else
        let scrollaction="\<C-e>"
        let cursoraction="j"
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 10m
        redraw
        exec "normal " . scrollaction
        exec "normal " . cursoraction
    endwhile
endfunction

function EnableSmoothScroll()
    let g:smoothscroll_enabled = 1
    nnoremap <C-U> :call SmoothScroll(1)<Enter>
    nnoremap <C-D> :call SmoothScroll(0)<Enter>
endfunction

function DisableSmoothScroll()
    let g:smoothscroll_enabled = 0
    unmap <C-U>
    unmap <C-D>
endfunction

function ToggleSmoothScroll()
    if g:smoothscroll_enabled
        :call DisableSmoothScroll()
    else
        :call EnableSmoothScroll()
    endif
endfunction

let g:smoothscroll_enabled = get(g:, 'smoothscroll_enabled', 1)

if g:smoothscroll_enabled
    :call EnableSmoothScroll()
else
    :call DisableSmoothScroll()
endif
