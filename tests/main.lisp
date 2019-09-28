(defpackage cl-dockerhub-info/tests/main
  (:use :cl
        :cl-dockerhub-info
        :rove))
(in-package :cl-dockerhub-info/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-dockerhub-info)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
