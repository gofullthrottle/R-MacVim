# R-MacVim
A simple R plugin for MacVim.

## What is it?
- It is a R plugin for MacVim.
- It allows you
 - to send selected lines and function to R (by CMD+r or \r).
 - to source the whole R file (by CMD+R or \R). 
 - to change your working directory (by CMD+d or \d).
 - to comment or uncomment single or multiple lines (by CMD+3 or \3).
- Key maps are changable (see below).
- For development and bug reports:
 http://github.com/randy3k/r-macvim
- Stable updates will be uploaded to:
 http://www.vim.org/scripts/script.php?script_id=4215
- This plugin aims at being simple. 
For more complete plugin, see:
 - vim-r-plugin, vimscript#2628

## Installation
- Copy the file r.vim to ~/.vim/ftplugin/
- You can change the key mappings by

        let g:r_macvim_RSource     = '<D-R>'
        let g:r_macvim_RSend       = '<D-r>'
        let g:r_macvim_RChgWorkDir = '<D-d>'
        let g:r_macvim_RComment    = '<D-3>'

- If you want to use R.app instead of R64.app, also add the following to your .vimrc file:

        let g:r_macvim_use32 = 1

- For >= R 3.0.0, this script is not working, a quick fix is to add this

        let g:r_macvim_use32 = 1
