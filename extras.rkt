#lang racket
(require (for-syntax racket/base)
         racket/path
         rackunit
         rackunit/log)

(provide check-error)

;;; Cheesy patch in my opinion
;;; It's for checking with the conflict of check-within from
;;; test-engine/scheme-tests apparently.
;;; Armozel 2019/05/14
;;; Original source code at
;;; https://course.ccs.neu.edu/cs5010f17/ProblemSets/extras.rkt
(define-syntax (check-error stx)
  (syntax-case stx ()
    [(_ code . msg) #`(check-exn exn:fail? (lambda () code) . msg)]))
