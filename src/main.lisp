(defpackage cl-dockerhub-info
  (:use :cl)
  (:import-from :quri)
  (:import-from :dexador)
  (:import-from :jonathan)
  (:import-from :cl-ppcre)
  (:export :get-image-info
           :get-tags-list))
(in-package :cl-dockerhub-info)

(defvar *docker-hub-api* "https://registry.hub.docker.com/v2/repositories/")

(defun make-image-path (image)
  (if (ppcre:scan "[a-zA-Z0-9_.-]+/[a-zA-Z0-9_.-]+" image)
      image
      (concatenate 'string "library/" image)))

(defun get-image-info (image key)
  (let* ((url (quri:make-uri :defaults
                             (concatenate 'string
                                          *docker-hub-api*
                                          (make-image-path image)
                                          "/")))
         (data (getf (jonathan:parse (dex:get url)) (intern key :keyword))))
    (format t "~A~%" data)))

(defun get-tags-list (image)
  (let* ((url (quri:make-uri :defaults
                             (concatenate 'string
                                          *docker-hub-api*
                                          (make-image-path image)
                                          "/tags/")))
         (data (mapcar #'(lambda (tag-info) (getf tag-info :|name|))
                       (getf (jonathan:parse (dex:get url)) :|results|))))
    (format t "~{~A~%~}" data)))


;; blah blah blah.
