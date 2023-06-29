#!/usr/local/guile -s
#!/usr/bin/racket

; 1 Introduction

; Guile is an implementation of the Scheme programming language.  Scheme
; (http://schemers.org/) is  an elegant and conceptually  simple dialect
; of  Lisp, originated  by  Guy  Steele and  Gerald  Sussman, and  since
; evolved by the  series of reports known as RnRS  (the Revisedn Reports
; on  Scheme).  Unlike,  for  example,  Python or  Perl,  Scheme has  no
; benevolent  dictator.  There  are many  Scheme  implementations,  with
; different characteristics and with communities and academic activities
; around them,  and the language develops  as a result of  the interplay
; between these.  Guile’s  particular characteristics are that   it is
; easy to combine  with other code written  in C  it  has a historical
; and  continuing  connection with  the  GNU  Project   it  emphasizes
; interactive  and  incremental  programming    it  actually  supports
; several languages,  not just  Scheme.  The  next few  sections explain
; what we  mean by these points.  The sections after that  cover how you
; can obtain and  install Guile, and the  typographical conventions that
; we use in  this manual.

; 1.1 Guile and Scheme  Guile implements Scheme

; as described in the Revised5 Report on the Algorithmic Language Scheme
; (usually known as R5RS), providing  clean and general data and control
; structures.  Guile  goes beyond the rather  austere language presented
; in  R5RS, extending  it with  a module  system, full  access to  POSIX
; system calls, networking support, multiple threads, dynamic linking, a
; foreign function call interface,  powerful string processing, and many
; other features needed for programming in the real world.  In 2007, the
; Scheme  community  agreed  upon  and  published  R6RS,  a  significant
; install-  ment  in the  RnRS  series.  R6RS  expands the  core  Scheme
; language,    and   standardises    many   non-core    functions   that
; implementations—including  Guile—have previously  done in  differ- ent
; ways. Over time,  Guile has been updated to incorporate  almost all of
; the features of R6RS, and to  adjust some existing features to conform
; to the R6RS  specification. See Section 7.6 [R6RS  Support], page 669,
; for full  details.  In  parallel to official  standardization efforts,
; the SRFI  process (http://srfi.schemers.org/)  standardises interfaces
; for  many  practical  needs,  such as  multithreaded  programming  and
; multidimensional arrays.  Guile supports many SRFIs,  as documented in
; detail in Section 7.5 [SRFI Support],  page 588.  The process that led
; to the  R6RS standard brought a  split in the Scheme  community to the
; surface.  The implementors  that  wrote R6RS  considered  that it  was
; impossible to write  useful, portable programs in R5RS,  and that only
; an ambitious standard  could solve this problem. However,  part of the
; Scheme world saw the R6RS effort  as too broad, and as having included
; some  components that  would  never be  adopted  by more  minimalistic
; Scheme implementations. This second  group succeeded in taking control
; of the  official Scheme standardization  track and in 2013  released a
; more  limited R7RS,  essentially  consisting of  R5RS,  plus a  module
; system. Guile supports R7RS also. See Section 7.7 [R7RS Support], page
; 712.4 Guile  Reference Manual With  R6RS and R7RS, the  unified Scheme
; standardization  process  appears  to  have   more  or  less  run  its
; course. There will  continue to be more code written  in terms of both
; systems, and  modules defined using  the SRFI process, and  Guile will
; support both.  However for future directions,  Guile takes inspiration
; from other  related language communities: Racket,  Clojure, Concurrent
; ML, and  so on.  In summary,  Guile supports writing and  running code
; written  to  the R5RS,  R6RS,  and  R7RS  Scheme standards,  and  also
; supports a  number of SRFI  modules. However  for most users,  until a
; need  for cross-implementation  portability  has  been identified,  we
; recommend using  the parts  of Guile  that are  useful in  solving the
; problem at hand, regardless of whether they proceed from a standard or
                                        ;
; 1.2 Combining with  C Code  Like a

; shell, Guile can run  interactively—reading expressions from the user,
; evaluating   them,  and   displaying  the   results—or  as   a  script
; interpreter, reading and executing Scheme code from a file. Guile also
; provides an  object library, libguile, that  allows other applications
; to easily  incorporate a  complete Scheme interpreter.  An application
; can then  use Guile  as an  extension language,  a clean  and powerful
; configuration  language,   or  as  multi-purpose   “glue”,  connecting
; primitives provided by the application. It is easy to call Scheme code
; from  C code  and vice  versa,  giving the  application designer  full
; control of  how and when  to invoke the interpreter.  Applications can
; add new functions, data types,  control structures, and even syntax to
; Guile, creating  a domain-specific  language tailored  to the  task at
; hand, but based on a robust language design.  This kind of combination
; is helped by four aspects of Guile’s design and history. First is that
; Guile has always  been targeted as an extension language.  Hence its C
; API  has always  been  of  great importance,  and  has been  developed
; accordingly. Second  and third are rather  technical points—that Guile
; uses  conservative  garbage collection,  and  that  it implements  the
; Scheme  concept of  continuations  by copying  and  reinstating the  C
; stack—but whose practical consequence is that most existing C code can
; be glued into Guile as is,  without needing modifications to cope with
; strange Scheme execution flows. Last is the module system, which helps
; extensions to coexist without stepping  on each others’ toes.  Guile’s
; module system allows  one to break up a large  program into manageable
; sections  with  well-defined  interfaces  between  them.  Modules  may
; contain  a mixture  of interpreted  and compiled  code; Guile  can use
; either static or dynamic linking to incorporate compiled code. Modules
; also encourage developers to package up useful collections of routines
; for  general distribution;  as of  this  writing, one  can find  Emacs
; interfaces,   database  access   routines,   compilers,  GUI   toolkit
; interfaces, and  HTTP client functions,  among others.  1.3  Guile and
; the GNU Project  Guile was conceived by the GNU  Project following the
; fantastic  success  of Emacs  Lisp  as  an extension  language  within
; Emacs.  Just   as  Emacs  Lisp  allowed   complete  and  unanticipated
; applications to be written within  the Emacs environment, the idea was
; that Guile should do the same for other GNU Project applications. This
; remains true today.   The idea of extensibility is  closely related to
; the   GNU  project’s   primary  goal,   that  of   promoting  software
; freedom.  Software  freedom means  that  people  receiving a  software
; package can  modify or enhance it  to their own desires,  including in
; ways that may not haveChapter 1: Introduction 5 occurred at all to the
; software’s  original developers.  For programs  written in  a compiled
; language like  C, this freedom  covers modifying and rebuilding  the C
; code; but if the program also  provides an extension language, that is
; usually a much friendlier and lower-barrier-of- entry way for the user
; to start making  their own changes.  Guile is now  used by GNU project
; applications such as AutoGen, Lilypond, Denemo, Mailutils, TeXmacs and
; Gnucash, and  we hope  that there  will be many  more in  future.  1.4
; Interactive Programming Non-free software has no interest in its users
; being able to see  how it works. They are supposed  to just accept it,
; or to report problems and hope that the source code owners will choose
; to work on them.  Free software aims  to work reliably just as much as
; non-free software does, but it should also empower its users by making
; its workings  available. This  is useful  for many  reasons, including
; education,  auditing  and  enhancements,  as  well  as  for  debugging
; problems.  The ideal  free software system achieves this  by making it
; easy for  interested users to see  the source code for  a feature that
; they are using,  and to follow through that  source code step-by-step,
; as  it runs.  In Emacs,  good  examples of  this are  the source  code
; hyperlinks in the help system, and  edebug. Then, for bonus points and
; maximising the  ability for the  user to experiment quickly  with code
; changes,  the system  should  allow parts  of the  source  code to  be
; modified  and reloaded  into the  running program,  to take  immediate
; effect.  Guile is  designed for this kind  of interactive programming,
; and  this  distinguishes  it  from many  Scheme  implementations  that
; instead  prioritise  running  a  fixed   Scheme  program  as  fast  as
; possible—because  there  are  tradeoffs between  performance  and  the
; ability  to modify  parts of  an  already running  program. There  are
; faster  Schemes  than  Guile,  but  Guile is  a  GNU  project  and  so
; prioritises the GNU vision of programming freedom and experimentation.

; 1.5  Supporting  Multiple Languages

;language to its core virtual machine  bytecode, and Scheme is just one
; of the supported languages.  Other supported languages are Emacs Lisp,
; ECMAScript (commonly known  as Javascript) and Brainfuck,  and work is
; under discussion for Lua, Ruby and  Python.  This means that users can
; program applications which use Guile  in the language of their choice,
;; them.

;; 1.6 Obtaining and Installing Guile

; Guile can be obtained from the main GNU archive site ftp://ftp.gnu.org
; or    any    of   its    mirrors.    The    file   will    be    named
; guile-version.tar.gz. The  current version is  3.0.9, so the  file you
; should  grab   is:  ftp://ftp.gnu.org/gnu/guile/guile-3.0.9.tar.gz  To
; unbundle Guile use the instruction


 ; zcat guile-3.0.9.tar.gz | tar xvf -


; hich  will  create  a  directory called  ‘guile-3.0.9’  with  all  the
; sources. You can look at  the file ‘INSTALL’ for detailed instructions
; on how to build  and install Guile, but you should be  able to just do

; cd guile-3.0.9
; ./configure make
; make install

; This will  install the
; Guile  executable ‘guile’,  the Guile  library ‘libguile’  and various
; associated header  files and support  libraries. It will  also install
; the Guile  reference manual.  Since  this manual frequently  refers to
; the Scheme “standard”, also known as  R5RS, or the “Revised5 Report on
; the Algorithmic Language  Scheme”, we have included the  report in the
; Guile distribution; see Section “Introduction” in Revised(5) Report on
; the Algorithmic Language  Scheme. This will also be  installed in your
; info directory.


; 1.7 Organisation of this Manual

; The rest of this manual is organised into the following chapters.

; Chapter 2: Hello Guile!

; A whirlwind tour  shows how Guile can be used  interactively and as a
; script interpreter, how to link  Guile into your own applications, and
; how to  write modules of  interpreted and  compiled code for  use with
; Guile. Everything in- troduced here is documented again and in full by
; the later parts of the manual.

; Chapter 3: Hello Scheme!

; For readers  new to Scheme,  this chapter provides an  introduction to
; the ba- sic ideas of the Scheme language. This material would apply to
; any Scheme implementation  and so does not make  reference to anything
; Guile-specific.


; Chapter 4: Programming in Scheme


; Provides an  overview of programming  in Scheme with Guile.  It covers
; how to invoke the guile program from the command-line and how to write
; scripts in Scheme. It also introduces the extensions that Guile offers
; beyond standard Scheme.

; Chapter 5: Programming in C


; Provides an overview of how to use  Guile in a C program. It discusses
; the fundamental  concepts that  you need to  understand to  access the
; features of Guile, such as dynamic types and the garbage collector. It
; explains in  a tutorial like manner  how to define new  data types and
; functions for the use by Scheme programs.


; Chapter 6: Guile API Reference



; This part of the manual documents the Guile API in functionality-based
; groups  with the  Scheme  and  C interfaces  presented  side by  side.
; Chapter 7: Guile Modules Describes some important modules, distributed
; as  part of  the  Guile distribution,  that  extend the  functionality
; provided by the Guile Scheme core.

;; Chapter 8: GOOPS

; Describes GOOPS, an  object oriented extension to  Guile that provides
; classes, multiple inheritance and generic functions.

; 1.8 Typographical Conventions

; In examples and procedure descriptions  and all other places where the
; evaluation of  Scheme expression  is shown, we  use some  notation for
; denoting the output and evaluation results of expressions.  The symbol
; ‘)’ is used to tell which vale is returned by an evaluation:

(+ 1 2)

; preview this:

; $1 = 3

; Some procedures produce some output besides returning a value. This is
; denoted by the symbol ‘ a ’.

(begin (display 1) (newline) 'hooray)

; 1
; $2 = hooray

; As you can see,  this code prints ‘1’ (denoted by ‘  a ’), and returns
; hooray (denoted by ‘)’).

; Hello Guile!

; This chapter presents a  quick tour of all the ways  that Guile can be
; used. There  are additional examples  in the ‘examples/’  directory in
; the Guile source distribution. It also explains how best to report any
; problems that you find.  The  following examples assume that Guile has
; been installed in /usr/local/.

; 2.1 Running Guile Interactively

; In its simplest form, Guile acts as an interactive interpreter for the
; Scheme programming language, reading and evaluating Scheme expressions
; the  user enters  from the  terminal.   Here is  a sample  interaction
; between Guile  and a user;  the user’s input  appears after the  $ and

; scheme@(guile-user)> prompts:

; $ guile
; scheme@(guile-user)> (+ 1 2 3)
; add some numbers
; $1 = 6
; scheme@(guile-user)> (define (factorial n)
; define a function
; (if (zero? n) 1 (* n (factorial (- n 1)))))
; scheme@(guile-user)> (factorial 20)
; $2 = 2432902008176640000
; scheme@(guile-user)> (getpwnam "root")
; look in /etc/passwd
; $3 = #("root" "x" 0 0 "root" "/root" "/bin/bash")
; scheme@(guile-user)> C-d
                                        ; $
; 2.2 Running Guile Scripts

; Like AWK,  Perl, or  any shell,  Guile can  interpret script  files. A
; Guile  script  is  simply  a  file of  Scheme  code  with  some  extra
; information at the  beginning which tells the operating  system how to
; invoke Guile,  and then  tells Guile  how to  handle the  Scheme code.
; Here is  a trivial  Guile script. See  Section 4.3  [Guile Scripting],
; page  41, for  more  details.

; #!/usr/local/bin/guile  -s !#

(display "Hello, world!")  (newline)

; 2.5 Using the Guile Module System

; Guile  has support  for  dividing  a program  into  modules. By  using
; modules,  you  can   group  related  code  together   and  manage  the
; composition  of complete  programs from  largely in-  dependent parts.
; For  more  details  on  the module  system  beyond  this  introductory
; material, See Section 6.18 [Modules], page 410.

; 2.5.1 Using Modules

; Guile  comes with  a lot  of useful  modules, for  example for  string
; processing  or command  line parsing.  Additionally, there  exist many
; Guile modules  written by other  Guile hackers,  but which have  to be
; installed manually.  Here  is a sample interactive  session that shows
; how  to use  the (ice-9  popen) module  which provides  the means  for
; communicating with other processes over pipes together with the (ice-9
; rdelim) module that provides the function read-line.

; $ guile
; scheme@(guile-user)> (use-modules (ice-9 popen))
; scheme@(guile-user)> (use-modules (ice-9 rdelim))
; scheme@(guile-user)> (define p (open-input-pipe "ls -l"))
; scheme@(guile-user)> (read-line p)
; $1 = "total 30"
; scheme@(guile-user)> (read-line p)
; $2 = "drwxr-sr-x
; 2 mgrabmue mgrabmue
; 1024 Mar 29 19:57 CVS

;; 2.5.2 Writing new Modules

; You can create new modules using the syntactic form define-module. All
; definitions  following  this form  until  the  next define-module  are
; placed into  the new module.   One module  is usually placed  into one
; file,  and that  file  is  installed in  a  location  where Guile  can
; automatically find it.  The following session shows  a simple example.

;$ cat /usr/local/share/guile/site/foo/bar.scm

;(define-module (foo bar)
;  #:export   (frob))
;(define    (frob   x)   (*   2    x))
;$   guile
;scheme@(guile-user)>  (use-modules   (foo  bar))
;scheme@(guile-user)>
;(frob 12) $1 = 24

(define-module (list args))
; $9 = #<directory (list args) 7f7a1896ee60>
(define (obj x) (* 2 x))

; 2.5.3 Putting Extensions into Modules

; In addition to Scheme code you can also put things that are defined in
; C into  a module.   You do this  by writing a  small Scheme  file that
; defines the  module and call load-  extension directly in the  body of
; the   module.
; $   cat   /usr/local/share/guile/site/math/bessel.scm
; (define-module   (math   bessel)
;  #:export   (j0))
; (load-extension  "libguile-bessel"  "init_bessel")
; $ file /usr/local/lib/guile/3.0/extensions/libguile-bessel.so ...  ELF 32-bit
; LSB shared object ...
; $ guile scheme@(guile-user)> (use-modules (math bessel))
; scheme@(guile-user)>  (j0  2)
; $1  =  0.223890779141236  See
                                        ; Section 6.19.2 [Foreign Extensions], page 430, for more informatio

(define-module (math args))

; 2.6 Reporting Bugs

; Any   problems   with  the   installation   should   be  reported   to
; bug-guile@gnu.org.  If  you find a bug  in Guile, please report  it to
; the Guile developers,  so they can fix  it.  They may also  be able to
; suggest  workarounds when  it is  not possible  for you  to apply  the
; bug-fix or install a new version of Guile yourself.  Before sending in
; bug reports, please check with the following list that you really have
; found a  bug.   Whenever  documentation and actual  behavior differ,
; you have certainly found a bug,  either in the documentation or in the
; program.   When Guile crashes, it is a bug.

;  When Guile hangs or takes forever to complete a task, it is a bug.
;  When calculations produce wrong results, it is a bug.
;  When Guile signals an error for valid Scheme programs, it is a bug.
;  When Guile does not signal an error for invalid Scheme programs, it may be a bug,

; unless  this is  explicitly  documented.    When  some  part of  the
; documentation is not  clear and does not make sense  to you even after
; re-reading the section, it is a  bug.  Before reporting the bug, check
; whether  any  programs you  have  loaded  into Guile,  including  your
; ‘.guile’ file,  set any variables  that may affect the  functioning of
; Guile.  Also,  see whether  the problem happens  in a  freshly started
; Guile  without loading  your ‘.guile’  file (start  Guile with  the -q
; switch to  prevent loading  the init  file). If  the problem  does not
; occur then, you must report the  precise contents of any programs that
; you must load into Guile in order to cause the problem to occur.  When
; you write  a bug report,  please make sure to  include as much  of the
; information described  below in  the report. If  you can’t  figure out
; some of the  items, it is not  a problem, but the  more information we
; get, the more likely we can diagnose  and fix the bug.

;  The version

; number of  Guile. You  can get this  information from  invoking ‘guile
; --version’ at your shell, or  calling (version) from within Guile.

;  Your machine type,

; as determined  by the config.guess shell script. If you  have  a  Guile  checkout,  this file  is  located  in  build-aux;

; otherwise    you     can    fetch    the    latest     version    from

; http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD.

; $ build-aux/config.guess
;x86_64-unknown-linux-gnu

;   If you  installed  Guile  from a  binary

; package, the version of that package. On systems that use RPM, use rpm
; -qa | grep guile. On systems that  use DPKG, dpkg -l | grep guile.

;  If you built Guile yourself,
; the  build configuration that you used: $
; ./config.status          --config          ’--enable-error-on-warning’
; ’--disable-deprecated’...     A  complete   description  of  how  to
; reproduce the  bug.  If you  have a  Scheme program that  produces the
; bug, please include it  in the bug report. If your  program is too big
; to include, please try to reduce your code to a minimal test case.  If
; you  can reproduce  your problem  at the  REPL, that  is best.  Give a
; transcript of the expressions you typed at the REPL.   A description
; of  the incorrect  behavior. For  example, "The  Guile process  gets a
; fatal signal," or, "The resulting output  is as follows, which I think
; is wrong."  If the manifestation of  the bug is a Guile error message,
; it is important to report the precise text of the error message, and a
; backtrace showing  how the Scheme  program arrived at the  error. This
; can be done using the ,backtrace command in Guile’s debugger.


; If  your bug  causes Guile  to  crash, additional  information from  a
; low-level debugger  such as GDB  might be  helpful. If you  have built
; Guile   yourself,   you   can   run    Guile   under   GDB   via   the
; meta/gdb-uninstalled-guile script. Instead of invoking Guile as usual,
; invoke  the  wrapper script,  type  run  to  start the  process,  then
; backtrace  when  the crash  comes.   Include  that backtrace  in  your
; report.

; 3 Hello Scheme!

; In this  chapter, we  introduce the basic  concepts that  underpin the
; elegance  and  power of  the  Scheme  language.  Readers  who  already
; possess  a  background  knowledge  of Scheme  may  happily  skip  this
; chapter.  For the  reader who  is new  to the  language, however,  the
; following discussions on data, procedures, expressions and closure are
; designed to  provide a minimum  level of Scheme understanding  that is
; more or less  assumed by the chapters that follow.   The style of this
; introductory material  aims about halfway between  the terse precision
; of  R5RS and  the  discursiveness of  existing  Scheme tutorials.  For
; pointers to useful Scheme resources on the web, please see Section 3.5
; [Further Reading], page 34.

; 3.1 Data Types, Values and Variables

; This section  discusses the representation  of data types  and values,
; what it means for Scheme to be a latently typed language, and the role
; of  variables. We  conclude  by introducing  the  Scheme syntaxes  for
; defining a  new variable, and  for changing  the value of  an existing
; variable.

; 3.1.1 Latent Typing

; The term latent  typing is used to describe a  computer language, such
; as  Scheme,  for which  you  cannot,  in  general,  simply look  at  a
; program’s  source  code  and  determine  what type  of  data  will  be
; associated  with  a particular  variable,  or  with  the result  of  a
; particular expression.   Sometimes, of course,  you can tell  from the
; code what  the type of an  expression will be.  If you have a  line in
; your program that sets the variable x  to the numeric value 1, you can
; be certain that, immediately after that  line has executed (and in the
; absence of  multiple threads), x  has the numeric  value 1. Or  if you
; write a procedure  that is designed to concatenate two  strings, it is
; likely  that the  rest of  your  application will  always invoke  this
; procedure  with two  string parameters,  and quite  probable that  the
; procedure  would go  wrong in  some way  if it  was ever  invoked with
; parameters that  were not  both strings.   Nevertheless, the  point is
; that  there  is  nothing  in   Scheme  which  requires  the  procedure
; parameters always to be strings, or  x always to hold a numeric value,
; and there is no way of declaring in your program that such constraints
; should always be obeyed. In the same  vein, there is no way to declare
; the expected type  of a procedure’s return value.   Instead, the types
; of variables  and expressions  are only  known – in  general –  at run
; time.   If you  need to  check  at some  point  that a  value has  the
; expected type, Scheme provides run time procedures that you can invoke
; to do  so. But  equally, it  can be perfectly  valid for  two separate
; invocations of the same procedure  to specify arguments with different
; types, and to return values with different types.  The next subsection
; explains  what  this means  in  practice,  for  the ways  that  Scheme
; programs use data types, values and variables.

; 3.1.2 Values and Variables

; Scheme provides  many data types  that you  can use to  represent your
; data.  Primitive  types  include   characters,  strings,  numbers  and
; procedures.  Compound types,  which  allow a  group16 Guile  Reference
; Manual of primitive and compound values to be stored together, include
; lists, pairs, vectors and multi-dimensional arrays. In addition, Guile
; allows  applications to  define their  own data  types, with  the same
; status as  the built-in  standard Scheme types.   As a  Scheme program
; runs,  values of  all types  pop in  and out  of existence.  Sometimes
; values are stored in variables, but more commonly they pass seamlessly
; from  being  the  result  of  one computation  to  being  one  of  the
; parameters  for the  next.  Consider  an  example. A  string value  is
; created because  the interpreter reads  in a literal string  from your
; program’s source code.  Then a numeric value is created  as the result
; of calculating  the length of  the string.  A second numeric  value is
; created by doubling the calculated length. Finally the program creates
; a list with two elements –  the doubled length and the original string
; itself  – and  stores this  list in  a program  variable.  All  of the
; values involved  here – in  fact, all values  in Scheme –  carry their
; type with them. In other words,  every value “knows,” at runtime, what
; kind  of  value it  is.  A  number, a  string,  a  list, whatever.   A
; variable, on the other hand, has no  fixed type. A variable – x, say –
; is simply the name of a location –  a box – in which you can store any
; kind of  Scheme value. So  the same variable in  a program may  hold a
; number at one moment, a list of  procedures the next, and later a pair
; of  strings.  The “type”  of  a  variable –  insofar  as  the idea  is
; meaningful at all – is simply  the type of whatever value the variable
; happens to be storing at a particular moment.

; 3.1.3 Defining and Setting Variables

; To define a new variable, you use Scheme’s define syntax like this:

; (define variable-name value )

; This makes a new variable called  variable-name and stores value in it
; as the variable’s  initial value. For example:
;; Make  a variable ‘x’
; with initial numeric value 1.

(define x 1)

;; Make  a variable  ‘organization’ with an  initial string  value.  ;
; (define  organization  "Free  Software   Foundation")  (In  Scheme,  a
; semicolon marks  the beginning of  a comment that continues  until the
; end of  the line. So the  lines beginning ;; are  comments.)  Changing
; the value of an already existing variable is very similar, except that
; define  is  replaced by  the  Scheme  syntax  set!, like  this:

; (set!variable-name new-value  )

; Remember that variables do not  have fixedtypes, so new-value may have
; a completely different type from  whateverwas previously stored in the
; location named  by variable-name.   Both ofthe following  examples are
; therefore correct.


;; Change the value of ‘x’ to 5.

(set! x 5)

;; Change the value of ‘organization’ to the FSF’s street number.
; (set! organization 545)


; In these examples,  value and new-value are literal  numeric or string
; values. In  general, however,  value and new-value  can be  any Scheme
; expression. Even though we have not  yet covered the forms that Scheme
; expressions can take  (see Section 3.3 [About  Expressions], page 20),
; you  can probably  guess what  the following  set! example  does. .  .

(set! x (+ x  1))

; (Note: this is not a  complete description of define
; and set!,  because we need to  introduce some other aspects  of Scheme
; before  the missing  pieces can  be filled  in. If,  however, you  are
; already familiar  with the structure of  Scheme, you may like  to read
; about  those  missing  pieces  immediately by  jumping  ahead  to  the
                                        ; following references.
;  Section  3.2.4

; [Lambda  Alternatives], page
; 20, to read about an alternative form of the define syntax that can be
; used when defining new procedures.

;   Section 6.7.8 ;  [Procedures withSetters],

; about  an alternative  form  of the  set!  ;  syntax  that helps  with
; changing a single value in the depths of a ; compound data structure.)

;   See Section  6.10.3 ; [InternalDefinitions],

; about  using define  other  than at  top level  in  a Scheme  program,
; including a discussion of when it works to use define rather than set!
; to change the value of an existing variable.

; 3.2 The Representation and Use of Procedures

; This  section  introduces the  basics  of  using and  creating  Scheme
; procedures.  It discusses  the  representation of  procedures as  just
; another  kind of  Scheme  value, and  shows  how procedure  invocation
; expressions are  constructed. We  then explain how  lambda is  used to
; create  new  procedures,  and   conclude  by  presenting  the  various
; shorthand  forms of  define that  can be  used instead  of writing  an
; explicit lambda expression.


; 3.2.1 Procedures as Values

; One of the great simplifications of Scheme is that a procedure is just
; another type of value, and that  procedure values can be passed around
; and  stored in  variables in  exactly the  same way  as, for  example,
; strings  and lists.  When we  talk  about a  built-in standard  Scheme
; procedure such as open-input-file, what we actually mean is that there
; is  a pre-defined  top  level variable  called open-input-file,  whose
; value   is  a   procedure  that   implements  what   R5RS  says   that
; open-input-file should  do.  Note  that this  is quite  different from
; many dialects of Lisp — including Emacs  Lisp — in which a program can
; use  the same  name  with  two quite  separate  meanings: one  meaning
; identifies a Lisp function, while  the other meaning identifies a Lisp
; variable, whose value  need have nothing to do with  the function that
; is associated with the first meaning. In these dialects, functions and
; variables are said to live in different namespaces.  In Scheme, on the
; other hand,  all names belong to  a single unified namespace,  and the
; variables that these names identify can hold any kind of Scheme value,
; including  procedure values.   One consequence  of the  “procedures as
; values” idea  is that, if you  don’t happen to like  the standard name
; for   a  Scheme   procedure,  you   can  change   it.   For   example,
; call-with-current-continuation  is a  very  important standard  Scheme
; procedure, but it also has a  very long name! So, many programmers use
; the following  definition to  assign the same  procedure value  to the
; more convenient name call/cc.

; (define call/cc call-with-current-continuation)

; Let’s understand exactly how this  works. The definition creates a new
; variable call/cc, and then sets its value to the value of the variable
; call-with-current-continuation; the  latter value is a  procedure that
; implements  the   behaviour  that   R5RS  specifies  under   the  name
; “call-with-current-continuation”.  So  call/cc  ends up  holding  this
; value as well.   Now that call/cc holds the  required procedure value,
; you  could  choose  to   use  call-  with-current-continuation  for  a
; completely different  purpose, or  just change its  value so  that you
; will     get     an     error      if     you     accidentally     use
; call-with-current-continuation as  a procedure in your  program rather
; than call/cc. For example:

; (set! call-with-current-continuation "Not aprocedure    any     more!")


; Or you could just leave call-with-current-continuation as it was. It’s
; perfectly fine for  more than one variable to hold  the same procedure
; value.

; 3.2.2 Simple Procedure Invocation

; A  procedure invocation  in Scheme  is written  like this:

; (procedure [arg1 [arg2  ...]])

; In this expression, procedure can be any Scheme expression whose value
; is a procedure.  Most commonly,  however, procedure is simply the name
; of a variable whose value  is a procedure.  For example, string-append
; is  a standard  Scheme  procedure whose  behaviour  is to  concatenate
; together all the arguments, which are  expected to be strings, that it
; is given.  So the expression

(string-append "/home" "/" "admin")

; is  a   procedure  invocation  whose   result  is  the   string  value
; "/home/andrew".   Similarly,   string-length  is  a   standard  Scheme
; procedure  that returns  the length  of a  single string  argument, so

(string-length "abc")

; is a procedure  invocation whose result is the numeric  value 3.  Each
; of the parameters  in a procedure invocation can itself  be any Scheme
; expression.   Since  a  procedure  invocation  is  itself  a  type  of
; expression,  we   can  put   these  two   examples  together   to  get

(string-length  (string-append "/home"  "/" "admin"))

; — a  procedure

; invocation  whose  result  is  the  numeric value  12.   (You  may  be
; wondering what happens if the two  examples are combined the other way
; round. If  we do this, we  can make a procedure  invocation expression
; that is  syntactically correct:

(string-append  "/home" (string-length "abc"))

; but when this expression is  executed, it will cause an error,
; because the result  of (string- length "abc") is a  numeric value, and
; string-append is not designed to accept  a numeric value as one of its
; arguments.)

; 3.2.3 Creating and Using a New Procedure

; Scheme  has lots  of standard  procedures, and  Guile provides  all of
; these  via  predefined top  level  variables.  All of  these  standard
; procedures  are documented  in the  later chapters  of this  reference
; manual.   Before  very long,  though,  you  will  want to  create  new
; procedures  that   encapsulate  aspects  of  your   own  applications’
; functionality. To do this, you can  use the famous lambda syntax.  For
; example, the  value of the  following Scheme expression

; (lambda (name address)  body ...)

; is  a newly  created  procedure  that takes  two  arguments: name  and
; address.   The behaviour  of the  new procedure  is determined  by the
; sequence of expressions  and definitions in the body  of the procedure
; definition. (Typically, body  would use the arguments in  some way, or
; else there  wouldn’t be any  point in  giving them to  the procedure.)
; When invoked, the  new procedure returns a value that  is the value of
; the last expression in the body.   To make things more concrete, let’s
; suppose that the two arguments are  both strings, and that the purpose
; of this  procedure is to  form a  combined string that  includes these
; arguments.   Then the  full lambda  expression might  look like  this:

(lambda  (name   address)
 (string-append  "Name="   name  ":Address="address))

; We  noted in  the previous  subsection that  the procedure  part of  a
; procedure  invocation expression  can be  any Scheme  expression whose
; value is a procedure.  But that’s exactly what a lambda expression is!
; So we can use a lambda  expression directly in a procedure invocation,
; like  this:

;((lambda  (name   address)  (string-append  "Name="  name
;          ":Address="  address)) "FSF"  "Cambridge")

; This is a valid procedure invocation expression, and its result is the
; string:  "Name=FSF:Address=Cambridge" It  is more  common, though,  to
store the procedure value in a variable

(define make-combined-string (lambda  (name   address)
    (string-append  "Name=" name  ":Address=" address)))

; — and  then  to use  the variable  name  in the  procedure
; invocation: (make-combined-string "FSF" "Cambridge") Which has exactly
;the same result.  It’s important to note that procedures created using
; lambda have  exactly the same status  as the standard built  in Scheme
; procedures, and can be invoked, passed around, and stored in variables
; in exactly the same ways.


; 3.2.4 Lambda Alternatives

; Since it is so common in Scheme programs to want to create a procedure
; and then store it  in a variable, there is an  alternative form of the
; define syntax that allows you to do just that.  A define expression of
; the  form

; (define  (name [arg1  [arg2  ...]])  body  ...)

; is exactly equivalent  to the longer form

; (define  name (lambda ([arg1 [arg2  ...]])   body  ...))

; So,  for  example,  the  definition  of  make-combined-string  in  the
; previous    subsection    could    equally   be    written:

(define(make-combined-string  name   address)
  (string-append   "Name="  name":Address="  address))

; This kind  of procedure definition  creates a procedure  that requires
; exactly the expected number of  arguments. There are two further forms
; of the lambda  expression, which create a procedure that  can accept a
; variable number  of arguments:

(lambda (arg1  ... .  args )  body ...)
(lambda args  body ...)

; The corresponding forms of the  alternative define syntax are:

;(define(name arg1 ...  .  args ) body ...)
;(define (name .  args ) body ...)

; For details on  how these forms work, see See

;Section 6.7.1 [Lambda],

; Prior to Guile 2.0, Guile provided  an extension to define syntax that
; allowed  you  to  nest  the  previous extension  up  to  an  arbitrary
; depth. These are no longer provided  by default, and instead have been
; moved to Section  7.19 [Curried Definitions].   (It could be
; argued  that  the  alternative  define  forms  are  rather  confusing,
; especially for newcomers to the Scheme language, as they hide both the
; role of lambda and the fact that procedures are values that are stored
; in variables in the same way as any other kind of value.  On the other
; hand, they  are very convenient, and  they are also a  good example of
; another  of  Scheme’s  powerful   features:  the  ability  to  specify
; arbitrary syntactic transformations at run  time, which can be applied
; to subsequently read input.)


; 3.3 Expressions and Evaluation

; So far,  we have met  expressions that do  things, such as  the define
; expressions that create and initialize new variables, and we have also
; talked about  expressions that have  values, for example the  value of
; the  procedure  invocation   expression:

(string-append  "/home"  "/" "admin")

; but we haven’t  yet been precise about what causes  an expression like
; this procedure invo-  cation to be reduced to its  “value”, or how the
; processing of  such expressions relates  to the execution of  a Scheme
; program  as a  whole.   This  section clarifies  what  we  mean by  an
; expression’s  value,  by  introducing   the  idea  of  evaluation.  It
; discusses the side effects that evaluation can have, explains how each
; of the various types of  Scheme expression is evaluated, and describes
; the behaviour and  use of the Guile REPL as  a mechanism for exploring
; evaluation.  The  section  concludes  with a  very  brief  summary  of
; Scheme’s common syntactic expressions.

; 3.3.1 Evaluating Expressions and Executing Programs

; In  Scheme,  the  process  of  executing an  expression  is  known  as
; evaluation. Evaluation  has two kinds of  result:

;  the value  of the evaluated  expression

;  the side  effects of the evaluation, which consist  of any effects
; of evaluating the expression that are not represented by the value.

; Of  the  expressions  that  we  have  met  so  far,  define  and  set!
; expressions  have side  effects

; —  the creation  or modification  of a variable

; —  but no value lambda  expressions have values

;—  the newly constructed procedures

; —  but  no  side  effects and  procedure  invocation  expressions,  in
; general, have either values, or side effects, or both.

; It  is tempting  to try  to define  more intuitively  what we  mean by
; “value”  and “side  effects”,  and what  the  difference between  them
; is.  In general,  though, this  is  extremely difficult.   It is  also
; unnecessary instead, we  can quite happily define the  behaviour of a
; Scheme program by specifying how Scheme executes a program as a whole,
; and then  by describing the value  and side effects of  evaluation for
; each type of expression individually.

; So, some1 definitions. . .

;  A Scheme program  consists of a sequence of expressions.

;   A Scheme  interpreter  executes the  program  by evaluating  these
; expressions inorder, one by one.

;  An expression  can be

;   a piece  of literal data, such as a  number

; 2.3 or a string "Hello  world!"

;  a variable name

;  a  procedure invocation expression

;   one  of  Scheme’s  special syntactic  expressions.  The  following
; subsections  describe  how  each  of  these  types  of  expression  is
; evaluated.


; 3.3.1.1 Evaluating Literal Data

; When  a  literal  data  expression  is evaluated,  the  value  of  the
; expression  is simply  the value  that the  expression describes.  The
; evaluation of a literal data expression  has no side effects.

; So, for example,

;  the value of the expression "abc" is the string value "abc"

; 1 These definitions are approximate.

; For  the whole  and detailed  truth,  see Section  “Formal syntax  and
; semantics” in The Revised(5) Report on the Algorithmic Language Scheme

; 22 Guile Reference Manual

;  the value of the expression 3+4i is the complex number 3 + 4i

;  the  value of  the expression  #(1 2 3)  is a  three-element vector
; containing the numeric values 1, 2 and 3.  For any data type which can
; be  expressed literally  like this,  the  syntax of  the literal  data
; expression for that data type — in other words, what you need to write
; in your code  to indicate a literal  value of that type —  is known as
; the data type’s read syntax. This manual specifies the read syntax for
; each such  data type  in the  section that  describes that  data type.
; Some data  types do not have  a read syntax. Procedures,  for example,
; cannot be  expressed as  literal data;  they must  be created  using a
; lambda expression (see Section 3.2.3  [Creating a Procedure], page 19)
; or implicitly  using the shorthand  form of define (see  Section 3.2.4
; [Lambda Alternatives].

; 3.3.1.2 Evaluating a Variable Reference

; When  an  expression  that  consists  simply of  a  variable  name  is
; evaluated,  the value  of the  expression is  the value  of the  named
; variable. The  evaluation of  a variable  reference expression  has no
; side effects.   So, after

(define key  "admin")

; the value of the expression key  is the string value "Paul Evans".  If
; key is  then modified by

(set!  key 3.75)

; the value of  the expression key is the numeric  value 3.74.  If there
; is  no variable  with thespecified  name, evaluation  of the  variable
; reference ex- pressionsignals an error


; 3.3.1.3 Evaluating a Procedure Invocation Expression

; This is where evaluation starts getting interesting! As already noted,
; a procedure invocation expression has the form

(procedure [arg1 [arg2 ...]])

; where procedure must be an  expression whose value, when evaluated, is
; a procedure.  The evaluation of a procedure invocation expression like
; this proceeds by

;  evaluating individually the  expressions procedure, arg1, arg2, and
; so on.

;  calling the procedure that is the value of the procedure expression
; with the  list of values obtained  from the evaluations of  arg1, arg2
; etc. as its  parameters.  For a procedure defined  in Scheme, “calling
; the procedure with the list of values as its parameters” means binding
; the values  to the procedure’s  formal parameters and  then evaluating
; the sequence  of expressions that  make up  the body of  the procedure
; definition.  The value  of the procedure invocation  expression is the
; value of the last evaluated expression in the procedure body. The side
; effects  of calling  the procedure  are  the combination  of the  side
; effects of the sequence of evaluations of expressions in the procedure
; body.  For a built-in procedure, the value and side-effects of calling
; the procedure are best described by that procedure’s documentation.

; Note  that  the  complete  side  effects  of  evaluating  a  procedure
; invocation expression  con- sist not only  of the side effects  of the
; procedure  call,  but  also  of  any side  effects  of  the  preceding
; evaluation of  the expressions procedure,  arg1, arg2, and so  on.  To
; illustrate  this,  let’s  look   again  at  the  procedure  invocation
; expression:

(string-length (string-append "/home" "/" "admin"))

; In the outermost expression, procedure is string-length and arg1 is

(string-append "/home" "/" "admin")

; Evaluation of string-length, which is a variable, gives a procedure value that implements the expected behaviour for “string-length”.

; Evaluation of (string-append "/home" "/" "admin"), which is another procedure invocation expression, means evaluating each of

; string-append, which gives a procedure value that implements the expected behaviour for “string-append”

;  "/home", which gives the string value "/home"
;  "/", which gives the string value "/"
;  "admin", which gives the string value "admin"

; and then invoking the procedure value  with this list of string values
; as its arguments.   The resulting value is a single  string value that
; is the concatenation of all  the arguments, namely "/home/admin".  In
; the evaluation  of the outermost  expression, the interpreter  can now
; invoke the  procedure value  obtained from procedure with  the value
; obtained from arg1 as its arguments.  The resulting value is a numeric
; value that is the length of the argument string, which is 12.

; 3.3.1.4 Evaluating Special Syntactic Expressions

; When a procedure invocation expression is evaluated, the procedure and
; all the  argument expressions must  be evaluated before  the procedure
; can be  invoked. Special syntactic  ex- pressions are  special because
; they are  able to manipulate  their arguments in an  unevaluated form,
; and  can  choose whether  to  evaluate  any  or  all of  the  argument
; expressions.  Why  is this  needed? Consider  a program  fragment that
; asks the user  whether or not to  delete a file, and  then deletes the
; file if the user answers yes.

; (if (string=? (read-answer "Should I delete this file?") "yes")
;    (delete-file file))

; If the outermost  (if ...) expression here was  a procedure invocation
; expression, the expression (delete-file file), whose side effect is to
; actually delete a  file, would already have been  evaluated before the
; if procedure  even got  invoked! Clearly  this is no  use —  the whole
; point of  an if expression is  that the consequent expression  is only
; evaluated if the condition of  the if expression is “true”.  Therefore
; if must  be special  syntax, not a  procedure. Other  special syntaxes
; that we have already met are  define, set! and lambda. define and set!
; are syntax because  they need to know the variable  name that is given
; as  the first  argument  in a  define or  set!   expression, not  that
; variable’s value. lambda is syntax because it does not immediately

