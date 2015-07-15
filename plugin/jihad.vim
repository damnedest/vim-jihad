if exists("loaded_jihad")
  finish
endif

let loaded_jihad = 1

function JihadClassName()
    let l:path = expand('%:p')
    let l:path = substitute(l:path, '^\(.*/projects/\)', '', 'g')

    let l:class = substitute(l:path, '/', '_', 'g')
    let l:class = substitute(l:class, '\(\..*\)$', '', 'g')

    return l:class
endfunction

function JihadClassDescription()
    let l:path = expand('%:p')
    let l:path = substitute(l:path, '^\(.*/projects/\)', '', 'g')

    let l:description = substitute(l:path, '/', '_', 'g')
    let l:description = substitute(l:description, '\(\..*\)$', '', 'g')
    let l:description = substitute(l:description, '_', ' ', 'g')
    let l:description = substitute(l:description, '^\([^ ]*\) \(.*\)$', '\1 \L\2', 'g')

    return l:description
endfunction

function JihadClassPart(type)
    let l:class = JihadClassName()

    let l:data = {
    \   'module':       substitute(l:class, '.*_Modules_\([^_]*\).*', '\1', 'g'),
    \   'module_lower': substitute(l:class, '.*_Modules_\([^_]*\).*', '\L\1', 'g'),
    \   'type':         substitute(l:class, '.*_Modules_\([^_]*\)_\([^_]*\).*', '\2', 'g'),
    \   'type_lower':   substitute(l:class, '.*_Modules_\([^_]*\)_\([^_]*\).*', '\L\2', 'g'),
    \   'name':         substitute(l:class, '.*_Modules_\([^_]*\)_\([^_]*\)_\([^_]*\).*', '\3', 'g'),
    \   'name_lower':   substitute(l:class, '.*_Modules_\([^_]*\)_\([^_]*\)_\([^_]*\).*', '\L\3', 'g'),
    \}

    if l:data['name_lower'] == l:data['module_lower']
        let l:data.jihad_path = l:data['module_lower']
        let l:data.jihad_name = l:data['module_lower']
    else
        let l:data.jihad_path = l:data['module_lower'] . "->" . l:data['name_lower']
        let l:data.jihad_name = l:data['module_lower'] . "_" . l:data['name_lower']
    endif

    return l:data[a:type]
endfunction

function JihadProjectAuthor()
    return g:pdv_cfg_Author
endfunction

function! Run_handler_for_file(file, count)
endfunction

function! JihadRunHandlerForFile(file, count)
    if empty(a:file)
        " Todo use localised error messages
        echoerr "E446: No file name under cursor"
    else
        let tags = taglist("^" . a:file . "$")

        let handled = 0
        if len(tags) == 1
            echo "Normal"
            exe ":silent! tag " . a:file
            let handled = 1
        endif

        if !handled
            exe "normal! gf"
        endif
    endif
endfunction

noremap <silent> gf :<C-U>call JihadRunHandlerForFile(expand("<cfile>"),v:count)<cr>
