(message "var-settings.el:begin")

(require 'winum)
(winum-mode)

;; auto-revert buffers when they're changed on filesystem
;; only works sometimes, unfortunately :/
(global-auto-revert-mode 1)

;; Paste over highlighted regions
(delete-selection-mode 1)

;; Try to stop projectile-helm (spc-p-h) from hanging in non-git dirs
;; (which for me is all non-project dirs because homedir is git)
;; See https://github.com/bbatsov/projectile/issues/600
(setq gc-cons-threshold 100000000)

;; Use greek letter for lambda (or fn in clj)
;; Turned off, very reluctantly, because it was screwing up indentation
;; (global-prettify-symbols-mode t)
;; (setq clojure-enable-fancify-symbols t)

;; Ensure any of my own libs are loaded first:
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; No need, typically, to save history of *messages* buffer or minibuffer,
;; and it has a perf cost (per @ag):
(savehist-mode -1)

;; TODO uncomment
;; (windmove-default-keybindings)
;; (spacemacs/toggle-maximize-frame-on)

;; force-enable undo-tree mode everywhere
;; (undo-tree-mode 1)
;; (global-undo-tree-mode)

;; don't save desktop layout
;; (desktop-save-mode nil)

;;;; VARS

(message "var-settings.el: setq-default")

(setq-default

 ;; Cmd-1..9 should refer to #s in the current frame, NOT globally
 winum-scope 'frame-local

;;;;; TODO experimenting with starting modeline from scratch based on spacemacs conventions. 12/11/20
;; ;;; mode-line/powerline
;;  powerline-narrow t
;;  powerline-nano-theme t
;;  cider-repl-display-help-banner nil
;;  ;; Don't show cider info on the mode-line
;;  cider-mode-line nil
;;  ;; Or version control...
;;  ;; See https://github.com/TheBB/spaceline#turning-segments-on-and-off
;;  spaceline-version-control-p nil
;;  ;; Or the fact that we're using unix newlines
;;  buffer-encoding-abbrev-p nil
;;  ;; Or the size of the friggin file
;;  buffer-sizep nil
;;  ;; Or the major mode because I just don't have room
;;  mode-name nil
;;  mode-line-modes nil
;;  ;; Don't show minor mode logos on the mode-line
;;  spaceline-minor-modes-p nil
;;  ;; time in modeline
;;  display-time-mode 1
;;  ;; TODO wait and still if these speed boosts are still needed
;;  ;; Turn unicode symbols off in modeline. Provides speed boost. Via
;;  ;; https://github.com/syl20bnr/spacemacs/issues/1114
;;  ;; dotspacemacs-mode-line-unicode-symbols nil
;;  ;; Speed boost, ibid link
;;  ;; modeline-scale 0.5

 ;; Tabs are 4 spaces
 tab-width 4 ; or any other preferred value

 ;; by default, magit restores the previous window layout on quit (& note that
 ;; 'quit' actually means bury the buffer, leaving the magit buffers open).
 ;; this is done by the default value of magit-bury-buffer-function, which is
 ;; magit-restore-window-configuration. Set magit-bury-buffer-function to nil
 ;; instead so that won't happen. See https://magit.vc/manual/magit.html#Quitting-Windows
 magit-bury-buffer-function 'quit-window

 ;; TODO uncomment
 ;; vc-follow-symlinks t
 ;; undo-tree-auto-save-history t
 ;; undo-tree-history-directory-alist '(("." . "~/tmp/.undo-tree/"))
 ;; org-agenda-files '("~/Dropbox/OrgNotes/org-agenda.org" "/home/egg/Dropbox/OrgNotes/")
 ;; windmove-wrap-around t

 ;; don't save desktop layout
 desktop-save nil

 )

(message "var-settings.el: mode-specific settings")

(with-eval-after-load 'clojure-mode
  (setq-default
   cljr-magic-require-namespaces '(("io"     . "clojure.java.io")
                                   ("set"    . "clojure.set")
                                   ("str"    . "clojure.string")
                                   ("walk"   . "clojure.walk")
                                   ("zip"    . "clojure.zip")
                                   ("spec"    . "clojure.spec.alpha")
                                   ("stest"   . "clojure.spec.test.alpha")
                                   ("datomic" . "datomic.api"))

   ;; pretty-print always in repl
   cider-repl-use-pretty-printing t

   cider-print-options            '(("length" 100))
   cider-repl-history-size        5000 ; the default is 500
   cider-repl-history-file        ".cider-history"
   cider-repl-prompt-function     'cider-repl-prompt-lastname
   cider-repl-display-in-current-window t
   nrepl-log-messages             t
   cider-save-file-on-load        nil


   )

  (dolist (x '(spacemacs-jump-handlers-clojure-mode
               spacemacs-jump-handlers-clojurec-mode
               spacemacs-jump-handlers-clojurescript-mode
               spacemacs-jump-handlers-clojurex-mode
               spacemacs-jump-handlers-cider-repl-mode))
    (set x '(clj-find-var)))


  )

;; Otherwise spacemacs disables undo-tree in many buffers; see https://github.com/syl20bnr/spacemacs/issues/14064
(with-eval-after-load 'undo-tree (defun undo-tree-overridden-undo-bindings-p () nil))
