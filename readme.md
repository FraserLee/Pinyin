# Pinyin.vim

I kinda want to learn Chinese, so I wrote this to help write vowel tones.

<br><br>
## Usage


In insert mode, press `<ctrl>[h,j,k,l]` to insert one of four tone mark on the
most recent `a`, `e`, `i`, `o`, or `u`. This can be done either during or after
after typing the word, so `Biānchéng` can be typed either as


```
Bia <ctrl>h nche <ctrl>j ng
```
or
```
Biancheng <ctrl>j <ctrl>h
```

`v` is a special case, auto-correcting to `ü` on the first `<ctrl>key` and 
one of `ǖ`, `ǘ`, `ǚ`, or `ǜ` on the second.


<br><br>
## Configuration

To change the keys used for tones, add a line like the following to your `.vimrc`
```vim
let g:pinyin_keys = ['h','j','k','l']
```

Unfortunately due to a bit of an issue with the way vim works, `<ctrl>[1-4]`
can't be used at the moment.

<br><br>
## Installation

If you're reading this you've probably already got a plugin manager. If not, I
recommend [Vim-Plug](https://github.com/junegunn/vim-plug), but they're essentially
interchangeable. Add the appropriate line in the appropriate spot in your
`.vimrc` file.

```vim
" vim-plug
Plug 'FraserLee/Pinyin'

" vundle
Plugin 'FraserLee/Pinyin'

" packer.nvim
use 'FraserLee/Pinyin'

" etc...
```

Run your version of `:PlugInstall` and things should be good to go.
