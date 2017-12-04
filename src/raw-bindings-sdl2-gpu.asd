;;;raw-bindings-sdl2-gpu - FFI bindings to SDL2_gpu
;;;Written in 2017 by Wilfredo Velázquez-Rodríguez <zulu.inuoe@gmail.com>
;;;
;;;To the extent possible under law, the author(s) have dedicated all copyright
;;;and related and neighboring rights to this software to the public domain
;;;worldwide. This software is distributed without any warranty.
;;;You should have received a copy of the CC0 Public Domain Dedication along
;;;with this software. If not, see
;;;<http://creativecommons.org/publicdomain/zero/1.0/>.

(defsystem #:raw-bindings-sdl2-gpu
  :name "raw-bindings-sdl2-gpu"
  :description "Bindings and minor utilities for SDL2_gpu."
  :author "Wilfredo Velázquez-Rodríguez <zulu.inuoe@gmail.com>"
  :license "CC0 <http://creativecommons.org/publicdomain/zero/1.0/>"
  :serial t
  :components
  ((:file "package")
   (:file "macros")
   (:file "library")
   (:module "ffi"
    :serial t
    :components
    ((:file "gpu"))))
  :depends-on
  (#:cffi
   #:defpackage-plus
   #:raw-bindings-sdl2))