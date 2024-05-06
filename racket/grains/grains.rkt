#lang racket

(provide square total)

(define (square a-square)
  (expt 2 (- a-square 1)))

(define (total)
  (- (expt 2 64) 1))
