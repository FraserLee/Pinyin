function! InsertToneMark(tone_num)
    " save the current cursor position
    let c_row = line(".")
    let c_col = col(".")

    " move to the most recent vowel at or before the cursor
    let vowel_pos = search("[AEIOUVaeiouv]", "bW")
    if vowel_pos == 0 | return | endif " no vowel found, return

    let v_row = line(".")
    let v_col = col(".")

    " grab the vowel
    let c = matchstr(getline(v_row), '\%' . v_col . 'c.')

    let tone_mark = {
        \ 'a' : ['ā', 'á', 'ǎ', 'à'], 'A' : ['Ā', 'Á', 'Ǎ', 'À'],
        \ 'e' : ['ē', 'é', 'ě', 'è'], 'E' : ['Ē', 'É', 'Ě', 'È'],
        \ 'i' : ['ī', 'í', 'ǐ', 'ì'], 'I' : ['Ī', 'Í', 'Ǐ', 'Ì'],
        \ 'o' : ['ō', 'ó', 'ǒ', 'ò'], 'O' : ['Ō', 'Ó', 'Ǒ', 'Ò'],
        \ 'u' : ['ū', 'ú', 'ǔ', 'ù'], 'U' : ['Ū', 'Ú', 'Ǔ', 'Ù'],
        \
        \ 'v' : ['ü', 'ü', 'ü', 'ü'], 'V' : ['Ü', 'Ü', 'Ü', 'Ü'],
        \ 'ü' : ['ǖ', 'ǘ', 'ǚ', 'ǜ'], 'Ü' : ['Ǖ', 'Ǘ', 'Ǚ', 'Ǜ'],
    \ }[c][a:tone_num - 1]

    " insert the tone mark

    let line = getline(v_row)
    let line = line[:v_col - 2] . tone_mark . line[v_col:]
    call setline(v_row, line)
    
    " move the cursor back to where it started
    call cursor(c_row, c_col)
    return

endfunction

" defaults
let g:pinyin_keys = get(g:, 'pinyin_keys', ['h', 'j', 'k', 'l'])

" map bindings
for i in [1, 2, 3, 4]

    let key = g:pinyin_keys[i - 1]

            " there might be a better way to call this...
    execute "inoremap <C-" . key . "> <esc> :call InsertToneMark(" . i . ")<CR>a"

endfor

