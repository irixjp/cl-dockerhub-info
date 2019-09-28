(defsystem "cl-dockerhub-info"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("jonathan"
               "dexador"
               "quri"
               "cl-ppcre")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "cl-dockerhub-info/tests"))))

(defsystem "cl-dockerhub-info/tests"
  :author ""
  :license ""
  :depends-on ("cl-dockerhub-info"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-dockerhub-info"
  :perform (test-op (op c) (symbol-call :rove :run c)))
