#lang racket

(provide leap-year?)

(define (leap-year? year)
  (cond
    [(zero? (remainder year 4)) (#t)]
    [else (if (and 
           
     




  )
