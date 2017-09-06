;; -*- mode: emacs-lisp -*-


;; TODO currently troubleshooting, looking for slowdown causes.
;; Stuff I comment out in that process will be marked with
;; SLOW?

;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;;---------Functions collected from the internet by egg---------
(defun lunaryorn-new-buffer-frame ()
  "Create a new frame with a new empty buffer."
  (interactive)
  (let ((buffer (generate-new-buffer "untitled")))
    (set-buffer-major-mode buffer)
    (display-buffer buffer '(display-buffer-pop-up-frame . nil))))

;;--------------------------------------------------------------

;; TODO visual-line-mode? Consider
;; https://www.emacswiki.org/emacs/VisualLineMode
;; TODO having a terrible time setting fill-column in config, look into it further

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ansible
     yaml
     python
     javascript
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; osx
     ;; SLOW?
     (auto-completion :variables
                      auto-completion-complete-with-key-sequence-delay 0.4
                      ;; Trying these 3 based on a suggestion from @jr0cket in #spacemacs
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)
     ;; better-defaults
     emacs-lisp
     git
     markdown
     org
     ;; deft
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; syntax-checking

     ;; Notational Velocity-style notes in org mode
     ;; https://github.com/syl20bnr/spacemacs/tree/master/layers/deft
     version-control
     clojure
     ;; evil-cleverparens ; causes trouble, see notes below
     ;; haskell
     ;; fixmee
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   ;;dotspacemacs-additional-packages '(fixmee)

   dotspacemacs-additional-packages '(inf-clojure
                                      ;; string-inflection provides string-inflection-kebab-case-function & such
                                      ;; https://github.com/akicho8/string-inflection
                                      string-inflection
                                      ;; key-chord has been causing problems:
                                      ;; key-chord
                                      clojure-cheatsheet
                                      ;; Sayid
                                      ;; sayid
                                      ;; parinfer ; will become a layer in https://github.com/syl20bnr/spacemacs/pull/7339
                                      )

   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    ;; anaconda-mode ; see https://github.com/syl20bnr/spacemacs/issues/3772
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default

   ;; TODO YOUAREHERE trying some stuff to improve performance:
   visual-line-mode nil
   smooth-scrolling nil
   linum-mode nil
   projectile-mode nil ; check: does this persist?

   ;; As suggested at https://github.com/bbatsov/projectile/issues/600#issuecomment-69319512
   helm-projectile-fuzzy-match nil
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner nil
   ;; Speed up helm?
   dotspacemacs-which-key-delay 0.01
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light
                         solarized-dark
                         organic-green
                         alect-light-alt
                         ample-light
                         farmhouse-light
                         soft-morning
                         tsdh-light
                         spacemacs-light
                         spacemacs-dark
                         leuven
                         monokai
                         zonokai-red
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 12
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)

   ;; dotspacemacs-default-font '("Inconsolata"
   ;;                             :size 12
   ;;                             :weight normal
   ;;                             :width condensed)

   ;;    dotspacemacs-default-font '("Inconsolata LGC Short"
   ;;                                :size 10
   ;;                                :weight normal
   ;;                                :width condensed)

   ;; dotspacemacs-default-font '("Hack"
   ;;                             :size 10
   ;;                             :weight normal
   ;;                             :width condensed)

   dotspacemacs-default-font '("Fira Mono"
                               :size 10
                               :weight normal
                               :width normal)

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "A-SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ";"
   dotspacemacs-ex-command-key ";"
   ;; Some Egg stuff here:
   ;; Use vim-style regexes in evil-substitute (ie in ex mode):
   evil-ex-search-vim-style-regexp t
   ;; Evil-escape-key (get out of everything!)
   evil-escape-key-sequence "nh"

   ;; Give spacemacs github access
   paradox-github-token "048955a20148056d6abd975da30fa904a4d49458"
   recentf-max-saved-items 40
   recentf-max-menu-items 15

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   undo-tree-auto-save-history t
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.0
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil

   )
  )

(defun clj-bind (bound-key meaning)
  "Bind a normal+insert key for clojure-mode-map (which also includes all clojurescript files)"
  (interactive)
  ;; Use evil-define-key* (the fn version of the evil-define-key macro)
  ;; so it won't try to expand with unbound symbols
  (evil-define-key* '(normal insert) clojure-mode-map
                    bound-key meaning))

(defun save-buffer-always ()
  "Save the buffer even if it is not modified. Added by Egg,
  via http://stackoverflow.com/a/3217206/284564"
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

;; TARGET: bindings
(defun set-egg-key-bindings ()
  "All my personal keybindings and key chords"

  ;;;;;;;; Begin key bindings ;;;;;;;

  ;; Use command key as Meta, option as Alt, fn as Hyper
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (setq mac-function-modifier 'hyper)

  ;; Make ESC quit every damn thing:
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  ;; Make = and \ stand in for ^ and $ like I do in vim
  ;; (this makes sense only for dvorakians)
  (define-key evil-normal-state-map (kbd "=") 'back-to-indentation)
  (define-key evil-motion-state-map (kbd "=") 'back-to-indentation)
  (define-key evil-normal-state-map (kbd "\\") 'move-end-of-line)
  (define-key evil-motion-state-map (kbd "\\") 'move-end-of-line)

  ;; Let Cmd-movement keys work as movement keys in insert mode
  (define-key evil-insert-state-map (kbd "M-l") 'evil-forward-char)
  (define-key evil-insert-state-map (kbd "M-h") 'evil-backward-char)
  (define-key evil-insert-state-map (kbd "M-j") 'evil-next-line)
  (define-key evil-insert-state-map (kbd "M-k") 'evil-previous-line)

  ;; Have to redefine the few fn-modified-keys I use, since we've
  ;; coopted fn as hyper
  (global-set-key (kbd "H-<down>") 'evil-scroll-page-down)
  (global-set-key (kbd "H-<up>") 'evil-scroll-page-up)

  ;; Shift up/down arrows should scroll buffer up/down a line
  (define-key evil-normal-state-map (kbd "S-<up>") 'evil-scroll-line-up)
  (define-key evil-normal-state-map (kbd "S-<down>") 'evil-scroll-line-down)

  (evil-define-key '(normal insert) cider-repl-mode-map
    (kbd "M-k") 'cider-repl-clear-buffer)

  (evil-define-key 'normal cider-repl-mode-map
    (kbd "<up>") 'cider-repl-previous-input)

  (define-key evil-insert-state-map (kbd "<tab>") 'evil-complete-next)
  (define-key evil-insert-state-map (kbd "S-<tab>") 'evil-complete-previous)

  (evil-define-key 'normal cider-repl-mode-map
    (kbd "<down>") 'cider-repl-next-input)

  (global-set-key (kbd "M-.") 'completion-at-point)
  (global-set-key (kbd "M-c") 'evil-yank)
  (global-set-key (kbd "M-v") 'maclike-paste)
  (global-set-key (kbd "A-<backspace>") 'backward-kill-word)
  (global-set-key (kbd "A-<left>") 'evil-backward-WORD-begin)
  (global-set-key (kbd "A-<right>") 'evil-forward-WORD-begin)
  (global-set-key (kbd "M-q") 'save-buffers-kill-emacs)
  (global-set-key (kbd "M-a") 'mark-whole-buffer)
  (global-set-key (kbd "M-s") 'save-buffer-always)
  (global-set-key (kbd "M-n") 'lunaryorn-new-buffer-frame)
  (global-set-key (kbd "M-w") 'delete-frame)
  (global-set-key (kbd "M-`") 'ns-next-frame)
  (global-set-key (kbd "M-~") 'ns-prev-frame)

  ;; A few more borrowed from the osx layer
  ;; See http://spacemacs.org/layers/osx/README
  (global-set-key (kbd "M-=") 'spacemacs/scale-up-font)
  ;; This one's not working, dunno why:
  (global-set-key (kbd "M--") 'spacemacs/scale-down-font)
  (global-set-key (kbd "M-z") 'undo-tree-undo)
  (global-set-key (kbd "M-Z") 'undo-tree-redo)

  (define-key evil-normal-state-map (kbd ":")
    'evil-search-highlight-persist-remove-all)
  ;; U ("union") joins line to the PRECEDING line
  (define-key evil-normal-state-map (kbd "U") "kJ")
  ;; ;; bind E to end of _previous_ word
  ;; (define-key evil-normal-state-map (kbd "E") 'evil-backward-word-end)
  (define-key evil-normal-state-map (kbd "-") 'evilmi-jump-items)
  (define-key evil-visual-state-map (kbd "-") 'evil-jump-item)
  (define-key evil-normal-state-map (kbd "gb") 'evil-jumper/backward)
  (define-key evil-normal-state-map (kbd "ƒ") 'helm-find-files)
  (define-key evil-normal-state-map (kbd "SPC ;") 'helm-M-x)
  (define-key evil-normal-state-map (kbd "SPC '") 'dabbrev-completion)
  (define-key evil-normal-state-map (kbd "SPC .") 'shell)

  (define-key evil-normal-state-map (kbd "SPC x k") 'string-inflection-kebab-case)
  (define-key evil-normal-state-map (kbd "SPC x C") 'string-inflection-camelcase)
  (define-key evil-normal-state-map (kbd "SPC j g") 'dumb-jump-go)
  (define-key evil-normal-state-map (kbd "SPC r c") 'copy-to-register)
  (define-key evil-normal-state-map (kbd "SPC r p") 'evil-paste-from-register)
  (define-key evil-normal-state-map (kbd "SPC g c") 'vc-resolve-conflicts)
  (define-key evil-normal-state-map (kbd "SPC f m") 'toggle-frame-maximized)

  ;;;;;;;; Mode-specific key bindings ;;;;;;;

  (defun jump-to-clj-repl ()
    (interactive)
    (switch-to-buffer "*cider-repl harmonium*"))

  (defun jump-to-cljs-repl ()
    (interactive)
    (switch-to-buffer "*cider-repl CLJS harmonium*"))

  (defun jump-to-personal-file ()
    (interactive)
    (switch-to-buffer "egg.clj"))

  ;; Not currently bound:
  (defun jump-to-nrepl-server ()
    (interactive)
    (switch-to-buffer "*nrepl-server harmonium*"))

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

  (with-eval-after-load 'lisp-mode ; anything with sexps
    ;; Use cap L and H to move forward/back by sexp
    (define-key evil-normal-state-map (kbd "L") 'sp-next-sexp)
    (define-key evil-normal-state-map (kbd "H") 'sp-beginning-of-previous-sexp)
    (define-key evil-normal-state-map (kbd "A-c") 'sp-copy-sexp) ; yank sexp
    (define-key evil-normal-state-map (kbd "A-d") 'sp-kill-sexp) ; kill sexp
    (define-key evil-normal-state-map (kbd "A-m") 'delete-sexp) ; murder sexp (don't put on kill ring)
    (define-key evil-normal-state-map (kbd "A-r") 'evil-lisp-state-sp-raise-sexp) ; raise sexp
    (define-key evil-normal-state-map (kbd "A-w") 'evil-lisp-state-wrap) ; wrap in sexp
    )

  (with-eval-after-load 'clojure-mode
    (define-key evil-normal-state-map (kbd "M-k") nil) ; kill-sentence -- bad if I think I'm in repl
    (define-key evil-normal-state-map (kbd "SPC m t s") 'cider-test-run-test)
    (define-key evil-normal-state-map (kbd "SPC b x") 'jump-to-cider-error)
    (define-key evil-normal-state-map (kbd ", t s") 'cider-test-run-test)
    ;; 'ns-tests'
    (define-key evil-normal-state-map (kbd "SPC m t n") 'cider-test-run-ns-tests)
    (define-key evil-normal-state-map (kbd ", t n") 'cider-test-run-ns-tests)
    (define-key evil-normal-state-map (kbd "SPC h c") 'clojure-cheatsheet)
    (define-key evil-normal-state-map (kbd "SPC b c") 'jump-to-clj-repl)
    (define-key evil-normal-state-map (kbd "SPC b C") 'jump-to-cljs-repl)
    (define-key evil-normal-state-map (kbd "SPC b S") 'jump-to-nrepl-server)
    (define-key evil-normal-state-map (kbd "SPC b E") 'jump-to-personal-file)
    (define-key evil-normal-state-map (kbd "A-a") "ya(") ; yank-around-parens (only in normal)
    (define-key evil-normal-state-map (kbd "A-a") "da(") ; delete-around-parens (only in normal)
    (define-key evil-normal-state-map (kbd "A-t") "ct-") ; change-to-hyphen
    (define-key evil-normal-state-map (kbd "A--") 'jump-past-hyphen)
    (define-key evil-normal-state-map (kbd "A-_") 'jump-past-hyphen-back)
    (define-key evil-normal-state-map (kbd "A-n") 'copy-current-ns)

    ;; Experiment w/ Sayid
    ;; (sayid-setup-package)

    ;; Define an "eval" operator
    (evil-define-operator generic-evil-eval-operator (beg end)
      (cider-eval-region beg end))
    (define-key evil-normal-state-map (kbd "A-e") 'generic-evil-eval-operator)

    ;; Use lispy definition of words
    ;; from https://timothypratley.blogspot.com/2014/08/clojure-friendly-word-definitions-in.html
    (dolist (c (string-to-list ":_-?!#*"))
      (modify-syntax-entry c "w" lisp-mode-syntax-table ))
    )

  ;;;;;;;;; clojure function-key bindings (hyper) ;;;;;;

  (with-eval-after-load 'clojure-mode

    (defun xpand (name)
      (yas-expand-snippet (yas-lookup-snippet name)))

    ;; Convention: lower-case inserts; upper-case equivalent refactors
    (clj-bind (kbd "H-d")   (lambda () (interactive) (xpand "defn")))
    (clj-bind (kbd "H-D")   (lambda () (interactive) 'cljr-extract-function))
    (clj-bind (kbd "H-l")   (lambda () (interactive) (xpand "let")))
    (clj-bind (kbd "H-L")   (lambda () (interactive) 'cljr-introduce-let))
    (clj-bind (kbd "H-p")   (lambda () (interactive) (xpand "print")))
    (clj-bind (kbd "H-j")   (lambda () (interactive) (xpand "console-log")))
    (clj-bind (kbd "H-c")   (lambda () (interactive) 'comment-or-uncomment-region))
    ;; (clj-bind (kbd "H-f")   (lambda () (interactive) (xpand "fn")))
    ;; This one could be better -- really after evil-append-line
    ;; I just want to write the text that should be appended...
    (clj-bind (kbd "H-t") (lambda () (interactive)
                            (evil-append-line 1)
                            (insert " ;; TODO ")))
    )

  ;;;;; end clojure function-key bindings (hyper) ;;;;;;

  ;;;;;;;;   End key bindings ;;;;;;;
  )

;; target: MAIN
(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;; auto-revert buffers when they're changed on filesystem
  ;; only works sometimes, unfortunately :/
  (global-auto-revert-mode 1)

  ;; Defining inside user-config so that evil is already loaded
  (evil-define-command maclike-paste (count &optional register)
    (interactive "P<x>")
    (evil-paste-before count register)
    (forward-char))

  (add-hook 'prog-mode-hook 'spacemacs/toggle-fill-column-indicator-on)

  ;; Cmd-1..9 should refer to #s in the current frame, NOT globally
  (setq-default winum-scope 'frame-local)

  ;; ;; pretty-print always in repl
  (setq cider-repl-use-pretty-printing t)

  (defcustom nrepl-sync-request-timeout 120
    "The number of seconds to wait for a sync response.
Setting this to nil disables the timeout functionality."
    :type 'integer
    :group 'nrepl)

  ;; Shell customization:
  (setq comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
  (setq comint-scroll-to-bottom-on-output t) ; always add output at the bottom
  (setq comint-scroll-show-maximum-output t) ; scroll to show max possible output
  (setq comint-completion-autolist t)        ; show completion list when ambiguous
  (setq comint-input-ignoredups t)           ; no duplicates in command history
  (setq comint-completion-addsuffix t)       ; insert space/slash after file completion

  ;; interpret and use ansi color codes in shell output windows
  (ansi-color-for-comint-mode-on)

  ;; CIDER:
  (setq cider-repl-history-size 5000) ; the default is 500
  (setq cider-repl-history-file "~/tmp/.cider-history")
  ;; GRRR these seem to change nothing:
  (setq ac-delay 0.8)
  (setq ac-quick-help-delay 0.8)

  ;; CIDER figwheel stuff, see
  ;; https://github.com/bhauman/lein-figwheel/wiki/Using-the-Figwheel-REPL-within-NRepl

  ;; Temp fix until CIDER properly picks up .dir-locals.el. See:
  ;; https://github.com/clojure-emacs/cider/issues/1938
  (setq cider-cljs-lein-repl
        "(do (require 'figwheel-sidecar.repl-api)
              (figwheel-sidecar.repl-api/start-figwheel! \"login\" \"imageviewer\" \"harmonium\")
              (figwheel-sidecar.repl-api/cljs-repl))")

  (desktop-save-mode 0)
  ;; (desktop-save-mode 1)
  ;; (desktop-read)

  ;; Use narrow modeline
  (setq powerline-narrow t)
  ;; (setq powerline-nano-theme t)

  ;; Use greek letter for lambda (or fn in clj)
  (global-prettify-symbols-mode 1)
  (setq clojure-enable-fancify-symbols t)

  ;; Paste over highlighted regions
  (delete-selection-mode 1)

  ;; Try to stop projectile-helm (spc-p-h) from hanging in non-git dirs
  ;; (which for me is all non-project dirs because homedir is git)
  ;; See https://github.com/bbatsov/projectile/issues/600
  (setq gc-cons-threshold 100000000)

  ;; remove trailing whitespace when saving
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; Tabs are 4 spaces
  (setq tab-width 4) ; or any other preferred value

  ;; Use aggressive indent
  ;; https://github.com/Malabarba/aggressive-indent-mode
  (global-aggressive-indent-mode 1)
  ;; Supposed alternate to only use in lisp modes (although I've had trouble with it)
  ;; (add-hook 'lisp-mode-hook #'aggressive-indent-mode)

  ;; Basic org mode commands:
  (evil-leader/set-key "o s" 'org-store-link)
  (evil-leader/set-key "o a" 'org-agenda)
  (evil-leader/set-key "o c" 'org-capture)
  (evil-leader/set-key "o b" 'org-iswitchb)

  (evil-leader/set-key "m s X" 'cider-restart)

  (setq cider-repl-display-help-banner nil)
  ;; Don't show cider info on the modeline
  (setq cider-mode-line nil)
  ;; Or version control...
  ;; See https://github.com/TheBB/spaceline#turning-segments-on-and-off
  (setq spaceline-version-control-p nil)
  ;; Or the fact that we're using unix newlines
  (setq buffer-encoding-abbrev-p nil)
  ;; Or the size of the friggin file
  (setq buffer-sizep nil)


  ;; Don't show hidden files by default in neotree
  (setq neotree-hidden-file-toggle nil)

  ;; Don't show minor mode logos on the mode-line
  (setq spaceline-minor-modes-p nil)

  ;; Set all my key bindings:
  (set-egg-key-bindings)

  ;; Turn unicode symbols off in modeline. Provides speed boost. Via
  ;; https://github.com/syl20bnr/spacemacs/issues/1114
  (setq dotspacemacs-mode-line-unicode-symbols nil)

  ;; Speed boost, ibid link
  (setq modeline-scale 1.0)

  ;; time in modeline
  (setq display-time-mode 1)

  ;; TODO doesn't work
  ;; (defvar my-keys-minor-mode-map
  ;;   (let ((map (make-sparse-keymap)))
  ;;     (define-key map (kbd "M-s") 'save-buffer-always)
  ;;     (define-key map (kbd "}") 'evil-forward-paragraph)
  ;;     (define-key map (kbd "{") 'evil-backward-paragraph)
  ;;     map)
  ;;   "my-keys-minor-mode keymap.")

  ;; (define-minor-mode my-keys-minor-mode
  ;;   "A minor mode so that my key settings override annoying major modes."
  ;;   :init-value t
  ;;   :lighter " my-keys")

  ;; (my-keys-minor-mode 1)

  ;; TODO doesn't work
  ;; (with-eval-after-load 'clojure-mode
  ;;   (evil-define-key '(normal insert) 'clojure-mode-map
  ;;     (kbd "M-s") 'save-buffer-always)
  ;;   (evil-define-key '(normal insert) 'clojure-mode-map
  ;;     (kbd  "}") 'evil-forward-paragraph)
  ;;   (evil-define-key '(normal insert) 'clojure-mode-map
  ;;     (kbd  "{") 'evil-backward-paragraph)
  ;;   )

  ;; (use-package parinfer
  ;;   :ensure t
  ;;   :bind
  ;;   (("C-," . parinfer-toggle-mode))
  ;;   :init
  ;;   (progn
  ;;     (setq parinfer-extensions
  ;;           '(defaults       ; should be included.
  ;;              pretty-parens  ; different paren styles for different modes.
  ;;              evil           ; If you use Evil.
  ;;              ;; lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
  ;;              ;; paredit        ; Introduce some paredit commands. TODO will probably want to uncomment soon
  ;;              smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
  ;;              smart-yank))   ; Yank behavior depend on mode.
  ;;     (add-hook 'clojure-mode-hook #'parinfer-mode)
  ;;     (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
  ;;     (add-hook 'common-lisp-mode-hook #'parinfer-mode)
  ;;     (add-hook 'scheme-mode-hook #'parinfer-mode)
  ;;     (add-hook 'lisp-mode-hook #'parinfer-mode)))

  ;; TODO an experiment
  (setq nrepl-log-messages t)

  ;; Needed for org-mobile-push, which is needed for MobileOrg on Android
  (setq org-directory "~/Dropbox/OrgNotes")
  ;; Set to the name of the file where new notes will be stored
  (setq org-mobile-inbox-for-pull "~/Dropbox/OrgNotes/flagged.org")
  ;; Set to <your Dropbox root directory>/MobileOrg.
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

  ;; (setq helm-boring-file-regexp-list )
  ;; (setq helm-ff-skip-boring-files true)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#eee8d5" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (paradox clojure-cheatsheet clj-refactor inflections edn paredit peg cider seq spinner queue adaptive-wrap yapfify yaml-mode ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit string-inflection spaceline solarized-theme smeargle slim-mode scss-mode sass-mode restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc jinja2-mode info+ inf-clojure indent-guide hydra hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu emmet-mode elisp-slime-nav dumb-jump diff-hl define-word cython-mode company-web company-tern company-statistics company-quickhelp company-ansible company-anaconda column-enforce-mode coffee-mode clojure-snippets clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-compile ansible-doc ansible aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(projectile-globally-ignored-file-suffixes (quote ("haml" "*.haml")))
 '(safe-local-variable-values
   (quote
    ((cider-cljs-lein-repl . "(do (require 'figwheel-sidecar.repl-api)
            (figwheel-sidecar.repl-api/start-figwheel! \"login\" \"imageviewer\" \"harmonium\")
            (figwheel-sidecar.repl-api/cljs-repl))"))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
