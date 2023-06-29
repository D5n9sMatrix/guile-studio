;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname equation) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#!/usr/local/guile -s
#!/usr/bin/racket

;; Name Project: "Guile-Racket"
;; Name Program: "Equation"
;; Name Files  : "equation.bsl"
;; Name TIPs   : "Not and Empty"
;; Name Library: "GNU"
;; Name Guides : "GUI"
;; Name Class  : "Matrix"
;; Name Author : Isso James


;; At first glance, function are like expressions alway with a y
;; the left, followed by an sign and expression however the note
;; you aften see school for function is utterly missleading.
;; In DrRacket, you therefore write function a bit different.

(define (y x) (* x x))

;; The define says “consider y a function,” which, like an
;; expression, computes a value. A function’s value, though,
;; depends on the value of something called the input, which
;; we express with (y x). Since we don’t know what this input
;; is, we use a name to represent the input. Following the
;; mathematical tradition, we use x here to stand in for the
;; unknown input; but pretty soon, we will use all kinds
;; of names.

;; This second part means you must supply one number—for
;; x—to determine a specific value for y. When you do,
;; DrRacket plugs the value for x into the expression
;; associated with the function. Here the expression
;; is (* x x). Once x is replaced with a value, say 1,
;; DrRacket can compute the result of the expressions,
;; which is also called the output of the function.

;; Click RUN and watch nothing happen. Nothing shows up
;; in the interactions area. Nothing seems to change anywhere
;; else in DrRacket. It is as if you hadn’t accomplished
;; anything. But you did. You actually defined a function
;; and informed DrRacket about its existence. As a matter
;; of fact, the latter is now ready for you to use the
;; function. Enter

(y 110) ;; values to all humanity
(y 120) ;; values to all humanity
(y 140) ;; values to all humanity
(y 150) ;; values to all humanity


;; 1.3 Mixing It Up

;; All other operations (in BSL) concerning strings
;; consume or produce data other than strings. Here
;; are some examples:


;; string-length consumes a string and produces a number;

;; string-ith consumes a string s together with a number
;; i and extracts the 1String located at the ith position
;; (counting from 0); and


;; number->string consumes a number and produces a string.

;; Also look up substring and find out what it does.

;; If the documentation in HelpDesk appears confusing,
;; experiment with the functions in the interactions
;; area. Give them appropriate arguments, and find
;; out what they compute. Also use inappropriate
;; arguments for some operations just to find out
;; how BSL reacts: 

(string-length "27")

;; As you can see, BSL reports an error. The first
;; part “string-length” informs you about the operation
;; that is misapplied; the second half states what is
;; wrong with the arguments. In this specific example,
;; string-length is supposed to be applied to a string
;; but is given a number, specifically 42.

;; Naturally, it is possible to nest operations that
;; consume and produce different kinds of data as long
;; as you keep track of what is proper and what is not.
;; Consider this expression from the Prologue: How to
;; Program:

(* (string-length "hello world") 27)

;; The inner expression applies string-length to
; "hello world", our favorite string. The outer
;; expression has + consume the result of the
;; inner expression and 20.

;; Let’s determine the result of this expression
;; in a step-by-step fashion:

(* (string-length "hello world") 27)
(+ 79 80)
1

;; Not surprisingly, computing with such nested
;; expressions that deal with a mix of data is
;; no different from computing with numeric
;; expressions. Here is another example:

(+ (string-length (number->string 27)) 3)
(+ (string-length "27") 3)
(+ 27 3)

;; Before you go on, construct some nested expressions
;; that mix data in the wrong way, say, 

(+ (string-length "27") 3)

;; Run them in DrRacket. Study the red error message
;; but also watch what DrRacket highlights in the
;; definitions area.

;; Exercise 3. Add the following two lines to the
;; definitions area:

(define str "hello world")
(define i 10)

;; Then create an expression using string primitives
;; that adds "_" at position i. In general this means
;; the resulting string is longer than the original
;; one; here the expected result is "hello_world".

;; Position means i characters from the left of the
;; string, but programmers start counting at 0. Thus,
;; the 5th letter in this example is "w", because the
;; 0th letter is "h". Hint When you encounter such
;; “counting problems” you may wish to add a string
;; of digits below str to help with counting: 

str "hello world"
(define ind "0123456789")
i 27

;; See exercise 1 for how to create expressions in
;; DrRacket.

;; Exercise 4. Use the same setup as in exercise 3
;; to create an expression that deletes the ith position
;; from str. Clearly this expression creates a shorter
;; string than the given one. Which values for i are
;; legitimate? 

(define (pill x) (* x x))
(pill 10)

;; 1.6 Mixing It Up with Booleans

;; One important use of Boolean values concerns
;; calculations with different kinds of data. We
;; know from the Prologue that BSL programs may
;; name values via definitions. For example, we
;; could start a program with

(define x 2)

;; and then compute its inverse:

(define inverse-of-x (/ 1 x))

;; This works fine, as long as we don’t edit the
;; program and change x to 0.


;; This is where Boolean values come in, in particular
;; conditional calculations. First, the primitive
;; function = determines whether two (or more) numbers
;; are equal. If so, it produces #true, otherwise #false.
;; Second, there is a kind of BSL expression that we
;; haven’t mentioned so far: the if expression. It uses
;; the word “if” as if it were a primitive function;
;; it isn’t. The word “if” is followed by three
;; expressions, separated by blank spaces (that includes
;; tabs, line breaks, etc.). Naturally the entire
;; expression is enclosed in parentheses. Here is
;; an example:

(if (= x 0) 0 (/ 1 x))

;; And that is all there is to it. Here are some
;; small examples:

(define (f x) 1)

(define (g x y) (+ 1 1))

(define (h x y z) (+ (* 2 2) 3))

;; (ff a) is the function header. It means ff
;; consumes one piece of input, and the variable
;; a is a placeholder for this input. Of course,
;; at the time we define a function, we don’t know
;; what its input(s) will be. Indeed, the whole point
;; of defining a function is that we can use the
;; function many times on many different inputs.

;; Useful function bodies refer to the function
;; parameters. A reference to a function parameter
;; is really a reference to the piece of data that
;; is the input to the function. If we complete
;; the definition of ff like this

(define (ff a)
  (* 10 a))

;; Functions don’t have to be applied at the prompt
;; in the interactions area. It is perfectly acceptable
;; to use function applications nested within other
;; function applications:

(+ (ff 3) 2)
(* (ff 4) (+ (ff 3) 2))
(ff (ff 1))

;; Exercise 11. Define a function that consumes two
;; numbers, x and y, and that computes the distance
;; of point (x,y) to the origin.

;; In exercise 1 you developed the right-hand side of
;; this function for concrete values of x and y. Now
;; add a header.

;; Exercise 12. Define the function cvolume, which
;; accepts the length of a side of an equilateral
;; cube and computes its volume. If you have time,
;; consider defining csurface, too.

;; Hint An equilateral cube is a three-dimensional
;; container bounded by six squares. You can determine
;; the surface of a cube if you know that the square’s
;; area is its length multiplied by itself. Its volume
;; is the length multiplied with the area of one of its
;; squares. (Why?)

;; Exercise 13. Define the function string-first, which
;; extracts the first 1String from a non-empty string.

;; Exercise 14. Define the function string-last, which
;; extracts the last 1String from a non-empty string.

;; Exercise 15. Define ==>. The function consumes two
;; Boolean values, call them sunny and friday. Its a
;; nswer is #true if sunny is false or friday is true.
;; Note Logicians call this Boolean operation
;; implication, and they use the notation sunny
;; => friday for this purpose.

;; Exercise 16. Define the function image-area, which
;; counts the number of pixels in a given image. See
;; exercise 6 for ideas.

;; Exercise 17. Define the function image-classify,
;; which consumes an image and conditionally produces
;; "tall" if the image is taller than wide, "wide"
;; if it is wider than tall, or "square" if its
;; width and height are the same. See exercise 8
;; for ideas.

;; Exercise 18. Define the function string-join,
;; which consumes two strings and appends them
;; with "_" in between. See exercise 2 for ideas.

;; Exercise 19. Define the function string-insert,
;; which consumes a string str plus a number i and
;; inserts "_" at the ith position of str. Assume
;; i is a number between 0 and the length of the
;; given string (inclusive). See exercise 3 for
;; ideas. Ponder how string-insert copes with "".

;; Exercise 20. Define the function string-delete,
;; which consumes a string plus a number i and deletes
;; the ith position from str. Assume i is a number
;; between 0 (inclusive) and the length of the given
;; string (exclusive). See exercise 4 for ideas.
;; Can string-delete deal with empty strings?


;; 2.2 Computing

;; Function definitions and applications work
;; in tandem. If you want to design programs, you must
;; understand this collaboration because you need to
;; imagine how DrRacket runs your programs and because
;; you need to figure out what goes wrong when things
;; go wrong—and they will go wrong.

;; While you may have seen this idea in an algebra
;; course, we prefer to explain it our way. So here
;; we go. Evaluating a function application proceeds
;; in three steps: DrRacket determines the values
;; of the argument expressions; it checks that the
;; number of arguments and the number of function
;; parameters are the same; if so, DrRacket computes
;; the value of the body of the function, with all
;; parameters replaced by the corresponding argument
;; values. This last value is the value of the function
;; application. This is a mouthful, so we need examples.

(ff (+ 10 2))

;; Here is a sample calculation for f from the previous
;; section:

;; That last equation is weird because x does not occur
;; in the body of f. Therefore, replacing the occurrences
;; of x with 2 in the function body produces 1, which
;; is the function body itself.

;; For ff, DrRacket performs a different kind of
;; computation:

(ff (+ 1 1))
(* 10 2)

;; The best point is that when you combine these
;; laws of computation with those of arithmetic,
;; you can pretty much predict the outcome of any
;; program in BSL:

(+ (ff (+ 1 2)) 2)
(* (* 10 3) 2)
(+ 30 2)

;; Naturally, we can reuse the result of this
;; computation in others:

(* (ff 4) (+ (ff 3) 2))
(* (* 10 4) (+ (ff 3) 2))
(* 40 (+ (ff 3) 2))
(* 40 32)

;; In sum, DrRacket is an incredibly fast algebra
;; student; it knows all the laws of arithmetic and
;; it is great at substitution. Even better, DrRacket
;; cannot only determine the value of an expression;
;; it can also show you how it does it. That is, it
;; can show you step-by-step how to solve these algebra
;; problems that ask you to determine the value of an
;; expression.

;; Take a second look at the buttons that come with
;; DrRacket. One of them looks like an “advance to
;; next track” button on an audio player. If you
;; click this button, the stepper window pops up
;; and you can step through the evaluation of the
;; program in the definitions area.

;; Enter the definition of ff into the definitions
;; area. Add (ff (+ 1 1)) at the bottom. Now click
;; the STEP. The stepper window will show up;
;; figure 11 shows what it looks like in version
;; 6.2 of the software. At this point, you can use
;; the forward and backward arrows to see all the
;; computation steps that DrRacket uses to determine
;; the value of an expression. Watch how the stepper
;; performs the same calculations as we do.

;; Stop! Yes, you could have used DrRacket to solve
;; some of your algebra homework. Experiment with the
;; various options that the stepper offers.

;; Exercise 21. Use DrRacket’s stepper to evaluate
;; (ff (ff 1)) step-by-step. Also try (+ (ff 1) (ff 1)).
;; Does DrRacket’s stepper reuse the results
;; of computations?

;; At this point, you might think that you are back
;; in an algebra course with all these computations
;; involving uninteresting functions and numbers.
;; Fortunately, this approach generalizes to all
;; programs, including the interesting ones, in
;; this book.

;; Let’s start by looking at functions that process
;; strings. Recall some of the laws of string arithmetic:

(string-append "hello " "" "word")  
(string-append "preview" ", " "world")

;; Now suppose we define a function that creates
;; the opening of a letter:


;; Since last-name does not occur in the definition
;; of opening, replacing it with "Fisler" has no effect.

;; The rest of the book introduces more forms of
;; data.Eventually you will encounter imperative
;; operations, which do not combine or extract values
;; but modify them. To calculate with such operations,
;; you will need to add some laws to those of arithmetic
;; and substitution. To explain operations on data, we
;; always use laws like those of arithmetic in this book.

;; Exercise 22. Use DrRacket’s stepper on this program
;; fragment:

(define (distance-to-origin x y)
  (sqrt (+ (sqrt x) (sqr y))))
(distance-to-origin 1 2)

;; Exercise 23. The first 1String in "hello world"
;; is "h". How does the following function compute
;; this result?

(define (string-first s)
  (substring s 0 1))

(string-first "27")

;; Does stepping through an application suggest a fix?

;; Exercise 26. What do you expect as the value of
;; this program:

(define (string-insert s hack)
  (string-append (substring s 0 hack)
                 "_"
                 (substring s hack)))
(string-insert "helloworld" 5)

;; 2.3 Composing Functions

;; A program rarely consists of a single function
;; definition. Typically, programs consist of a main
;; definition and several other functions and turn
;; the result of one function application into the
;; input for another. In analogy to algebra, we call
;; this way of defining functions composition, and we
;; call these additional functions auxiliary functions
;; or helper functions.

(string-append
   "We have discovered that all people with the" "\n"
   "last name " " have won our lottery. So, " "\n"
   ", " "hurry and pick up your prize.")
(define signature-name "Product Getter Values Items") 

;; A side The result is a long string that contains
;; "\n", which represents a new line when the string
;; is printed. Once your program has access to functions
;; that write to files or the console, this part of the
;; string will make sense. Read on.

;; The problem statement specifies how the number of
;; attendees depends on the ticket price. Computing
;; this number is clearly a separate task and thus
;; deserves its own function definition:

(define (attributes ticket-price)
  (- 120 (* (- ticket-price 5.0) (/ 15 0.1)))) 

;; The revenue is exclusively generated by the sale
;; of tickets, meaning it is exactly the product of
;; ticket price and number of attendees:
(define ticket-price (* x x))
(define switch ticket-price)
(define (revenue ticket-price)
  (* ticket-price switch ticket-price))

;; The cost consists of two parts: a fixed part
;; ($180) and a variable part that depends on the
;; number of attendees. Given that the number of
;; attendees is a function of the ticket price, a
;; function for computing the cost of a show must
;; also consume the ticket price so that it can reuse
;; the attendees function:

(define (cost ticket-price)
   (+ 180 (* 0.04 (attributes ticket-price))))

;; The cost consists of two parts: a fixed part ($180)
;; and a variable part that depends on the number of
;; attendees. Given that the number of attendees is a
;; function of the ticket price, a function for computing
;; the cost of a show must also consume the ticket price
;; so that it can reuse the attendees function:

(+ (cost ticket-price)
  (+ 180 (* 0.04 (attributes ticket-price))))

;; Finally, profit is the difference between revenue
;; and costs for some given ticket price:

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;; The BSL definition of profit directly follows
;; the suggestion of the informal problem description.

;; These four functions are all there is to the
;; computation of the profit, and we can now use
;; the profit function to determine a good ticket
;; price.

;; Exercise 27. Our solution to the sample problem
;; contains several constants in the middle of functions.
;; As One Program, Many Definitions already points out,
;; it is best to give names to such constants so that
;; future readers understand where these numbers come
;; from. Collect all definitions in DrRacket’s
;; definitions area and change them so that all magic
;; numbers are refactored into constant definitions.

;; Exercise 28. Determine the potential profit for these
;; ticket prices: $1, $2, $3, $4, and $5. Which price
;; maximizes the profit of the movie theater? Determine
;; the best ticket price to a dime.

;; Here is an alternative version of the same program,
;; given as a single function definition:
(define price 10)
(+ (profit price)
   (*(*(+ 120
          (* (/ 15 0.1)
             (+ 5.0 price)))
       price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (+ 5.0 price)))))))

#!/usr/local/guile -s
#!/usr/bin/racket


;; At first glance, function are like expressions alway with a y
;; the left, followed by an sign and expression however the note
;; you aften see school for function is utterly missleading.
;; In DrRacket, you therefore write function a bit different.

(define (pl x) (* x x))

;; The define says “consider y a function,” which, like an
;; expression, computes a value. A function’s value, though,
;; depends on the value of something called the input, which
;; we express with (y x). Since we don’t know what this input
;; is, we use a name to represent the input. Following the
;; mathematical tradition, we use x here to stand in for the
;; unknown input; but pretty soon, we will use all kinds
;; of names.

;; This second part means you must supply one number—for
;; x—to determine a specific value for y. When you do,
;; DrRacket plugs the value for x into the expression
;; associated with the function. Here the expression
;; is (* x x). Once x is replaced with a value, say 1,
;; DrRacket can compute the result of the expressions,
;; which is also called the output of the function.

;; Click RUN and watch nothing happen. Nothing shows up
;; in the interactions area. Nothing seems to change anywhere
;; else in DrRacket. It is as if you hadn’t accomplished
;; anything. But you did. You actually defined a function
;; and informed DrRacket about its existence. As a matter
;; of fact, the latter is now ready for you to use the
;; function. Enter

(pl 110) ;; values to all humanity
(pl 120) ;; values to all humanity
(pl 140) ;; values to all humanity
(pl 150) ;; values to all humanity


;; 1.3 Mixing It Up

;; All other operations (in BSL) concerning strings
;; consume or produce data other than strings. Here
;; are some examples:


;; string-length consumes a string and produces a number;

;; string-ith consumes a string s together with a number
;; i and extracts the 1String located at the ith position
;; (counting from 0); and


;; number->string consumes a number and produces a string.

;; Also look up substring and find out what it does.

;; If the documentation in HelpDesk appears confusing,
;; experiment with the functions in the interactions
;; area. Give them appropriate arguments, and find
;; out what they compute. Also use inappropriate
;; arguments for some operations just to find out
;; how BSL reacts: 

(string-length "27")

;; As you can see, BSL reports an error. The first
;; part “string-length” informs you about the operation
;; that is misapplied; the second half states what is
;; wrong with the arguments. In this specific example,
;; string-length is supposed to be applied to a string
;; but is given a number, specifically 42.

;; Naturally, it is possible to nest operations that
;; consume and produce different kinds of data as long
;; as you keep track of what is proper and what is not.
;; Consider this expression from the Prologue: How to
;; Program:

(* (string-length "hello world") 27)

;; The inner expression applies string-length to
; "hello world", our favorite string. The outer
;; expression has + consume the result of the
;; inner expression and 20.

;; Let’s determine the result of this expression
;; in a step-by-step fashion:

(* (string-length "hello world") 27)
(+ 79 80)
1

;; Not surprisingly, computing with such nested
;; expressions that deal with a mix of data is
;; no different from computing with numeric
;; expressions. Here is another example:

(+ (string-length (number->string 27)) 3)
(+ (string-length "27") 3)
(+ 27 3)

;; Before you go on, construct some nested expressions
;; that mix data in the wrong way, say, 

(+ (string-length "27") 3)

;; Run them in DrRacket. Study the red error message
;; but also watch what DrRacket highlights in the
;; definitions area.

;; Exercise 3. Add the following two lines to the
;; definitions area:

(define str-hello "hello world")
(define ilaps 10)

;; Then create an expression using string primitives
;; that adds "_" at position i. In general this means
;; the resulting string is longer than the original
;; one; here the expected result is "hello_world".

;; Position means i characters from the left of the
;; string, but programmers start counting at 0. Thus,
;; the 5th letter in this example is "w", because the
;; 0th letter is "h". Hint When you encounter such
;; “counting problems” you may wish to add a string
;; of digits below str to help with counting: 

str-hello "hello world"
(define ilip "0123456789")
ilip 27

;; See exercise 1 for how to create expressions in
;; DrRacket.

;; Exercise 4. Use the same setup as in exercise 3
;; to create an expression that deletes the ith position
;; from str. Clearly this expression creates a shorter
;; string than the given one. Which values for i are
;; legitimate? 

(define (pill2 x) (* x x))
(pill2 10)

;; 1.6 Mixing It Up with Booleans

;; One important use of Boolean values concerns
;; calculations with different kinds of data. We
;; know from the Prologue that BSL programs may
;; name values via definitions. For example, we
;; could start a program with

(define dinner 2)

;; and then compute its inverse:

(define inverse-of-dinner (/ 1 dinner))

;; This works fine, as long as we don’t edit the
;; program and change x to 0.


;; This is where Boolean values come in, in particular
;; conditional calculations. First, the primitive
;; function = determines whether two (or more) numbers
;; are equal. If so, it produces #true, otherwise #false.
;; Second, there is a kind of BSL expression that we
;; haven’t mentioned so far: the if expression. It uses
;; the word “if” as if it were a primitive function;
;; it isn’t. The word “if” is followed by three
;; expressions, separated by blank spaces (that includes
;; tabs, line breaks, etc.). Naturally the entire
;; expression is enclosed in parentheses. Here is
;; an example:

(if (= x 0) 0 (/ 1 x))

;; And that is all there is to it. Here are some
;; small examples:

(define (f1 x) 1)

(define (g1 x y) (+ 1 1))

(define (h1 x y z) (+ (* 2 2) 3))

;; (ff a) is the function header. It means ff
;; consumes one piece of input, and the variable
;; a is a placeholder for this input. Of course,
;; at the time we define a function, we don’t know
;; what its input(s) will be. Indeed, the whole point
;; of defining a function is that we can use the
;; function many times on many different inputs.

;; Useful function bodies refer to the function
;; parameters. A reference to a function parameter
;; is really a reference to the piece of data that
;; is the input to the function. If we complete
;; the definition of ff like this

(define (ff1 a)
  (* 10 a))

;; Functions don’t have to be applied at the prompt
;; in the interactions area. It is perfectly acceptable
;; to use function applications nested within other
;; function applications:

(+ (ff1 3) 2)
(* (ff1 4) (+ (ff1 3) 2))
(ff1 (ff1 1))

;; Exercise 11. Define a function that consumes two
;; numbers, x and y, and that computes the distance
;; of point (x,y) to the origin.

;; In exercise 1 you developed the right-hand side of
;; this function for concrete values of x and y. Now
;; add a header.

;; Exercise 12. Define the function cvolume, which
;; accepts the length of a side of an equilateral
;; cube and computes its volume. If you have time,
;; consider defining csurface, too.

;; Hint An equilateral cube is a three-dimensional
;; container bounded by six squares. You can determine
;; the surface of a cube if you know that the square’s
;; area is its length multiplied by itself. Its volume
;; is the length multiplied with the area of one of its
;; squares. (Why?)

;; Exercise 13. Define the function string-first, which
;; extracts the first 1String from a non-empty string.

;; Exercise 14. Define the function string-last, which
;; extracts the last 1String from a non-empty string.

;; Exercise 15. Define ==>. The function consumes two
;; Boolean values, call them sunny and friday. Its a
;; nswer is #true if sunny is false or friday is true.
;; Note Logicians call this Boolean operation
;; implication, and they use the notation sunny
;; => friday for this purpose.

;; Exercise 16. Define the function image-area, which
;; counts the number of pixels in a given image. See
;; exercise 6 for ideas.

;; Exercise 17. Define the function image-classify,
;; which consumes an image and conditionally produces
;; "tall" if the image is taller than wide, "wide"
;; if it is wider than tall, or "square" if its
;; width and height are the same. See exercise 8
;; for ideas.

;; Exercise 18. Define the function string-join,
;; which consumes two strings and appends them
;; with "_" in between. See exercise 2 for ideas.

;; Exercise 19. Define the function string-insert,
;; which consumes a string str plus a number i and
;; inserts "_" at the ith position of str. Assume
;; i is a number between 0 and the length of the
;; given string (inclusive). See exercise 3 for
;; ideas. Ponder how string-insert copes with "".

;; Exercise 20. Define the function string-delete,
;; which consumes a string plus a number i and deletes
;; the ith position from str. Assume i is a number
;; between 0 (inclusive) and the length of the given
;; string (exclusive). See exercise 4 for ideas.
;; Can string-delete deal with empty strings?


;; 2.2 Computing

;; Function definitions and applications work
;; in tandem. If you want to design programs, you must
;; understand this collaboration because you need to
;; imagine how DrRacket runs your programs and because
;; you need to figure out what goes wrong when things
;; go wrong—and they will go wrong.

;; While you may have seen this idea in an algebra
;; course, we prefer to explain it our way. So here
;; we go. Evaluating a function application proceeds
;; in three steps: DrRacket determines the values
;; of the argument expressions; it checks that the
;; number of arguments and the number of function
;; parameters are the same; if so, DrRacket computes
;; the value of the body of the function, with all
;; parameters replaced by the corresponding argument
;; values. This last value is the value of the function
;; application. This is a mouthful, so we need examples.

(ff1 (+ 10 2))

;; Here is a sample calculation for f from the previous
;; section:

;; That last equation is weird because x does not occur
;; in the body of f. Therefore, replacing the occurrences
;; of x with 2 in the function body produces 1, which
;; is the function body itself.

;; For ff, DrRacket performs a different kind of
;; computation:

(ff1 (+ 1 1))
(* 10 2)

;; The best point is that when you combine these
;; laws of computation with those of arithmetic,
;; you can pretty much predict the outcome of any
;; program in BSL:

(+ (ff1 (+ 1 2)) 2)
(* (* 10 3) 2)
(+ 30 2)

;; Naturally, we can reuse the result of this
;; computation in others:

(* (ff1 4) (+ (ff1 3) 2))
(* (* 10 4) (+ (ff1 3) 2))
(* 40 (+ (ff1 3) 2))
(* 40 32)

;; In sum, DrRacket is an incredibly fast algebra
;; student; it knows all the laws of arithmetic and
;; it is great at substitution. Even better, DrRacket
;; cannot only determine the value of an expression;
;; it can also show you how it does it. That is, it
;; can show you step-by-step how to solve these algebra
;; problems that ask you to determine the value of an
;; expression.

;; Take a second look at the buttons that come with
;; DrRacket. One of them looks like an “advance to
;; next track” button on an audio player. If you
;; click this button, the stepper window pops up
;; and you can step through the evaluation of the
;; program in the definitions area.

;; Enter the definition of ff into the definitions
;; area. Add (ff (+ 1 1)) at the bottom. Now click
;; the STEP. The stepper window will show up;
;; figure 11 shows what it looks like in version
;; 6.2 of the software. At this point, you can use
;; the forward and backward arrows to see all the
;; computation steps that DrRacket uses to determine
;; the value of an expression. Watch how the stepper
;; performs the same calculations as we do.

;; Stop! Yes, you could have used DrRacket to solve
;; some of your algebra homework. Experiment with the
;; various options that the stepper offers.

;; Exercise 21. Use DrRacket’s stepper to evaluate
;; (ff (ff 1)) step-by-step. Also try (+ (ff 1) (ff 1)).
;; Does DrRacket’s stepper reuse the results
;; of computations?

;; At this point, you might think that you are back
;; in an algebra course with all these computations
;; involving uninteresting functions and numbers.
;; Fortunately, this approach generalizes to all
;; programs, including the interesting ones, in
;; this book.

;; Let’s start by looking at functions that process
;; strings. Recall some of the laws of string arithmetic:

(string-append "hello " "" "word")  
(string-append "preview" ", " "world")

;; Now suppose we define a function that creates
;; the opening of a letter:


;; Since last-name does not occur in the definition
;; of opening, replacing it with "Fisler" has no effect.

;; The rest of the book introduces more forms of
;; data.Eventually you will encounter imperative
;; operations, which do not combine or extract values
;; but modify them. To calculate with such operations,
;; you will need to add some laws to those of arithmetic
;; and substitution. To explain operations on data, we
;; always use laws like those of arithmetic in this book.

;; Exercise 22. Use DrRacket’s stepper on this program
;; fragment:

(define (distance-to-origin2 x y)
  (sqrt (+ (sqrt x) (sqr y))))
(distance-to-origin2 1 2)

;; Exercise 23. The first 1String in "hello world"
;; is "h". How does the following function compute
;; this result?

(define (string-hello s)
  (substring s 0 1))

(string-hello "27")

;; Does stepping through an application suggest a fix?

;; Exercise 26. What do you expect as the value of
;; this program:

(define (string-value s hack)
  (string-append (substring s 0 hack)
                 "_"
                 (substring s hack)))
(string-value "helloworld" 5)

;; 2.3 Composing Functions

;; A program rarely consists of a single function
;; definition. Typically, programs consist of a main
;; definition and several other functions and turn
;; the result of one function application into the
;; input for another. In analogy to algebra, we call
;; this way of defining functions composition, and we
;; call these additional functions auxiliary functions
;; or helper functions.

(string-append
   "We have discovered that all people with the" "\n"
   "last name " " have won our lottery. So, " "\n"
   ", " "hurry and pick up your prize.")
(define signature-name2 "Product Getter Values Items") 

;; A side The result is a long string that contains
;; "\n", which represents a new line when the string
;; is printed. Once your program has access to functions
;; that write to files or the console, this part of the
;; string will make sense. Read on.

;; The problem statement specifies how the number of
;; attendees depends on the ticket price. Computing
;; this number is clearly a separate task and thus
;; deserves its own function definition:

(define (attributes2 ticket-price)
  (- 120 (* (- ticket-price 5.0) (/ 15 0.1)))) 

;; The revenue is exclusively generated by the sale
;; of tickets, meaning it is exactly the product of
;; ticket price and number of attendees:
(define ticket-price2 (* x x))
(define switch2 ticket-price2)
(define (revenue2 ticket-price2)
  (* ticket-price2 switch2 ticket-price2))

;; The cost consists of two parts: a fixed part
;; ($180) and a variable part that depends on the
;; number of attendees. Given that the number of
;; attendees is a function of the ticket price, a
;; function for computing the cost of a show must
;; also consume the ticket price so that it can reuse
;; the attendees function:

(define (cost2 ticket-price2)
   (+ 180 (* 0.04 (attributes2 ticket-price2))))

;; The cost consists of two parts: a fixed part ($180)
;; and a variable part that depends on the number of
;; attendees. Given that the number of attendees is a
;; function of the ticket price, a function for computing
;; the cost of a show must also consume the ticket price
;; so that it can reuse the attendees function:

(+ (cost2 ticket-price2)
  (+ 180 (* 0.04 (attributes2 ticket-price2))))

;; Finally, profit is the difference between revenue
;; and costs for some given ticket price:

(define (profit2 ticket-price2)
  (- (revenue ticket-price2)
     (cost2 ticket-price2)))

;; The BSL definition of profit directly follows
;; the suggestion of the informal problem description.

;; These four functions are all there is to the
;; computation of the profit, and we can now use
;; the profit function to determine a good ticket
;; price.

;; Exercise 27. Our solution to the sample problem
;; contains several constants in the middle of functions.
;; As One Program, Many Definitions already points out,
;; it is best to give names to such constants so that
;; future readers understand where these numbers come
;; from. Collect all definitions in DrRacket’s
;; definitions area and change them so that all magic
;; numbers are refactored into constant definitions.

;; Exercise 28. Determine the potential profit for these
;; ticket prices: $1, $2, $3, $4, and $5. Which price
;; maximizes the profit of the movie theater? Determine
;; the best ticket price to a dime.

;; Here is an alternative version of the same program,
;; given as a single function definition:
(define price2 10)
(+ (profit2 price2)
   (*(*(+ 120
          (* (/ 15 0.1)
             (+ 5.0 price2)))
       price2)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (+ 5.0 price2)))))))
