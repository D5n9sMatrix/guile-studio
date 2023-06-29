;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname foowine) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#!/usr/local/guile -s
#!/usr/bin/racket

;; Interactive Programs Batch programs are a staple of
;; business uses of computers, but the programs people
;; encounter now are interactive. In this day and age,
;; people mostly interact with desktop applications via
;; a keyboard and a mouse. Furthermore, interactive
;; programs can also react to computer-generated events,
;; for example, clock ticks or the arrival of a message
;; from some other computer.

;; Exercise 32. Most people no longer use desktop
;; computers just to run applications but also employ
;; cell phones, tablets, and their cars’ information
;; control screen. Soon people will use wearable
;; computers in the form of intelligent glasses,
;; clothes, and sports gear. In the somewhat more
;; distant future, people may come with built-in
;; bio computers that diectly interact with body
;; functions. Think of ten different forms of events
; that software applications on such computers will
;; have to deal with.

;; The purpose of this section is to introduce the
;; mechanics of writing interactive BSL programs.
;; Because many of the project-style examples in this
;; book are interactive programs, we introduce the
;; ideas slowly and carefully. You may wish to return
;; to this section when you tackle some of the
;; interactive programming projects; a second or
;; third reading may clarify some of the advanced
;; aspects of the mechanics.

;; By itself, a raw computer is a useless piece of
;; physical equipment. It is called hardware because
;; you can touch it. This equipment becomes useful
;; once you install software, that is, a suite of
;; programs. Usually the first piece of software
;; to be installed on a computer is an operating
;; system. It has the task of managing the computer
;; for you, including connected devices such as the
;; monitor, the keyboard, the mouse, the speakers,
;; and so on. The way it works is that when a user
;; presses a key on the keyboard, the operating
;; system runs a function that processes keystrokes.
;; We say that the keystroke is a key event, and the
;; function is an event handler. In the same vein,
;; the operating system runs an event handler for
;; clock ticks, for mouse actions, and so on.
;; Conversely, after an event handler is done with
;; its work, the operating system may have to change
;; the image on the screen, ring a bell, print a
;; document, or perform a similar action. To accomplish
;; these tasks, it also runs functions that translate
;; the operating system’s data into sounds, images,
;; actions on the printer, and so on.

;; Naturally, different programs have different needs.
;; One program may interpret keystrokes as signals
;; to control a nuclear reactor; another passes them
;; to a word processor. To make a general-purpose
;; computer work on these radically different tasks,
;; different programs install different event handlers.
;; That is, a rocket-launching program uses one kind
;; of function to deal with clock ticks while an oven’s
;; software uses a different kind.

;; Designing an interactive program requires a way to
;; designate some function as the one that takes care
;; of keyboard events, another function for dealing
;; with clock ticks, a third one for presenting some
;; data as an image, and so forth. It is the task of
;; an interactive program’s main function to communicate
;; these designations to the operating system, that is,
;; the software platform on which the program is launched.

;; DrRacket is a small operating system, and BSL is one
;; of its programming languages. The latter comes with
;; the 2htdp/universe teachpack, which provides big-bang,
;; a mechanism for telling the operating system which
;; function deals with which event. In addition,
;; big-bang keeps track of the state of the program.
;; To this end, it comes with one required sub-expression,
;; whose value becomes the initial state of the program.
;; Otherwise big-bang consists of one required clause
;; and many optional clauses. The required to-draw
;; clause tells DrRacket how to render the state of
;; the program, including the initial one. Each of
;; the other, optional clauses tells the operating
;; system that a certain function takes care of a
;; certain event. Taking care of an event in BSL means
;; that the function consumes the state of the program
;; and a description of the event, and that it produces
;; the next state of the program. We therefore speak
;; of the current state of the program.

;; Terminology In a sense, a big-bang expression
;; describes how a program connects with a small
;; segment of the world. This world might be a game
;; that the program’s users play, an animation that
;; the user watches, or a text editor that the user
;; employs to manipulate some notes. Programming
;; language researchers therefore often say that
;; big-bang is a description of a small world: its
;; initial state, how states are transformed, how
;; states are rendered, and how big-bang may determine
;; other attributes of the current state. In this
;; spirit, we also speak of the state of the world
;; and even call big-bang programs world programs.
;; End

;; Let’s study this idea step-by-step, starting with
;; this definition:
(define (x y) (x 1))
(define (square s solid red) 10)
(define (number->square s)
  (square s "solid" "red"))

;; The function consumes a positive number and
;; produces a solid red square of that size. After
;; clicking RUN, experiment with the function, like
;; this:

(number->square (* 10 5))
(number->square (* 10 8))
(number->square (* 10 9))


;; It behaves like a batch program, consuming a number and
;; producing an image, which DrRacket renders for you.

;; Now try the following big-bang expression in the
;; interactions area:
(define num 10)
(define val 10)
(define to-draw num)
(define (big-bang num val) 10)
(big-bang 100 10)

;; A separate window appears, and it displays a image
;; red square. In addition, the DrRacket interactions
;; area does not display another prompt; it is as if
;; the program keeps running, and this is indeed the
;; case. To stop the program, click on DrRacket’s STOP
;; button or the window’s CLOSE button:

(big-bang 100 10)

;; This big-bang expression adds two optional clauses
;; to the previous one: the on-tick clause tells DrRacket
;; how to deal with clock ticks and the stop-when clause
;; says when to stop the program. We read it as follows,
;; starting with 100 as the initial state:

;; every time the clock ticks, subtract 1 from the current
;; state;

;; then check whether zero? is true of the new state
;; and if so, stop; and

;; every time an event handler returns a value, use
;; number->square to render it as an image.

;; Now hit the “return” key and observe what happens.
;; Eventually the evaluation of the expressions
;; terminates and DrRacket displays 0.

;; The big-bang expression keeps track of the current
;; state. Initially this state is 100. Every time
;; the clock ticks, it calls the clock-tick handler
;; and gets a new state. Hence, the state of big-bang
;; changes as follows:

(+ 100 (* 99 (- 1 0) 10)10)

;; When the state’s value becomes 0, the evaluation
;; is done. For every other state—from 100 to
;; 1—big-bang translates the state into an image,
;; using number->square as the to-draw clause tells
;; it to. Hence, the window displays a red square
;; that shrinks from image pixels to image pixel
;; over 100 clock ticks.

;; Let’s add a clause for dealing with key events.
;; First, we need a function that consumes the current
;; state and a string that describes the key event and
;; then returns a new state:

(define (reset s ke)
  100)

;; This function throws away its arguments and
;; returns 100, which is the initial state of
;; the big-bang expression we wish to modify.
;; Second, we add an on-key clause to the big-bang
;; expression:

(big-bang 100 10)

;; Stop! Explain what happens when you hit “return”,
;; count to 10, and finally press "a".

;; What you will see is that the red square shrinks
;; at the rate of one pixel per clock tick. As soon
;; as you press the "a" key, though, the red square
;; reinflates to full size because reset is called
;; on the current length of the square and "a" and
;; returns 100. This number becomes big-bang’s new
;; state and number->square renders it as a full-sized
;; red square.

;; In order to understand the evaluation of big-bang
;; expressions in general, let’s look at a schematic
;; version:

(big-bang 100 10)

;; We can actually express these three steps as a
;; sequence of three definitions:
(define a 'a)
(define (ff a) 'y)
(define cw0(ff a))
(define cw1(ff a))
(define cw2 (ff a))
(define cw3 (ff a))

;; In short, the sequence of events determines
;; in which order big-bang conceptually traverses
;; the above table of possible states to arrive at
;; the current state for each time slot. Of course,
;; big-bang does not touch the current state; it merely
;; safeguards it and passes it to event handlers and
;; other functions when needed.

;; From here, it is straightforward to define a first
;; interactive program. See figure 14. The program
;; consists of two constant definitions followed by
;; three function definitions: main, which launches
;; a big-bang interactive program; place-dot-at,
;; which translates the current state into an image;
;; and stop, which throws away its inputs and
;; produces 0.

;; After clicking RUN, we can ask DrRacket to evaluate
;; applications of these handler functions. This is one
;; way to confirm their workings:

;; A temperature is a Number in Termking
;; interpretation represents celsious degrees

;; The first line introduces the name of the data
;; collection, Temperature, and tells us that the
;; class consists of all Numbers. So, for example,
;; if we ask whether 102 is a temperature, you can
;; respond with “yes” because 102 is a number and
;; all numbers are temperatures. Similarly, if we
;; ask whether "cold" is a Temperature, you will
;; say “no” because no string belongs to Temperature.
;; And, if we asked you to make up a sample Temperature,
;; you might come up with something like -400.

;; If you happen to know that the lowest possible
;; temperature is approximately image C, you may
;; wonder whether it is possible to express this
;; knowledge in a data definition. Since our data
;; definitions are really just English descriptions
;; of classes, you may indeed define the class of
;; temperatures in a much more accurate manner than
;; shown here. In this book, we use a stylized form
;; of English for such data definitions, and the next
;; chapter introduces the style for imposing constraints
;; such as “larger than -274.”

;; So far, you have encountered the names of four classes
;; of data: Number, String, Image, and Boolean. With that,
;; formulating a new data definition means nothing more
;; than introducing a new name for an existing form of
;; data, say, “temperature” for numbers. Even this limited
;; knowledge, though, suffices to explain the outline of
;; our design process.

;; The Design Process Once you understand how to represent
;; input informationAt this point, you may wish to reread
;; the section on Systematic Program Design in the Preface,
;; especially figure 1. as data and to interpret output
;; data as information, the design of an individual
;; function proceeds according to a straightforward
;; process:

;; Express how you wish to represent information as data.
;; A one-line comment suffices:

; We use numbers to represent centimeters. 

;; Formulate data definitions, like the one for
;; Temperature, for the classes of data you consider
;; critical for the success of your program.

;; Write down a signature, a statement of purpose, and
;; a function header.

;; A function signature is a comment that tells the
;; readers of your design how many inputs your function
;; consumes, from which classes they are drawn, and what
;; kind of data it produces. Here are three examples for
;; functions that respectively

;; consume one String and produce a Number:

; String -> Number

;; consume a Temperature and produce a String:

;; Temperature -> String

;; As this signature points out, introducing a data
;; definition as an alias for an existing form of data
;; makes it easy to read the intention behind
;; signatures.

;; Nevertheless, we recommend that you stay away from
;; aliasing data definitions for now. A proliferation
;; of such names can cause quite a lot of confusion.
;; It takes practice to balance the need for new names
;; and the readability of programs, and there are more
;; important ideas to understand right now.

;; consume a Number, a String, and an Image:

;; Number String Image -> Image

;; Stop! What does this function produce?

;; A purpose statement is a BSL comment that summarizes
;; the purpose of the function in a single line. If you
;; are ever in doubt about a purpose statement, write down
;; the shortest possible answer to the question

;; what does the function compute?

;; Every reader of your program should understand what
;; your functions compute without having to read the
;; function itself.

;; A multi-function program should also come with a
;; purpose statement. Indeed, good programmers write
;; two purpose statements: one for the reader who may
;; have to modify the code and another one for the
;; person who wishes to use the program but not read
;; it.

;; Finally, a header is a simplistic function definition,
;; also called a stub. Pick one variable name for each
;; class of input in the signature; the body of the
;; function can be any piece of data from the output
;; class. These three function headers match the above
;; three signatures:

(define (f a-string) 0)
(define (g n) "a")
(define (empty-scene x y) 'val)
(define (h num str img) (empty-scene 100 100))

(f "hello world!")
(g "2")
(h 2 "2" 2)

;; Our parameter names reflect what kind of data the
;; parameter represents. Sometimes, you may wish to
;; use names that suggest the purpose of the parameter.

;; When you formulate a purpose statement, it is often
;; useful to employ the parameter names to clarify what
;; is computed. For example,

(define (add-image y s img)
  (empty-scene 100 100))

(add-image 1 2 3)

;; At this point, you can click the RUN button and
;; experiment with the function. Of course, the result
;; is always the same value, which makes these
;; experiments quite boring.

;; Illustrate the signature and the purpose statement
;; with some functional examples. To construct a
;; functional example, pick one piece of data from
;; each input class from the signature and determine
;; what you expect back.

;; Suppose you are designing a function that computes
;; the area of a square. Clearly this function consumes
;; the length of the square’s side, and that is best
;; represented with a (positive) number. Assuming you
;; have done the first process step according to the
;; recipe, you add the examples between the purpose
;; statement and the header and get this:

;; Number -> Number
;; computes the area of square with side len
;; given: 2, expect: 4
;; given: 7, expect: 49

(define (area-of-square len) 0)
(area-of-square 2)


;; The next step is to take inventory, to understand
;; what are the givens and what we need to compute.We
;; owe the term “inventory” to Stephen Bloch. For the
;; simple functions we are considering right now, we
;; know that they are given data via parameters. While
;; parameters are placeholders for values that we don’t
;; know yet, we do know that it is from this unknown
;; data that the function must compute its result. To
;; remind ourselves of this fact, we replace the
;; function’s body with a template.

;; For now, the template contains just the parameters,
;; so that the preceding example looks like this:

(define (area-of-square-adds len) 0)
(area-of-square-adds 10)

;; The dots remind you that this isn’t a complete f
;; unction, but a template, a suggestion for an
;; organization.

;; The templates of this section look boring. As soon
;; as we introduce new forms of data, templates become
;; interesting.

;; It is now time to code. In general, to code means
;; to program, though often in the narrowest possible
;; way, namely, to write executable expressions and
;; function definitions.

;; To us, coding means to replace the body of the
;; function with an expression that attempts to compute
;; from the pieces in the template what the purpose
;; statement promises. Here is the complete definition
;; for area-of-square:

;; Number -> Number
;; computes the area of a square with side len 
;; given: 2, expect: 4
;; given: 7, expect: 49

(define (area-of-square-num len)
  (sqr len))

(area-of-square-num 12)

; Number String Image -> Image
; adds s to img, y pixels from top, 10 pixels to the left
; given: 
;    5 for y, 
;    "hello" for s, and
;    (empty-scene 100 100) for img
; expected: 
;    (place-image (text "hello" 10 "red") 10 5 ...)
;    where ... is (empty-scene 100 100)
(define (text s) 'guides)
(define place-image (text 100))
(define (add-image-inc y) 'guides)

(text 100)
place-image(text 100)
(add-image-inc 100)

;; To complete the add-image function takes a bit more
;; work than that: see figure 16. In particular, the
;; function needs to turn the given string s into an
;; image, which is then placed into the given scene.

;; The last step of a proper design is to test the
;; function on the examples that you worked out before.
;; For now, testing works like this. Click the RUN button
;; and enter function applications that match the examples
;; in the interactions area:

(area-of-square 2)
(area-of-square 7)

;; The results must match the output that you expect;
;; you must inspect each result and make sure it is
;; equal to what is written down in the example portion
;; of the design. If the result doesn’t match the
;; expected output, consider the following three
;; possibilities:

;; You miscalculated and determined the wrong expected
;; output for some of the examples.

;; Alternatively, the function definition computes the
;; wrong result. When this is the case, you have a logical
;; error in your program, also known as a bug.

;; Both the examples and the function definition are
;; wrong.

;; When you do encounter a mismatch between expected
;; results and actual values, we recommend that you
;; first reassure yourself that the expected results
;; are correct. If so, assume that the mistake is in
;; the function definition. Otherwise, fix the example
;; and then run the tests again. If you are still
;; encountering problems, you may have encountered the
;; third, somewhat rare, situation.

;; 3.2 Finger Exercises: Functions

;; The first few of the following exercises are almost
;; copies of those in Functions, though where the latter
;; use the word “define” the exercises below use the word
;; “design.” What this difference means is that you should
;; work through the design recipe to create these
;; functions and your solutions should include all
;; relevant pieces.

;; As the title of the section suggests, these exercises
;; are practice exercises to help you internalize the
;; process. Until the steps become second nature, never
;; skip one because doing so leads to easily avoidable
;; errors. There is plenty of room left in programming
;; for complicated errors; we have no need to waste our
;; time on silly ones.

;; Exercise 34. Design the function string-first, which
;; extracts the first character from a non-empty string.
;; Don’t worry about empty strings.

;; Exercise 35. Design the function string-last, which
;; extracts the last character from a non-empty string.

;; Exercise 36. Design the function image-area, which
;; counts the number of pixels in a given image.

;; Exercise 37. Design the function string-rest, which
;; produces a string like the given one with the first
;; character removed.

;; Exercise 38. Design the function string-remove-last,
;; which produces a string like the given one with the
;; last character removed.

;; 3.3 Domain Knowledge

;; It is natural to wonder what knowledge it takes
;; to code up the body of a function. A little bit
;; of reflection tells you that this step demands
;; an appropriate grasp of the domain of the program.
;; Indeed, there are two forms of such domain knowledge:

;; Knowledge from external domains, such as mathematics,
;; music, biology, civil engineering, art, and so on.
;; Because programmers cannot know all of the application
;; domains of computing, they must be prepared to
;; understand the language of a variety of application
;; areas so that they can discuss problems with domain
;; experts. Mathematics is at the intersection of many,
;; but not all, domains. Hence, programmers must often
;; pick up new languages as they work through problems
;; with domain experts.

;; Knowledge about the teachpack functions in the chosen
;; programming language. When your task is to translate
;; a mathematical formula involving the tangent function,
;; you need to know or guess that your chosen language
;; comes with a function such as BSL’s tan. When your
;; task involves graphics, you will benefit from
;; understanding the possibilities of the 2htdp/image
;; teachpack.

;; Since you can never predict the area you will be
;; working in, or which programming language you will
;; have to use, it is imperative that you have a solid
;; understanding of the full possibilities of whatever
;; computer languages are around and suitable. Otherwise
;; some domain expert with half-baked programming
;; knowledge will take over your job.

;; You can recognize problems that demand domain knowledge
;; from the data definitions that you work out. As long
;; as the data definitions use classes that exist in the
;; chosen programming language, the definition of the
;; function body (and program) mostly relies on expertise
;; in the domain. Later, when we introduce complex forms
;; of data, the design of functions demands computer
;; science knowledge.

;; 3.4 From Functions to Programs

;; Not all programs consist of a single function
;; definition. Some require several functions; many
;; also use constant definitions. No matter what, it
;; is always important to design every function
;; systematically, though global constants as well
;; as auxiliary functions change the design process
;; a bit.

;; When you have defined global constants, your functions
;; may use them to compute results. To remind yourself of
;; their existence, you may wish to add these constants
;; to your templates; after all, they belong to the
;; inventory of things that may contribute to the
;; function definition.

;; Multi-function programs come about because interactive
;; programs automatically need functions that handle key
;; and mouse events, functions that render the state as
;; music, and possibly more. Even batch programs may
;; require several different functions because they
;; perform several separate tasks. Sometimes the problem
;; statement itself suggests these tasks; other times you
;; will discover the need for auxiliary functions as you
;; are in the middle of designing some function.

;; For these reasons, we recommend keeping around a list
;; of needed functions or a wish list.We owe the term
;; “wish list” to John Stone. Each entry on a wish list
;; should consist of three things: a meaningful name for
;; the function, a signature, and a purpose statement.
;; For the design of a batch program, put the main
;; function on the wish list and start designing it.
;; For the design of an interactive program, you can
;; put the event handlers, the stop-when function, and
;; the scene-rendering function on the list. As long as
;; the list isn’t empty, pick a wish and design the
;; function. If you discover during the design that
;; you need another function, put it on the list. When
;; the list is empty, you are done.

;; 3.5 On Testing

;; Testing quickly becomes a labor-intensive chore.
;; While it is easy to run small programs in the
;; interactions area, doing so requires a lot of
;; mechanical labor and intricate inspections. As
;; programmers grow their systems, they wish to
;; conduct many tests. Soon this labor becomes
;; overwhelming, and programmers start to neglect
;; it. At the same time, testing is the first tool
;; for discovering and preventing basic flaws. Sloppy
;; testing quickly leads to buggy functions—that is,
;; functions with hidden problems—and buggy functions
;; retard projects, often in multiple ways.

;; Hence, it is critical to mechanize tests instead
;; of performing them manually. Like many programming
;; languages, BSL includes a testing facility, and
;; DrRacket is aware of this facility. To introduce
;; this testing facility, we take a second look at
;; the function that converts temperatures in Fahrenheit
;; to Celsius temperatures from Programs. Here is the
;; definition:

;; Number -> Number 
;; converts Fahrenheit temperatures to Celsius
;; given 32, expect 0
;; given 212, expect 100
;; given -40, expect -40

(define (f2c f)
  (* 5/9 (- f 32)))
(f2c 0);; termking temparature degree celcious -17.7

;; When you now click the RUN button, you see a report
;; from BSL that the program passed all three tests—and
;; you have nothing else to do.

;; In addition to getting tests to run automatically,
;; the check-expect forms show another advantage when
;; tests fail. To see how this works, change one of
;; the above tests so that the result is wrong, for
;; example

(check-expect (f2c -40) 40)

;; When you now click the RUN button, an additional
;; window pops up. The window’s text explains that
;; one of three tests failed. For the failed test,
;; the window displays three pieces: the computed value,
;; the result of the function call (-40); the expected
;; value (40); and a hyperlink to the text of the failed
;; test case.

; Number -> Number
; converts Fahrenheit temperatures to Celsius temperatures 

(check-expect (f2c -40) -40)
(check-expect (f2c -32) -0)
(check-expect (f2c -212) -100)

(f2c -512); termking temperature celcious -302.2 ºc

;; You can place check-expect specifications above
;; or below the function definitions that they test.
;; When you click RUN, DrRacket collects all check-expect
;; specifications and evaluates them after all function
;; definitions have been added to the “vocabulary” of
;; operations. Figure 17 shows how to exploit this
;; freedom to combine the example and test step. Instead
;; of writing down the examples as comments, you can
;; translate them directly into tests. When you’re all
;; done with the design of the function, clicking RUN
;; performs the test. And if you ever change the
;; function for some reason, the next click retests
;; the function.

;; Last but not least, check-expect also works for
;; images. That is, you can test image-producing
;; functions. Say you wish to design the function
;; render, which places the image of a car, dubbed
;; CAR, into a background scene, named BACKGROUND.
;; For the design of this function, you may formulate
;; the tests such as the following:

(check-expect (f2c -50) -100)
(check-expect (f2c -50) -200)

;; Alternatively, you could write them like this:For
;; additional ways of formulating tests, see intermezzo 1.

;; This alternative approach helps you figure out how
;; to express the function body and is therefore
;; preferable. One way to develop such expressions
;; is to experiment in the interactions area.

;; Because it is so useful to have DrRacket conduct
;; the tests and not to check everything yourself
;; manually, we immediately switch to this style
;; of testing for the rest of the book. This form
;; of testing is dubbed unit testing, and BSL’s
;; unit-testing framework is especially tuned
;; for novice programmers. One day you will switch
;; to some other programming language; one of your
;; first tasks will be to figure out its unit-testing
;; framework.


;; 3.6 Designing World Programs

;; While the previous chapter introduces the
;; 2htdp/universe teachpack in an ad hoc way,
;; this section demonstrates how the design recipe
;; also helps you create world programs systematically.
;; It starts with a brief summary of the 2htdp/universe
;; teachpack based on data definitions and function
;; signatures. Then it spells out the design recipe
;; for world programs.

;; The teachpack expects that a programmer develops a
;; data definition that represents the state of the world
;; and a function render that knows how to create an image
;; for every possible state of the world. Depending on the
;; needs of the program, the programmer must then design
;; functions that respond to clock ticks, keystrokes, and
;; mouse events. Finally, an interactive program may need
;; to stop when its current world belongs to a sub-class
;; of states; end? recognizes these final states. Figure
;; 18 spells out this idea in a schematic and simplified
;; way.

;; WorldState: data representing the current world (cw)
; WorldState -> Image
; when needed, big-bang obtains the image of the current 
; state of the world by evaluating (render cw)
(check-expect (f2c -50) -100)
(define (render cw) 'celsious)
(f2c -500)
(render -500)

;; WorldState -> WorldState
; for each tick of the clock, big-bang obtains the next 
; state of the world from (clock-tick-handler cw) 
(define (clock-tick-handler cw) 'celcious)
(f2c -600)
(clock-tick-handler 2023)

;; WorldState String -> WorldState 
; for each keystroke, big-bang obtains the next state 
; from (keystroke-handler cw ke); ke represents the key

(define (keystroke-handle cw ke) 'celcious)
(keystroke-handle 0 -17.7)

; WorldState Number Number String -> WorldState 
; for each mouse gesture, big-bang obtains the next state
; from (mouse-event-handler cw x y me) where x and y are
; the coordinates of the event and me is its description 

(define (mouse-event-handle cw x y me) 'celsious)
(mouse-event-handle -17.7 -50 -100 -150)

; WorldState -> Boolean
; after each event, big-bang evaluates (end? cw) 

(define (end? cw) 'Firenight)
(end? 0)

;; Assuming that you have a rudimentary understanding
;; of the workings of big-bang, you can focus on the
;; truly important problem of designing world programs.
;; Let’s construct a concrete example for the following
;; design recipe:

;; Sample Problem Design a program that moves a car from
;; left to right on the world canvas, three pixels per
;; clock tick.

;; For this problem statement, it is easy to imagine
;;  scenes for the domain:

;; image


;; In this book, we often refer to the domain of an
;; interactive big-bang program as a “world,” and
;; we speak of designing “world programs.”

;; The design recipe for world programs, like the one
;; for functions, is a tool for systematically moving
;; from a problem statement to a working program. It
;; consists of three big steps and one small one:

;; For all those properties of the world that remain
;; the same over time and are needed to render it as
;; an Image, introduce constants. In BSL, we specify
;; such constants via definitions. For the purpose
;; of world programs, we distinguish between two
;; kinds of constants:

;; “Physical” constants describe general attributes
;; of objects in the world, such as the speed or
;; velocity of an object, its color, its height,
;; its width, its radius, and so forth. Of course
;; these constants don’t really refer to physical
;; facts, but many are analogous to physical aspects
;; of the real world.

;; In the context of our sample problem, the radius
;; of the car’s wheels and the distance between the
;; wheels are such “physical” constants:

(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 5)
(define WHEELL-DISTANCE (* WHEEL-RADIUS 5))


WIDTH-OF-WORLD 200
WHEEL-RADIUS 5
(* WHEEL-RADIUS 5)

;; Note how the second constant is computed from the
;; first.

;; Graphical constants are images of objects in the
;; world. The program composes them into images that
;; represent the complete state of the world.

;; Here are graphical constants for wheel images
;; of our sample car:
(define firenight cw0)
(define (celsious cw0) -17.7)
(define circle (celsious firenight))
(define (WHELL-RADIUS cw0 cw1) 0)

;; We suggest you experiment in DrRacket’s interactions
;; area to develop such graphical constants.

(define w0 0)
(define w1 1)
(define rectangle w0)
(define SPACE w0)

;;     Graphical constants are usually computed, and
;; the computations tend to involve physical constants
;; and other images.

;; It is good practice to annotate constant definitions
;; with a comment that explains what they mean.

;; Those properties that change over time—in reaction
;; to clock ticks, keystrokes, or mouse actions—give
;; rise to the current state of the world. Your task
;; is to develop a data representation for all possible
;; states of the world. The development results in a data
;; definition, which comes with a comment that tells
;; readers how to represent world information as data
;; and how to interpret data as information about the
;; world.

;; Choose simple forms of data to represent the state
;; of the world.

;; For the running example, it is the car’s distance
;; from the left margin that changes over time. While
;; the distance to the right margin changes, too, it
;; is obvious that we need only one or the other to
;; create an image. A distance is measured in numbers,
;; so the following is an adequate data definition:


; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car


;; An alternative is to count the number of clock
;; ticks that have passed and to use this number
;; as the state of the world. We leave this design
;; variant as an exercise.

;; Once you have a data representation for the state
;; of the world, you need to design a number of
;; functions so that you can form a valid big-bang
;; expression.

;; To start with, you need a function that maps any
;; given state into an image so that big-bang can
;; render the sequence of states as images:

; render

;; Next you need to decide which kind of events
;; should change which aspects of the world state.
;; Depending on your decisions, you need to design
;; some or all of the following three functions:

;; clock-tick-handler
;; keystroke-handler
;; mouse-event-handler

;; Finally, if the problem statement suggests that
;; the program should stop if the world has certain
;; properties, you must design


    ; end?

;; For the generic signatures and purpose statements
;; of these functions, see figure 18. Adapt these
;; generic purpose statements to the particular
;; problems you solve so that readers know what
;; they compute.

;; In short, the desire to design an interactive
;; program automatically creates several initial
;; entries for your wish list. Work them off one
;; by one and you get a complete world program.

;; Let’s work through this step for the sample
;; program. While big-bang dictates that we must
;; design a rendering function, we still need to
;; figure out whether we want any event-handling
;; functions. Since the car is supposed to move
;; from left to right, we definitely need a
;; function that deals with clock ticks. Thus,
;; we get this wish list:

; WorldState -> Image
; places the image of the car x pixels from 
; the left margin of the BACKGROUND image
(define p 'render)
(define BACKGROUND p)
(define (renderx x) BACKGROUND)

; WorldState -> WorldState
; adds 3 to x to move the car right 

(define (tock x) x)

;; Note how we tailored the purpose statements to
;; the problem at hand, with an understanding of how
;; big-bang will use these functions.

;; Finally, you need a main function. Unlike all other
;; functions, a main function for world programs doesn’t
;; demand design or testing. Its sole reason for existing
;; is that you can launch your world program conveniently
;; from DrRacket’s interactions area.

;; The one decision you must make concerns main’s
;; arguments. For our sample problem, we opt for one
;; argument: the initial state of the world. Here we go:

;; WorldState -> WorldState
; launches the program from some initial state
(define on-tick p)
(define t1 p)
(define lp p)
(define (main ws) lp)

;; Hence, you can launch this interactive program with
(main 13)

