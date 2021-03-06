" Vim syntax file
" Language: Essbase script
" Maintainer: Anthony Yuan <yyq123@gmail.com> <http://yyq123.blogspot.com/>
" Last change: 2011 Jan 21	
" Based on: Raul Segura Acevedo <raulseguraaceved@netscape.net> Last change:	2001 Sep 25

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" folds: fix/endfix and comments
sy	region	EssFold start="\<Fix" end="EndFix" transparent fold

sy	keyword	cscTodo contained TODO FIXME XXX

" cscCommentGroup allows adding matches for special things in comments
sy	cluster cscCommentGroup contains=cscTodo

" Strings in quotes
sy	match	cscError	'"'
sy	match	cscString	'"[^"]*"'

"when wanted, highlight trailing white space
if exists("csc_space_errors")
	if !exists("csc_no_trail_space_error")
		sy	match	cscSpaceE	"\s\+$"
	endif
	if !exists("csc_no_tab_space_error")
		sy	match	cscSpaceE	" \+\t"me=e-1
	endif
endif

"catch errors caused by wrong parenthesis and brackets
sy	cluster	cscParenGroup	contains=cscParenE,@cscCommentGroup,cscUserCont,cscBitField,cscFormat,cscNumber,cscFloat,cscOctal,cscNumbers,cscIfError,cscComW,cscCom,cscFormula,cscBPMacro
sy	region	cscParen	transparent start='(' end=')' contains=ALLBUT,@cscParenGroup
sy	match	cscParenE	")"

"integer number, or floating point number without a dot and with "f".
sy	case	ignore
sy	match	cscNumbers	transparent "\<\d\|\.\d" contains=cscNumber,cscFloat,cscOctal
sy	match	cscNumber	contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
sy	match	cscNumber	contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
sy	match	cscOctal	contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>"
sy	match	cscFloat	contained "\d\+f"
"floating point number, with dot, optional exponent
sy	match	cscFloat	contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
sy	match	cscFloat	contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
sy	match	cscFloat	contained "\d\+e[-+]\=\d\+[fl]\=\>"

sy	region	cscComment	start="/\*" end="\*/" contains=@cscCommentGroup,cscSpaceE fold
sy	match	cscCommentE	"\*/"

sy	match	cscFix	"FIX\|ENDFIX"

"substitution variable
sy	region	cscSubVar	start="&" end="\>"he=s-1 

"environment variable
sy	region	cscEnvVar	start="$" end="\>"he=s-1 



"cross-dimension operator
sy	match	cscCrossDimen	"->"

"sy	keyword	cscIfError	IF ELSE ENDIF ELSEIF
sy	keyword	cscCondition	IF ELSE ENDIF ELSEIF
sy	keyword	cscCondition	contained IF ELSE ENDIF ELSEIF
sy	keyword	cscFunction	contained VARPER VAR UDA TRUNCATE SYD SUMRANGE SUM CALCMODE
sy	keyword	cscFunction	contained STDDEVRANGE STDDEV SPARENTVAL SLN SIBLINGS SHIFT
sy	keyword	cscFunction	contained SANCESTVAL RSIBLINGS ROUND REMAINDER RELATIVE PTD
sy	keyword	cscFunction	contained PRIOR POWER PARENT PARENTVAL NPV NEXT MOD MINRANGE MIN
sy	keyword	cscFunction	contained MDSHIFT MDPARENTVAL MDANCESTVAL MAXRANGE MAX MATCH COUNT
sy	keyword	cscFunction	contained LSIBLINGS LEVMBRS LEV CURRMBR RANGE
sy	keyword	cscFunction	contained ISUDA ISSIBLING ISSAMELEV ISSAMEGEN ISPARENT ISMBR
sy	keyword	cscFunction	contained ISLEV ISISIBLING ISIPARENT ISIDESC ISICHILD ISIBLINGS
sy	keyword	cscFunction	contained ISIANCEST ISGEN ISDESC ISCHILD ISANCEST ISACCTYPE
sy	keyword	cscFunction	contained IRSIBLINGS IRR INTEREST INT ILSIBLINGS IDESCENDANTS RDESCENDANTS
sy	keyword	cscFunction	contained ICHILDREN IANCESTORS IALLANCESTORS
sy	keyword	cscFunction	contained ISATTRIBUTE 
sy	keyword	cscFunction	contained GROWTH GENMBRS GEN FACTORIAL DISCOUNT DESCENDANTS
sy	keyword	cscFunction	contained DECLINE CHILDREN CURRMBRRANGE CURLEV CURGEN
sy	keyword	cscFunction	contained COMPOUNDGROWTH COMPOUND AVGRANGE AVG ANCESTVAL
sy	keyword	cscFunction	contained ANCEST ANCESTORS ALLANCESTORS ACCUM ABS ATTRIBUTE ATTRIBUTEBVAL
sy	keyword	cscFunction	contained REMOVE LIST XREF
sy	keyword	cscFunction	contained MEMBER NAME CONCATENATE SUBSTRING
sy	keyword	cscFunction	contained @VARPER @VAR @UDA @TRUNCATE @SYD @SUMRANGE @SUM @CALCMODE
sy	keyword	cscFunction	contained @STDDEVRANGE @STDDEV @SPARENTVAL @SLN @SIBLINGS @SHIFT
sy	keyword	cscFunction	contained @SANCESTVAL @RSIBLINGS @ROUND @REMAINDER @RELATIVE @PTD
sy	keyword	cscFunction	contained @PRIOR @POWER @PARENT @PARENTVAL @NPV @NEXT @MOD @MINRANGE @MIN
sy	keyword	cscFunction	contained @MDSHIFT @MDPARENTVAL @MDALLOCATE @MDANCESTVAL @MAXRANGE @MAX @MATCH @COUNT
sy	keyword	cscFunction	contained @LSIBLINGS @LEVMBRS @LEV @LIST @CURRMBR @RANGE
sy	keyword	cscFunction	contained @ISUDA @ISSIBLING @ISSAMELEV @ISSAMEGEN @ISPARENT @ISMBR
sy	keyword	cscFunction	contained @ISLEV @ISISIBLING @ISIPARENT @ISIDESC @ISICHILD @ISIBLINGS
sy	keyword	cscFunction	contained @ISIANCEST @ISGEN @ISDESC @ISCHILD @ISANCEST @ISACCTYPE
sy	keyword	cscFunction	contained @IRSIBLINGS @IRR @INTEREST @INT @ILSIBLINGS @IDESCENDANTS @RDESCENDANTS
sy	keyword	cscFunction	contained @ICHILDREN @IANCESTORS @IALLANCESTORS
sy	keyword	cscFunction	contained @ISATTRIBUTE 
sy	keyword	cscFunction	contained @GROWTH @GENMBRS @GEN @FACTORIAL @DISCOUNT @DESCENDANTS
sy	keyword	cscFunction	contained @DECLINE @CHILDREN @CURRMBRRANGE @CURLEV @CURGEN
sy	keyword	cscFunction	contained @COMPOUNDGROWTH @COMPOUND @AVGRANGE @AVG @ANCESTVAL
sy	keyword	cscFunction	contained @ANCEST @ANCESTORS @ALLANCESTORS @ACCUM @ABS @ATTRIBUTE @ATTRIBUTEBVAL
sy	keyword	cscFunction	contained @REMOVE @RETURN
sy	keyword	cscFunction	contained @MEMBER @NAME @CONCATENATE @SUBSTRING
sy	keyword	cscFunction	contained @XREF @XWRITE
sy	match	cscFunction	contained "@"
sy	match	cscError	"@\s*\a*" contains=cscFunction

sy	region	cscLocal	start="//ESS_LOCALE" end="@Binary"

"sy	match	cscStatement	"&"

sy	keyword	cscStatement	AGG ARRAY VAR CCONV CLEARDATA DATACOPY RUNJAVA
sy	keyword	cscCom	LOOP ENDLOOP

sy	match	cscComE	contained "^\s*CALC.*"
sy	match	cscComE	contained "^\s*CLEARBLOCK.*"
sy	match	cscComE	contained "^\s*SET.*"
sy	match	cscComE	contained "^\s*FIX"
sy	match	cscComE	contained "^\s*ENDFIX"
sy	match	cscComE	contained "^\s*ENDLOOP"
sy	match	cscComE	contained "^\s*LOOP"

sy	match	cscComW	"^\s*CALC.*"
sy	match	cscCom	"^\s*CALC\s*ALL"
sy	match	cscCom	"^\s*CALC\s*AVERAGE"
sy	match	cscCom	"^\s*CALC\s*DIM"
sy	match	cscCom	"^\s*CALC\s*FIRST"
sy	match	cscCom	"^\s*CALC\s*LAST"
sy	match	cscCom	"^\s*CALC\s*TWOPASS"

sy	match	cscComW	"^\s*CLEARBLOCK.*"
sy	match	cscCom	"^\s*CLEARBLOCK\s\+ALL"
sy	match	cscCom	"^\s*CLEARBLOCK\s\+UPPER"
sy	match	cscCom	"^\s*CLEARBLOCK\s\+NONINPUT"

sy	match	cscComW	"^\s*\<SET.*"
sy	match	cscCom	"^\s*\<SET\s\+Commands"
sy	match	cscCom	"^\s*\<SET\s\+AGGMISSG"
sy	match	cscCom	"^\s*\<SET\s\+CACHE"
sy	match	cscCom	"^\s*\<SET\s\+CALCHASHTBL"
sy	match	cscCom	"^\s*\<SET\s\+CALCPARALLEL"
sy	match	cscCom	"^\s*\<SET\s\+CALCTASKDIMS"
sy	match	cscCom	"^\s*\<SET\s\+CCTRACKCALC"
sy	match	cscCom	"^\s*\<SET\s\+CLEARUPDATESTATUS"
sy	match	cscCom	"^\s*\<SET\s\+CREATEBLOCKONEQ"
sy	match	cscCom	"^\s*\<SET\s\+CREATEONMISSINGBLK"
sy	match	cscCom	"^\s*\<SET\s\+FRMLBOTTOMUP"
sy	match	cscCom	"^\s*\<SET\s\+LOCKBLOCK"
sy	match	cscCom	"^\s*\<SET\s\+MSG"
sy	match	cscCom	"^\s*\<SET\s\+NOTICE"
sy	match	cscCom	"^\s*\<SET\s\+UPDATECALC"
sy	match	cscCom	"^\s*\<SET\s\+UPTOLOCAL"

sy	keyword	cscBPMacro	contained !LoopOnAll !LoopOnLevel !LoopOnSelected
sy	keyword	cscBPMacro	contained !CurrentMember !LoopOnDimensions !CurrentDimension
sy	keyword	cscBPMacro	contained !CurrentOtherLoopDimension !LoopOnOtherLoopDimensions
sy	keyword	cscBPMacro	contained !EndLoop !AllMembers !SelectedMembers !If !Else !EndIf
sy	keyword	cscBPMacro	contained LoopOnAll LoopOnLevel LoopOnSelected
sy	keyword	cscBPMacro	contained CurrentMember LoopOnDimensions CurrentDimension
sy	keyword	cscBPMacro	contained CurrentOtherLoopDimension LoopOnOtherLoopDimensions
sy	keyword	cscBPMacro	contained EndLoop AllMembers SelectedMembers If Else EndIf
sy	match	cscBPMacro	contained	"!"
sy	match	cscBPW	"!\s*\a*"	contains=cscBPmacro

" when wanted, highlighting lhs members or erros in asignments (may lag the editing)
if version >= 600 && exists("csc_asignment")
	sy	match	cscEqError	'\("[^"]*"\s*\|[^][\t !%()*+,--/:;<=>{}~]\+\s*\|->\s*\)*=\([^=]\@=\|$\)'
	sy	region	cscFormula	transparent matchgroup=cscVarName start='\("[^"]*"\|[^][\t !%()*+,--/:;<=>{}~]\+\)\s*=\([^=]\@=\|\n\)' skip='"[^"]*"' end=';' contains=ALLBUT,cscFormula,cscFormulaIn,cscBPMacro,cscCondition
	sy	region	cscFormulaIn	matchgroup=cscVarName transparent start='\("[^"]*"\|[^][\t !%()*+,--/:;<=>{}~]\+\)\(->\("[^"]*"\|[^][\t !%()*+,--/:;<=>{}~]\+\)\)*\s*=\([^=]\@=\|$\)' skip='"[^"]*"' end=';' contains=ALLBUT,cscFormula,cscFormulaIn,cscBPMacro,cscCondition contained
	sy	match	cscEq	"=="
endif

if !exists("csc_minlines")
	let csc_minlines = 50	" mostly for () constructs
endif
exec "sy sync ccomment cscComment minlines=" . csc_minlines

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_csc_syntax_inits")
	if version < 508
		let did_csc_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	hi cscVarName term=bold ctermfg=9 gui=bold guifg=blue
	hi cscCondition ctermfg=lightcyan guifg=#E0FFFF
	hi cscFix ctermfg=cyan guifg=#00FFFF

	HiLink	cscNumber	Number
	HiLink	cscOctal	Number
	HiLink	cscFloat	Float
	HiLink	cscParenE	Error
	HiLink	cscCommentE	Error
	HiLink	cscSpaceE	Error
	HiLink	cscError	Error
	HiLink	cscString	String
	HiLink	cscComment	Comment
	HiLink	cscTodo		Todo
	HiLink	cscStatement	Statement
	HiLink	cscIfError	Error
	HiLink	cscEqError	Error
	HiLink	cscFunction	Statement
	HiLink	cscWarn		WarningMsg

	HiLink	cscComE	Error
	HiLink	cscCom	Statement
	HiLink	cscComW	WarningMsg

	HiLink	cscBPMacro	Identifier
	HiLink	cscBPW		WarningMsg

	HiLink	cscLocal	Comment	
	HiLink	cscSubVar	Identifier
	HiLink	cscEnvVar	Identifier
	HiLink	cscCrossDimen	Special

	delcommand HiLink
endif

" Set syntax name
let b:current_syntax = "csc"

" vim: ts=8
