" Vim syntax file
" Language:	XHTML

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" we define it here so that included files can test for it
if !exists("main_syntax")
  let main_syntax='xhtml'
endif

if version < 600
  so <sfile>:p:h/html.vim
else
  runtime! syntax/html.vim
endif
unlet b:current_syntax
syn case match



syn region htmlTemplaterInsvar start=+{{+ keepend end=+}}+
"syn region htmlTemplaterInsvarh start=+<insvarh + keepend end=+>+
syn region htmlTemplaterInsblock start=+{{block+ keepend end=+}}+
syn region htmlTemplaterAction start=+{{action+ keepend end=+}}+
"syn region htmlTemplaterIF start=+<if + keepend end=+>+
"syn region htmlTemplateELSE start=+<else+ keepend end=+>+
"syn region htmlTemplateIFEND start=+</if+ keepend end=+>+
syn region htmlTemplaterSetBlock start=+{{setblock+ keepend end=+}}+
syn region htmlTemplaterSetBlockEnd start=+{{/setblock+ keepend end=+}}+


if version >= 508 || !exists("did_xhtml_syn_inits")
  if version < 508
    let did_xhtml_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink      htmlTemplaterInsvar       Preproc
  HiLink      htmlTemplaterInsvarh      Preproc
  HiLink      htmlTemplaterInsblock     DiffChange
  HiLink      htmlTemplaterAction       DiffChange
   HiLink 	htmlTemplaterSetBlock  DiffAdd
   HiLink 	htmlTemplaterSetBlockEnd  DiffAdd

  delcommand HiLink
endif


let b:current_syntax = "xhtml"

if main_syntax == 'xhtml'
  unlet main_syntax
endif
