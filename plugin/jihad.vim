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
    \    'module':      substitute(l:class, '.*_Modules_\([^_]*\)_.*', '\1', 'g'),
    \   'module_lower': substitute(l:class, '.*_Modules_\([^_]*\)_.*', '\L\1', 'g'),
    \}

    return l:data[a:type]
endfunction
