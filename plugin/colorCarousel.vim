
let s:currentLight = -1
let s:currentDark = -1
if has('gui_running')
    let s:lightArray = g:lightColorCarousel
    let s:darkArray = g:darkColorCarousel
else
    let s:lightArray =g:terminalLightColorCarousel
    let s:darkArray = g:terminalDarkColorCarousel
endif

function! ColorCarouselNextColor( method )
    if a:method == 'light'
        set background=light
        if s:currentLight == -1
            let s:currentLight = 0
        elseif index(s:lightArray, g:colors_name) != -1 " current color is light
            let s:currentLight += 1
        endif

        " rotate all themes in list
        if s:currentLight > len(s:lightArray)-1
            let s:currentLight = 0
        endif

        execute 'colorscheme ' .  s:lightArray[s:currentLight]
        let g:CURRENTCOLOR = s:lightArray[s:currentLight]
    else
        set background=dark
        if s:currentDark == -1
            let s:currentDark = 0
        elseif index(s:darkArray, g:colors_name) != -1 " current color is dark
            let s:currentDark += 1
        endif

        " rotate all themes in list
        if s:currentDark > len(s:darkArray)-1
            let s:currentDark = 0
        endif

        execute 'colorscheme ' .  s:darkArray[s:currentDark]
        let g:CURRENTCOLOR = s:darkArray[s:currentDark]
    endif

    redraw
    echo g:colors_name
endfunction
