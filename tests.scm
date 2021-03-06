(assert #t)
(assert (not #f))
(assert (not (not #t)))

(assert (eq? '() '()))
(assert (eq? 1 1))
(assert (eq? 'x 'x))
(assert (not (eq? 0 1)))
(assert (not (eq? 'x 'y)))
(assert (not (eq? '() '(x))))

(assert (= 1 1))
(assert (not (= 1 2)))

(assert (boolean? #t))
(assert (boolean? #f))
(assert (not (boolean? '())))
(assert (not (boolean? 0)))
(assert (not (boolean? "")))

(assert (number? 0))
(assert (number? 1))
(assert (not (number? '())))
(assert (not (number? #f)))

(assert (symbol? 'abc))
(assert (not (symbol? '())))
(assert (not (symbol? "abc")))
(assert (not (symbol? (cons 1 2))))
(assert (not (symbol? (vector))))

(assert (equal? (symbol->string 'abc) "abc"))

(assert (char? #\a))
(assert (not (char? "ab")))

(assert (string? "abc"))
(assert (not (string? '())))
(assert (not (string? 'abc)))
(assert (not (string? (cons "1" "2"))))
(assert (not (string? (vector))))

(assert (= (string-length "") 0))
(assert (= (string-length "abc") 3))

(assert (eq? (string-ref "abc" 1) #\b))

(assert (eq? (substring "abc" 1 1) ""))
(assert (eq? (substring "abc" 0 1) "a"))
(assert (eq? (substring "abc" 1 3) "bc"))

(assert (char-numeric? #\5))
(assert (not (char-numeric? #\a)))

(assert (char-alphabetic? #\k))
(assert (char-alphabetic? #\L))
(assert (not (char-alphabetic? #\4)))

(assert (pair? (cons 1 2)))
(assert (not (pair? '())))
(assert (not (pair? 1)))
(assert (not (pair? "abc")))
(assert (not (pair? (vector 1 2))))

(assert (vector? (vector)))
(assert (vector? (vector 1 2)))
(assert (not (vector? '())))
(assert (not (vector? 0)))
(assert (not (vector? "abc")))

(assert (equal? '() '()))
(assert (equal? 1 1))
(assert (equal? 'x 'x))
(assert (not (equal? 0 1)))
(assert (not (equal? 'x 'y)))
(assert (not (equal? '() '(x))))
(assert (equal? '(1 2 3) '(1 2 3)))
(assert (not (equal? '(1 2 3) '(1 2 4))))
(assert (not (equal? '(1 2 3) '(1 2 3 4))))
(assert (equal? "abc" "abc"))
(assert (equal? (vector 1 2 3) (vector 1 2 3)))
(assert (not (equal? (vector 1 2 3) (vector 1 2 4))))
(assert (not (equal? (vector 1 2 3) (vector 1 2 3 4))))

(assert (null? '()))
(assert (not (null? 0)))
(assert (not (null? "")))
(assert (not (null? '(x))))

(assert (< 0 1))
(assert (< -1 1))
(assert (not (< 1 1)))
(assert (not (< 1 0)))

(assert (eq? (car '(1 . 2)) 1))
(assert (eq? (cdr '(1 . 2)) 2))
(assert (eq? (car (cons 1 2)) 1))
(assert (eq? (cdr (cons 1 2)) 2))
(assert (eq? (cdr '(0)) '()))

(assert (eq? (+) 0))
(assert (eq? (+ 1) 1))
(assert (eq? (+ 1 2) 3))
(assert (eq? (+ 1 2 3) 6))

(assert (eq? (- 1) -1))
(assert (eq? (- 3 1) 2))
(assert (eq? (- 3 1 2) 0))

(assert (equal? (append) '()))
(assert (equal? (append '() '()) '()))
(assert (equal? (append '(1 2) '() '(3)) '(1 2 3)))

(assert (equal? (list->vector '(1 2 3)) (vector 1 2 3)))
(assert (equal? (vector->list (vector 1 2 3)) '(1 2 3)))

(assert (equal? (string-append) ""))
(assert (equal? (string-append "a") "a"))
(assert (equal? (string-append "a" "bcd" "e") "abcde"))

(assert (equal? (string) ""))
(assert (equal? (string #\a) "a"))
(assert (equal? (string #\a #\b #\c) "abc"))

(assert (equal? (string->number "123") 123))
(assert (equal? (number->string 123) "123"))

(assert (equal? (map (lambda (x) (error 'must-not-be-called)) '()) '()))
(assert (equal? (map (lambda (x) (+ x 1)) '(1 2 3)) '(2 3 4)))

(assert (equal? (assoc 2 '((1 a) (3 c))) #f))
(assert (equal? (assoc 2 '((1 a) (2 b) (3 c))) '(2 b)))

(assert (equal? (length '()) 0))
(assert (equal? (length '(a)) 1))
(assert (equal? (length '(a b)) 2))
(assert (equal? (length '(a b c d e)) 5))

(assert (equal? (display-to-string '()) "()"))
(assert (equal? (display-to-string 123) "123"))
(assert (equal? (display-to-string "abc") "abc"))
(assert (equal? (display-to-string 'abc) "abc"))
(assert (equal? (display-to-string '(1 2 3)) "(1 2 3)"))
(assert (equal? (display-to-string '(1 2 . 3)) "(1 2 . 3)"))
(assert (equal? (display-to-string (vector)) "[]"))
(assert (equal? (display-to-string (vector 1)) "[1]"))
(assert (equal? (display-to-string (vector 1 2 3)) "[1 2 3]"))

(assert (equal? (letrec ((a (lambda (x) (if (null? x) 0 (+ (b (cdr x)) 1))))
			 (b (lambda (x) (a x))))
		  (a '(a b c)))
		3))
(assert (equal? (letrec ((a (lambda () b)) (b 1)) (a)) 1))

(assert (equal? (let ((x 1)) (let* ((a x) (x 2)) (list a x))) '(1 2)))
