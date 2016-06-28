;;; init-hydra.el --- Summary
;;; Commentary:
;;; hydra config
;;; Code:
(require-package 'hydra)
(require 'hydra)
(defhydra hydra-eclim (:color teal
                              :hint nil)
  "
Eclim:
 ╭─────────────────────────────────────────────────────┐
 │ Java                                                │       Problems
╭┴─────────────────────────────────────────────────────┴────────────────────────────────────╯
  _d_: Show Doc             _i_: Implement (Override)          _p_: Show Problems
  _g_: Make getter/setter  _fd_: Find Declarations             _c_: Show Corrections
  _o_: Organize Imports    _fr_: Find References               _r_: Buffer Refresh
  _h_: Hierarchy            _R_: Refactor

Project
─────────────────────────────────────────────────────────
_j_: Jump to proj
_b_: Create
_k_: Import Proj
^_l_: Logcat
"
  ("d"   eclim-java-show-documentation-for-current-element)
  ("g"   eclim-java-generate-getter-and-setter)
  ("o"   eclim-java-import-organize)
  ("h"   eclim-java-call-hierarchy)
  ("i"   eclim-java-implement)
  ("fd"  eclim-java-find-declaration)
  ("fr"  eclim-java-find-references)
  ("R"   eclim-java-refactor-rename-symbol-at-point)
  ("p"   eclim-problems)
  ("c"   eclim-problems-correct)
  ("r"   eclim-problems-buffer-refresh)
  ("j"   eclim-project-goto)
  ("b"   eclim-project-create)
  ("k"   eclim-project-import)
  ("a"   android-start-app)
  ("m"   my-clean-debug-install)
  ("e"   android-start-emulator)
  ("l"   android-logcat)
  ("q"   nil "cancel" :color blue))

(define-key eclim-mode-map (kbd "C-c e") 'hydra-eclim/body)
(provide 'init-hydra)
;;; init-hydra.el ends here
