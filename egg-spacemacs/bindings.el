(message "Loading egg's custom bindings.")

;; Top-level keys available for binding:
;; - Backtick (currently bound to evil-goto-mark-line, but I have tick bound to evil-goto-mark which is better)

(defun left-mod (keychar)
  "Return the appropriate modkey + keychar reference (ie for (left-mod '*',
'M-*' on mac, 'C-*' on linux [because I swap alt & ctrl on linux])"
  (interactive)
  (if (string-equal system-type "darwin")
      (concat "A-" keychar)
    (concat "M-" keychar)))

(defun right-mod (keychar)
  "Return the appropriate modkey + keychar reference (ie for (right-mod '*',
'M-*' on mac, 'C-*' on linux [because I swap alt & ctrl on linux])"
  (interactive)
  (if (string-equal system-type "darwin")
      (concat "M-" keychar)
    (concat "C-" keychar)))

;; First of all, use ctrl-number to switch to a window! Already works on
;; Mac with the command key, so we just need to set literal ctrl instead of
;; right-mod.
(global-set-key (kbd "C-0") 'treemacs-select-window)
(global-set-key (kbd "C-1") 'winum-select-window-1)
(global-set-key (kbd "C-2") 'winum-select-window-2)
(global-set-key (kbd "C-3") 'winum-select-window-3)
(global-set-key (kbd "C-4") 'winum-select-window-4)
(global-set-key (kbd "C-5") 'winum-select-window-5)
(global-set-key (kbd "C-6") 'winum-select-window-6)
(global-set-key (kbd "C-7") 'winum-select-window-7)
(global-set-key (kbd "C-8") 'winum-select-window-8)
(global-set-key (kbd "C-9") 'winum-select-window-9)

;; Use command key as Meta, option as Alt, fn as Hyper
(setq mac-option-modifier 'alt)
(setq mac-command-modifier 'meta)
(setq mac-function-modifier 'hyper)

(define-key evil-normal-state-map (kbd "SPC :") 'eval-expression)

;; Make = and \ stand in for ^ and $ like I do in vim
;; (this makes sense only for dvorakians)
(define-key evil-normal-state-map (kbd "=") 'back-to-indentation)
(define-key evil-motion-state-map (kbd "=") 'back-to-indentation)
(define-key evil-normal-state-map (kbd "\\") 'move-end-of-line)
(define-key evil-motion-state-map (kbd "\\") 'move-end-of-line)

;; Let Cmd-movement keys work as movement keys in insert mode
(define-key evil-insert-state-map (kbd (right-mod "l")) 'evil-forward-char)
(define-key evil-insert-state-map (kbd (right-mod "h")) 'evil-backward-char)
(define-key evil-insert-state-map (kbd (right-mod "j")) 'evil-next-line)
(define-key evil-insert-state-map (kbd (right-mod "k")) 'evil-previous-line)

;; TODO I think this is redundant with the global-set-key below
(define-key evil-insert-state-map (kbd (right-mod "v")) 'maclike-paste)

;; Have to redefine the few fn-modified-keys I use, since we've
;; coopted fn as hyper
(global-set-key (kbd "H-<down>") 'evil-scroll-page-down)
(global-set-key (kbd "H-<up>") 'evil-scroll-page-up)

;; Shift up/down arrows should scroll buffer up/down a line
(define-key evil-normal-state-map (kbd "S-<up>") 'evil-scroll-line-up)
(define-key evil-normal-state-map (kbd "S-<down>") 'evil-scroll-line-down)
(global-set-key (kbd "S-<up>") 'evil-scroll-line-up)
(global-set-key (kbd "S-<down>") 'evil-scroll-line-down)

;; SM on mac has stopped recognizing ";" as evil-ex
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-visual-state-map (kbd ";") 'evil-ex)
;; and ""
(setq-default dotspacemacs-major-mode-leader-key ",")
;; (define-key evil-normal-state-map (kbd ",") 'major-mode-cmd)

;; TODO for use with REPL auto-save if I ever get around to that
;; (defun show-time ()
;;   (interactive)
;;   (message (current-time-string)))


(define-key evil-insert-state-map (kbd "<tab>") 'evil-complete-next)
(define-key evil-insert-state-map (kbd "S-<tab>") 'evil-complete-previous)

(global-set-key (kbd (right-mod ".")) 'completion-at-point)
(global-set-key (kbd (right-mod "c")) 'evil-yank)
;; Put paste on both mod keys, because C-v can't be used in linux
(global-set-key (kbd (right-mod "v")) 'maclike-paste)
(global-set-key (kbd (left-mod "v")) 'maclike-paste)
(define-key evil-normal-state-map (kbd "SPC b y") 'spacemacs/copy-whole-buffer-to-clipboard)
(global-set-key (kbd (left-mod "<backspace>")) 'backward-kill-word)
(global-set-key (kbd (left-mod "<left>")) 'evil-backward-WORD-begin)
(global-set-key (kbd (left-mod "<right>")) 'evil-forward-WORD-begin)
(global-set-key (kbd (right-mod "q")) 'save-buffers-kill-emacs)
(global-set-key (kbd (right-mod "a")) 'mark-whole-buffer)
(global-set-key (kbd (right-mod "s")) 'save-buffer)
(global-set-key (kbd (right-mod "`")) 'spacemacs/comment-or-uncomment-lines)
;; (global-set-key (kbd (right-mod "n")) 'lunaryorn-new-buffer-frame)
(global-set-key (kbd (right-mod "n")) 'new-frame)
(define-key evil-normal-state-map (kbd "SPC f n") 'new-frame)
(global-set-key (kbd (right-mod "w")) 'delete-frame)
(define-key evil-normal-state-map (kbd "SPC f d") 'delete-frame)
(global-set-key (kbd (right-mod "`")) 'ns-next-frame)
(global-set-key (kbd (right-mod "~")) 'ns-prev-frame)

;; A few more borrowed from the osx layer
;; See http://spacemacs.org/layers/osx/README
(global-set-key (kbd (right-mod "=")) 'spacemacs/scale-up-font)
;; This one's not working, dunno why:
(global-set-key (kbd (right-mod "-")) 'spacemacs/scale-down-font)
;; TODO try disabling 12/11/20
;; (global-set-key (kbd (right-mod "z")) 'undo-tree-undo)
;; (global-set-key (kbd (right-mod "Z")) 'undo-tree-redo)
;; (global-set-key (kbd "C-z") 'undo-tree-redo)

(define-key evil-normal-state-map (kbd ":") 'spacemacs/evil-search-clear-highlight)
(define-key evil-normal-state-map (kbd (right-mod "/")) 'nonincremental-re-search-forward)

;; U ("union") joins line to the PRECEDING line
(define-key evil-normal-state-map (kbd "U") "kJ")
(define-key evil-normal-state-map (kbd "-") 'evil-jump-item)
(define-key evil-visual-state-map (kbd "-") 'evil-jump-item)
(define-key evil-normal-state-map (kbd "gb") 'evil-jumper/backward)
(define-key evil-normal-state-map (kbd "ƒ") 'helm-find-files)
(define-key evil-normal-state-map (kbd "SPC ;") 'helm-M-x)
(define-key evil-normal-state-map (kbd "SPC '") 'dabbrev-completion)
(define-key evil-normal-state-map (kbd "SPC .") 'shell)

(define-key evil-normal-state-map (kbd "SPC x k") 'string-inflection-kebab-case)
(define-key evil-normal-state-map (kbd "SPC x C") 'string-inflection-camelcase)
(define-key evil-normal-state-map (kbd "SPC x a x") 'align-regexp)
(define-key evil-normal-state-map (kbd "SPC j g") 'dumb-jump-go)
(define-key evil-normal-state-map (kbd "SPC r c") 'copy-to-register)
(define-key evil-normal-state-map (kbd "SPC r p") 'evil-paste-from-register)
(define-key evil-normal-state-map (kbd "SPC g c") 'vc-resolve-conflicts)
(define-key evil-normal-state-map (kbd "SPC f m") 'toggle-frame-maximized)
(define-key evil-normal-state-map (kbd "SPC s v") 'save-some-buffers)
(define-key evil-normal-state-map (kbd "SPC b f") 'diff-buffer-with-file)
;; Reverse the standard binding of ' vs `
(define-key evil-normal-state-map (kbd "'") 'evil-goto-mark)
(define-key evil-normal-state-map (kbd "`") 'evil-goto-mark-line)

;; Quickly switch to zenburn theme
(defun switch-to-zenburn ()
  (interactive)
  (helm-themes--load-theme "zenburn"))
(define-key evil-normal-state-map (kbd "SPC T z") 'switch-to-zenburn)

;; I use SPC d for some of my own stuff
(which-key-add-key-based-replacements "SPC d" "egg stuff") ; name prefix
(define-key evil-normal-state-map (kbd "SPC d d") 'spacemacs/duplicate-line-or-region)

;; left-mod-g is redundant with <esc> by default -- use it to trigger git
(global-set-key (kbd (left-mod "g")) 'magit-status)

;;;;;;;; Mode-specific key bindings ;;;;;;;

(defun jump-to-cider-error ()
  (interactive)
  (switch-to-buffer "*cider-error*"))

(defun jump-past (c)
  (interactive)
  (evil-find-char 1 c)
  (evil-forward-char))

(defun jump-past-back (c)
  (interactive)
  ;; TODO not totally happy with behavior here.
  (evil-backward-char)
  (evil-find-char-backward 1 c)
  (evil-forward-char))

;; In clojure, I treat foo-bar as a single word (via modify-syntax-entry below)
;; so this lets me pretend it's two words when I need to.

(defun jump-past-hyphen ()
  (interactive)
  (jump-past ?-))

(defun jump-past-hyphen-back ()
  (interactive)
  (jump-past-back ?-))

(defun delete-sexp ()
  (interactive)
  (evil-lisp-state-sp-kill-sexp)
  (pop kill-ring))

(defun copy-current-ns ()
  (interactive)
  (kill-new (cider-current-ns)))

;; grab the fully-qualified symbol name at point
(defun copy-current-qualified-symbol-name ()
  (interactive)
  (kill-new
  (concat (cider-current-ns)
          "/"
          (symbol-name (symbol-at-point)))))

(defun save-and-send-to-switch-to-repl ()
  (interactive)
  (save-buffer)
  (cider-load-buffer-and-switch-to-repl-buffer))

(defun cider-format-region-or-buffer (start end)
  (interactive "r")
  (if mark-active
      (cider-format-region start end)
    (cider-format-defun)))

;; kill sexp and enter insert mode
(defun change-sexp (& args)
  (interactive "r")
  (sp-kill-sexp)
  (evil-insert 0))

(with-eval-after-load 'lisp-mode ; anything with sexps
  ;; Use cap L and H to move forward/back by sexp
  (define-key evil-normal-state-map (kbd "L") 'sp-next-sexp)
  (define-key evil-normal-state-map (kbd "H") 'sp-beginning-of-previous-sexp)
  (define-key evil-normal-state-map (kbd (left-mod "b")) 'save-and-send-to-switch-to-repl)
  (define-key evil-normal-state-map (kbd "¢")   'sp-copy-sexp) ; A-c gets corrupted somehow
  (define-key evil-normal-state-map (kbd (left-mod "c")) 'sp-copy-sexp) ; yank sexp
  (define-key evil-normal-state-map (kbd (left-mod "d")) 'sp-kill-sexp) ; kill sexp
  (define-key evil-normal-state-map (kbd (left-mod "m")) 'change-sexp) ; change sexp
  ;; (define-key evil-normal-state-map (kbd (left-mod "a")) 'delete-sexp) ; murder sexp (don't put on kill ring)
  (define-key evil-normal-state-map (kbd (left-mod "r")) 'evil-lisp-state-sp-raise-sexp) ; raise sexp
  (define-key evil-normal-state-map (kbd (left-mod "w")) 'evil-lisp-state-wrap) ; wrap in sexp


  ;; TODO decide if I really want these. I find it pretty nonintuitive...
  (global-set-key (kbd (left-mod "<left>")) 'paredit-backward)
  (global-set-key (kbd (left-mod "<right>")) 'paredit-forward)
  (global-set-key (kbd (left-mod "<up>")) 'paredit-backward-up)
  (global-set-key (kbd (left-mod "<down>")) 'paredit-forward-down)
  )

(defun format-data (&optional arg)
  "Format typical clj/edn data. Newline after comma, newline between } and {,
  and then indent."
  (interactive "p")
  (kmacro-exec-ring-item (quote ([59 115 47 125 32 123 47 125 92 110 123 47 103 return 103 118 59 115 47 44 32 47 44 92 110 47 103 return 103 118 32 105 114] 0 "%d"))
                          arg))

(with-eval-after-load 'clojure-mode

  (add-hook 'cider-repl-mode-hook
            '(lambda ()
               (evil-define-key '(normal insert) cider-repl-mode-map
                 (kbd (right-mod "k")) 'cider-repl-clear-buffer)
               (define-key cider-repl-mode-map (kbd "<up>") 'cider-repl-previous-input)
               (define-key cider-repl-mode-map (kbd "<down>") 'cider-repl-next-input)))

  (with-eval-after-load 'cider-repl-mode-map
    (evil-define-key 'normal cider-repl-mode-map
      (kbd "<up>") 'cider-repl-previous-input)

    (evil-define-key 'normal cider-repl-mode-map
      (kbd "<down>") 'cider-repl-next-input)

    (evil-define-key 'normal cider-repl-mode-map
      (kbd (left-mod "n")) 'cider-repl-next-input)

    (evil-define-key '(normal insert) 'cider-repl-mode-map
      (kbd  "C-n") 'cider-repl-set-ns))

  (evil-leader/set-key "m s X" 'sesman-restart) ;; huh?
  (evil-leader/set-key "m s h" 'cider-repl-history)

  (define-key evil-normal-state-map (kbd ", s i") 'cider-jack-in-clj)
  (define-key evil-normal-state-map (kbd ", ,") 'cider-jack-in-clj)

  ;; Experiment w/ Sayid
  ;; (sayid-setup-package)

  ;; Define an "eval" vim-type operator -- use to evaluate an
  ;; arbitrary text selection or (if text not selected) movement key
  (evil-define-operator generic-evil-eval-operator (beg end)
    (cider-eval-region beg end))
  (define-key evil-normal-state-map (kbd "Q") 'generic-evil-eval-operator)

  ;; Use lispy definition of words
  ;; from https://timothypratley.blogspot.com/2014/08/clojure-friendly-word-definitions-in.html
  (dolist (c (string-to-list ":_-?!#*"))
    (modify-syntax-entry c "w" clojure-mode-syntax-table ))
  ;; Above is now replaced by:
  ;; (add-hook 'cider-repl-mode-hook #'subword-mode)
  ;; ^ but that stopped working after OS reinstall, and doesn't seem like it
  ;;   should have worked in the first place, because subword-mode is about
  ;;   CamelCase. https://wikemacs.org/wiki/Subword-mode

  ;; Use @ag's clj-find-var
  (define-key evil-normal-state-map (kbd "g c") 'clj-find-var)
  (define-key evil-normal-state-map (kbd "g d") 'clj-find-var)

  ;; Append `;; XXX' to line
  (defun comment-xxx (&optional arg)
    "Append ; XXX"
    (interactive "p")
    (kmacro-exec-ring-item (quote ([65 32 59 59 32 88 88 88 escape] 0 "%d")) arg))
  (define-key evil-normal-state-map (kbd "SPC c x") 'comment-xxx)

  ;; Append `;; TODO` to line
  (defun comment-todo (&optional arg)
    "Append ; TODO"
    (interactive "p")
    (kmacro-exec-ring-item (quote ([109 122 65 32 59 59 32 84 79 68 79 escape 39 122] 0 "%d")) arg))
  (define-key evil-normal-state-map (kbd "SPC c o") 'comment-todo)

  (evil-define-key '(normal insert) 'clojure-mode-map
    (kbd  "C-n") 'cider-repl-set-ns
    ;; C-tab to do #_ comment
    (kbd (right-mod "<tab>")) 'clojure-toggle-reader-comment-sexp
    (kbd  "s-t") 'projectile-toggle-between-implementation-and-test
    (kbd (left-mod "n")) 'copy-current-ns
    )

  (evil-define-key '(normal) 'clojure-mode-map
    (kbd (right-mod "k")) nil ; kill-sentence -- bad if I think I'm in repl
    (kbd "SPC m t s") 'cider-test-run-test
    (kbd "SPC b x") 'jump-to-cider-error
    (kbd ", c s") 'cider-scratch
    (kbd ", t s") 'cider-test-run-test
    (kbd "SPC m t n") 'cider-test-run-ns-tests
    (kbd ", t n") 'cider-test-run-ns-tests
    (kbd "SPC h c") 'clojure-cheatsheet
    (kbd ", e x") 'cider-eval-last-sexp-to-repl
    (kbd ", e c") 'cider-pprint-eval-last-sexp-to-comment
    (kbd ", s w") 'cider-repl-set-ns
    (kbd ", s s") 'cider-switch-to-repl-buffer
    (kbd "SPC s ,") 'format-data
    (kbd "SPC i r") 'indent-region
    (kbd (right-mod ",")) 'clojure-toggle-keyword-string ; toggle (ie cycle) between str and kwd
    (kbd (right-mod "t")) 'transpose-chars
    (kbd (left-mod "t")) "ct-" ; change-to-hyphen
    (kbd (left-mod "-")) 'jump-past-hyphen
    (kbd (left-mod "_")) 'jump-past-hyphen-back
    (kbd (left-mod "n")) 'copy-current-ns
    (kbd (right-mod "n")) 'copy-current-qualified-symbol-name
    (kbd (left-mod "f")) 'cider-format-region-or-buffer
    )
  )

(with-eval-after-load 'org
  (evil-define-key '(normal insert) 'org-mode-map
    (kbd "C-<up>") 'outline-up-heading)
  (evil-define-key '(normal insert) 'org-mode-map
    (kbd "M-<up>") 'outline-backward-same-level)
  (evil-define-key '(normal insert) 'org-mode-map
    (kbd "M-<down>") 'outline-forward-same-level)
  (evil-define-key '(normal insert) 'org-mode-map
    (kbd "<backtab>") 'org-global-cycle)
  (evil-define-key '(normal insert) 'org-mode-map
    (kbd "M-<return>") 'org-insert-heading)
  (evil-define-key '(normal insert) 'org-mode-map
    (kbd "C-<return>") 'org-insert-heading)

  )
