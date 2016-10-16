" Gaussian VIM highlight file
" Language:         Gaussian
" Maintainer:       Xiaoge Su (magichp@gmail.com)
" Last Revision:    Sun 14 Aug 2016 04:07:58 PM PDT
" Version:          0.1

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

let b:current_syntax = "gaussian09"


" Gaussian 09 input file is NOT case sensitive.
syntax case ignore

" Keywords

" Comments always starts with !, like FORTRAN
syntax match gaussianComment /!.\+$/
highlight link gaussianComment Comment

" Keywords in Route instructions
syntax keyword gaussianRouteCommands contained
    \ admp am1 amber
    \ b3lyp bd bomd
    \ cachesize casscf cbsextrapolate ccd ccsd charge chkbasis cid cisd
    \ cis cndo complex constants counterpoise cphf
    \ density densityfit dftb dreiding eomccsd ept extendedhuckel
    \ external extrabasis extradensitybasis
    \ field fmm force freq
    \ gen genecp genchk geom gfinput gfprint guess gvb
    \ hf huckel
    \ indo integral iop irc ircmax
    \ lsda
    \ maxdisk mindo3 mindo name nmr nodensityfit
    \ oniom opt output ovgf
    \ pbc pm3 pm6 polar population pressure prop pseudo punch
    \ qcisd
    \ restart route sac scale scan scf scrf sp sparse stable symmetry
    \ td temperature text testmo trackio transformation
    \ uff units
    \ volume
    \ zindo
syntax region gaussianRoutes start=/^#/ end=/^$/
    \ contains=gaussianRouteCommands

highlight link gaussianRouteCommands Keyword
highlight link gaussianRoutes PreProc
"
" Preprocesses, i.e. in LINK0
syntax match gaussianLinkCommand /^--LINK1--$/
syntax keyword gaussianLink0Commands contained
    \ mem chk oldchk rwf int d2e kjob save nosave subst nprocshared
    \ nproc lindaworkers usessh debuglinda
syntax match gaussianLink0 /^%.\+$/ contains=gaussianLink0Commands

highlight link gaussianLinkCommand PreProc
highlight link gaussianLink0 PreProc
highlight link gaussianLink0Commands Keyword
