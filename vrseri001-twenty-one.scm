;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;      CS 3 Scheme programming assignment               ;;;;
;;;;                 April 2016                            ;;;;
;;;;        Erin Versfeld's solutions vrseri001            ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  
;; This depends on "cs3-black-jack.scm"
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  Your code goes here                                    ;;;;
;;;;  Submit a file of code of everything you created below  ;;;;
;;;;  please do not submit the predefined code               ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Question 1.  Code for "best-hand"
;; Determine whether the hand thus far should consider its aces as ones or elevens
;; and calculate the score thus far based on that discovery
;; Test-cases: 
;;	- input: '((8 c) (A h) (2 h)) output: 21
;;	- input: '((8 c) (A h) (2 h) (5 s)) output: 16
;;	- input: '((5 c) (A h) (2 h) (A s)) output: 19
;;	- input: '((A c) (A h) (A d) (A s)) output: 14
;; The algorithm works thus:
;;	- there can be at most four aces in a hand, limited by the number of suits
;;	- there can be at most one ace worth eleven points, as having two aces
;;	  both worth eleven points would result in the player losing the game
;;	- the difference between the worth of a hand when an ace is worth one and 
;;	  when an ace is worth eleven is ten points
;;	- therefore initially calculate the total score when the ace is worth one
;;	  and see if by adding ten (i.e., making one of the aces worth eleven 
;;	  instead) the score is not yet greater than 21
;;	- if the result is in favour of eleven, return that result, otherwise
;;	  return the initial result
(define (best-hand hand)
   (if (<= (aces-eleven hand) 21) (aces-eleven hand) (min-val hand)))

(define (aces-eleven hand)
   (+ (min-val hand) 10))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Question 2.  "stop-at"
;; Stops the specified hand count
;; Test-cases:
;;	- 
;; The algorithm works thus:
;;	- given a value n
;;	- stop drawing when your hand is greater than or equal to n
(define (stop-at n)
   (lambda (n)
	(lambda (customer-hand-so-far dealer-up-card)
		(< (best-hand customer-hand-so-far) n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Question 3.  "repeat-game"
;; Play n games with a specified strategy
;; Possible strategies:
;;	- (stop-at n): player stops picking up cards when hand is greater 
;;	  than or equal to n
;; Test-cases:
;;	-
;; The algorithm works thus:
;;	- given a value n
;;	-
(define (repeat-game strategy n)
   (do (i 0 (+ i 1)))
      ((<= i n) (black-jack strategy) ("strategy not supported"))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Question 4.    clever
;; A new strategy that considers both the player's current total and the
;; dealer's up card.
;; The rules are thus:
;;	- IF: player <= 11, you take a hit
;;	- IF: player >= 17, you stand
;;	- IF: player == 12, AND: dealer's up card 4 OR 5 OR 6, you hit
;;	- IF: 13 <= player <= 16 AND


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;      Question 5.                Majority
;;;
;; [add description and test -cases]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;        Question 6.              Get Stats
;;;
;; [add description and test -cases]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   Question 8.   interactive 
;; [add description and user insctructions]

; function to get the input returns #t if the user types y otherwise #f
(define (hit-me?)
  (eq? (read) 'y))

