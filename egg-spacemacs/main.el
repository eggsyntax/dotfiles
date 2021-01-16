(message "Loading egg config")
(load-file "~/dotfiles/egg-spacemacs/functions.el")
(load-file "~/dotfiles/egg-spacemacs/var-settings.el")
(load-file "~/dotfiles/egg-spacemacs/bindings.el") ; after functions
(load-file "~/dotfiles/egg-spacemacs/hooks.el") ; after functions


;;;; Additional bits I had to add directly in spacemacs' init.el (or .spacemacs):

;;; first, in dotspacemacs/user-init:
;;    (load "~/dotfiles/egg-spacemacs/egg-init.el")
;;; and in dotspacemacs/user-config:
;;    (load "~/dotfiles/egg-spacemacs/main.el")

;;; in dotspacemacs/init, some edits to vars that already exist there in setq-default:
;; dotspacemacs-startup-lists '((recents . 7)
;;                              (projects . 7))
;; dotspacemacs-scratch-buffer-persistent t

;;; in dotspacemacs/layers:
;; dotspacemacs-configuration-layers
;;    '(
;;      ;; ----------------------------------------------------------------
;;      ;; Example of useful layers you may want to use right away.
;;      ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
;;      ;; `M-m f e R' (Emacs style) to install them.
;;      ;; ----------------------------------------------------------------
;;      (auto-completion :variables
;;                       auto-completion-complete-with-key-sequence-delay 2.0
;;                       ;; Trying these 3 based on a suggestion from @jr0cket in #spacemacs
;;                       auto-completion-enable-help-tooltip t
;;                       auto-completion-enable-snippets-in-popup t
;;                       auto-completion-enable-sort-by-usage t)
;;      emacs-lisp
;;      git
;;      (helm :variables
;;            helm-use-frame-when-more-than-two-windows nil)
;;      ;; lsp
;;      markdown
;;      multiple-cursors ; keybindings: https://github.com/syl20bnr/spacemacs/blob/develop/layers/+misc/multiple-cursors/README.org#evil-mc
;;      org
;;      ;; (shell :variables
;;      ;;        shell-default-height 30
;;      ;;        shell-default-position 'bottom)
;;      spell-checking
;;      syntax-checking
;;      version-control
;;      treemacs

;;      ;; Egg layers

;;      (clojure :variables
;;               clojure-enable-clj-refactor t
;;               ;; clojure-enable-sayid t
;;               clojure-enable-linters 'clj-kondo
;;               ;; Supposedly if I want I can use both of these together:
;;               ;; clojure-enable-linters '(clj-kondo joker)
;;               )
;;      csv

;;      )

;;; also in dotspacemacs/layers:
;; dotspacemacs-additional-packages
;; '(; undo-tree
;;   ;; slime-docker
;;   ;; (cider :min-version "0.20")

;;   ;; Themes:
;;   solarized-theme
;;   alect-themes
;;   ample-theme
;;   zenburn-theme
;;   organic-green-theme
;;   ;; flatland-theme
;;   ;; dracula-theme
;;   flatui-theme
;;   kaolin-themes
;; )
