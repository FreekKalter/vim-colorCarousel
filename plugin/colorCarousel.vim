
let s:lightIndex = -1
let s:darkIndex = -1
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
        if s:lightIndex == -1
            let s:lightIndex = 0
        elseif index(s:lightArray, g:colors_name) != -1 && background == 'light' " current color is light
            let s:lightIndex += 1
        endif

        " rotate all themes in list
        if s:lightIndex > len(s:lightArray)-1
            let s:lightIndex = 0
        endif

        execute 'colorscheme ' .  s:lightArray[s:lightIndex]
        let g:CURRENTCOLOR = s:lightArray[s:lightIndex]
    else
        set background=dark
        if s:darkIndex == -1
            let s:darkIndex = 0
        elseif index(s:darkArray, g:colors_name) != -1 && background == 'dark' " current color is dark
            let s:darkIndex += 1
        endif

        " rotate all themes in list
        if s:darkIndex > len(s:darkArray)-1
            let s:darkIndex = 0
        endif

        execute 'colorscheme ' .  s:darkArray[s:darkIndex]
        let g:CURRENTCOLOR = s:darkArray[s:darkIndex]
    endif

    redraw
    echo g:colors_name
endfunction
