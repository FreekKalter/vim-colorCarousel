*colorCarousel.txt* easily switch between a set of dark and light colorschemes

# Usage

With this plugin you can cycle quickly through two list of colorschemes, one
with dark ones and one with lights.
The supplied function `ColorCarouselNextColor()` does the switching.
Call this function with either 'light' or 'dark', to switch light and dark
themes respectively.

In your vimrc file set two lists of colorschemes *g:lightColorCarousel* ,
*g:darkColorCarousel* to use with this plugin.

# Configuration

You specify the lists to cycle through in two global vars. For example, add
this to your .vimrc:

    let g:lightColorCarousel = [ 'pyte' ,  'ironman' , 'summerfruit256' ]
    let g:darkColorCarousel = [ 'codeschool' , 'jellybeans' , 'grb256' ]

If you would like it to remember the last used colorscheme when closing and
restarting vim add this too:

    " set the colorscheme used in last session
    autocmd VimEnter * execute 'colorscheme ' . g:CURRENTCOLOR
    " Save global vars in between startups
    set viminfo+=!
    " keep current colorscheme when reloading vimrc
    if exists("g:CURRENTCOLOR") == 1
       execute 'colorscheme ' . g:CURRENTCOLOR
    endif

When you use the above lines to load the last selected colorscheme don't
manualy specify a 'colorscheme' in your *.vimrc*.

# Mappings

You can map to the function like this:

    nnoremap <F8> :call ColorCarouselNextColor('light')<cr>
    nnoremap <F9> :call ColorCarouselNextColor('dark')<cr>

This maps cycling throug light colorschemes to *F8*. And maps *F9* to the dark
ones.


# License

Copyright (c) 2013 Freek Kalter
Use of this source code is governed by the "Revised BSD License" that can be
found in the LICENSE file.
