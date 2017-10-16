; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/x86_64 Assembly.sublime-syntax"

%if<condition> 
;<- punctuation.definition.keyword.preprocessor
;^^ keyword.control.preprocessor
%elif<condition2> 
;<- punctuation.definition.keyword.preprocessor
;^^^^ keyword.control.preprocessor
%else 
;<- punctuation.definition.keyword.preprocessor
;^^^^ keyword.control.preprocessor
%endif

%else
;^^^^ invalid.illegal
%elif
;^^^^ invalid.illegal
%endif
;^^^^^ invalid.illegal

%ifn
;<- punctuation.definition.keyword.preprocessor
;^^^ keyword.control.preprocessor
%elifn 
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor

%ifdef DEBUG
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor
;      ^^^^^ entity.name.constant
    push %1
;   ^^^^ keyword.operator.word.mnemonic
;         ^ invalid.illegal
;^^^^^^^^^^ meta.block
%else
;<- punctuation.definition.keyword.preprocessor
;^^^^ keyword.control.preprocessor
    push %2
;   ^^^^ keyword.operator.word.mnemonic
;         ^ invalid.illegal
;^^^^^^^^^^ meta.block
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor

%macro mymacro 2
%ifdef DEBUG
    push %1
;   ^^^^ keyword.operator.word.mnemonic
;         ^ variable.other.preprocessor
;^^^^^^^^^^ meta.block
%else
    push %2
;         ^ variable.other.preprocessor
;^^^^^^^^^^ meta.block
%endif
%endmacro

%ifmacro MyMacro 1-3+.nolist
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor
;        ^^^^^^^ entity.name.function.preprocessor
;                ^^^ variable.parameter.preprocessor
     %error "MyMacro 1-3" causes a conflict with an existing macro. 
%else 
     %macro MyMacro 1-3+.nolist
             ; insert code to define the macro 
     %endmacro 
%endif
