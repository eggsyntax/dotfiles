;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun right-mod (keychar)
  "Return the appropriate modkey + keychar reference (ie for (right-mod \"*\",
'M-*' on mac, 'C-*' on linux [because I swap alt & ctrl on linux])"
  (interactive)
  (if (string-equal system-type "darwin")
      (concat "M-" keychar)
    (concat "C-" keychar)))

(defun left-mod (keychar)
  "Return the appropriate modkey + keychar reference (ie for (right-mod \"*\",
'M-*' on mac, 'C-*' on linux [because I swap alt & ctrl on linux])"
  (interactive)
  (if (string-equal system-type "darwin")
      (concat "A-" keychar)
    (concat "M-" keychar)))

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     html
     markdown
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     clojure
     ;; themes-megapack
     ;; parinfer
     (auto-completion :variables
                      auto-completion-complete-with-key-sequence-delay 0.4
                      ;; Trying these 3 based on a suggestion from @jr0cket in #spacemacs
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)
     ;; better-defaults
     emacs-lisp
     git
     ;; markdown
     ;; org
     ;; TODO newest .spacemacs-template has an explicit neotree layer -- do I need it?
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(flatui-theme apropospriate-theme alect-themes ample-theme dracula-theme zenburn-theme flatland-theme)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         solarized-light
                         apropospriate-light
                         ;; leuven
                         alect-light-alt
                         ample-light
                         spacemacs-light
                         spacemacs-dark
                         solarized-dark
                         flatui
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 13
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   ;; dotspacemacs-default-font '("Hack"
   ;;                             :size 10
   ;;                             :weight normal
   ;;                             :width condensed)
   ;; Hack is nicer, but Fira Mono is supposedly faster
   dotspacemacs-default-font (if (string-equal system-type "darwin")
       '("Fira Mono"
         :size 10
         :weight normal
         :width normal)
     '("Hack"
       :size 23
       :weight normal
       :width condensed))

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-command-key ";" ; No longer used in newest?
   dotspacemacs-ex-command-key ";"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

;; clj-find-var courtesy of @ag on Clojurians
(defun clj-find-var ()
  "Attempts to jump-to-definition of the symbol-at-point. If CIDER fails, or not available, falls back to dumb-jump"
  (interactive)
  (let ((var (cider-symbol-at-point)))
    (if (and (cider-connected-p) (cider-var-info var))
        (unless (eq 'symbol (type-of (cider-find-var nil var)))
          (dumb-jump-go))
      (dumb-jump-go))))

(with-eval-after-load 'clojure-mode
  (add-hook 'clojure-mode-hook #'spacemacs//init-jump-handlers-clojure-mode)
  (add-hook 'clojurescript-mode-hook #'spacemacs//init-jump-handlers-clojurescript-mode)
  (add-hook 'clojurec-mode-hook #'spacemacs//init-jump-handlers-clojurec-mode)
  (add-hook 'cider-repl-mode-hook #'spacemacs//init-jump-handlers-cider-repl-mode)

  (dolist (x '(spacemacs-jump-handlers-clojure-mode
               spacemacs-jump-handlers-clojurec-mode
               spacemacs-jump-handlers-clojurescript-mode
               spacemacs-jump-handlers-clojurex-mode
               spacemacs-jump-handlers-cider-repl-mode))
    (set x '(clj-find-var))))

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
  (define-key evil-insert-state-map (kbd (right-mod "l")) 'evil-forward-char)
  (define-key evil-insert-state-map (kbd (right-mod "h")) 'evil-backward-char)
  (define-key evil-insert-state-map (kbd (right-mod "j")) 'evil-next-line)
  (define-key evil-insert-state-map (kbd (right-mod "k")) 'evil-previous-line)

  ;; Have to redefine the few fn-modified-keys I use, since we've
  ;; coopted fn as hyper
  (global-set-key (kbd "H-<down>") 'evil-scroll-page-down)
  (global-set-key (kbd "H-<up>") 'evil-scroll-page-up)

  ;; Shift up/down arrows should scroll buffer up/down a line
  (define-key evil-normal-state-map (kbd "S-<up>") 'evil-scroll-line-up)
  (define-key evil-normal-state-map (kbd "S-<down>") 'evil-scroll-line-down)

  (evil-define-key '(normal insert) cider-repl-mode-map
    (kbd (right-mod "k")) 'cider-repl-clear-buffer)

  (evil-define-key 'normal cider-repl-mode-map
    (kbd "<up>") 'cider-repl-previous-input)

  (evil-define-key 'normal cider-repl-mode-map
    (kbd "<down>") 'cider-repl-next-input)
  (evil-define-key 'normal cider-repl-mode-map
    (kbd (left-mod "n")) 'cider-repl-next-input)

  (define-key evil-insert-state-map (kbd "<tab>") 'evil-complete-next)
  (define-key evil-insert-state-map (kbd "S-<tab>") 'evil-complete-previous)

  (global-set-key (kbd (right-mod ".")) 'completion-at-point)
  (global-set-key (kbd (right-mod "c")) 'evil-yank)
  ;; Put paste on both mod keys, because C-v can't be used in linux
  (global-set-key (kbd (right-mod "v")) 'maclike-paste)
  (global-set-key (kbd (left-mod "v")) 'maclike-paste)
  (global-set-key (kbd (left-mod "<backspace>")) 'backward-kill-word)
  (global-set-key (kbd (left-mod "<left>")) 'evil-backward-WORD-begin)
  (global-set-key (kbd (left-mod "<right>")) 'evil-forward-WORD-begin)
  (global-set-key (kbd (right-mod "q")) 'save-buffers-kill-emacs)
  (global-set-key (kbd (right-mod "a")) 'mark-whole-buffer)
  (global-set-key (kbd (right-mod "s")) 'save-buffer)
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
  (global-set-key (kbd (right-mod "z")) 'undo-tree-undo)
  (global-set-key (kbd (right-mod "Z")) 'undo-tree-redo)

  (define-key evil-normal-state-map (kbd ":") 'spacemacs/evil-search-clear-highlight)
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

  ;; ctrl-g is redundant with <esc> by default -- use it to trigger git
  (global-set-key (kbd (left-mod "g")) 'magit-status)

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

  (defun save-and-send-to-switch-to-repl ()
    (interactive)
    (save-buffer)
    (cider-load-buffer-and-switch-to-repl-buffer))

  (defun cider-format-region-or-buffer (start end)
    (interactive "r")
    (if mark-active
        (cider-format-region start end)
      (cider-format-defun)))

  (with-eval-after-load 'lisp-mode ; anything with sexps
    ;; Use cap L and H to move forward/back by sexp
    (define-key evil-normal-state-map (kbd "L") 'sp-next-sexp)
    (define-key evil-normal-state-map (kbd "H") 'sp-beginning-of-previous-sexp)
    (define-key evil-normal-state-map (kbd (left-mod "b")) 'save-and-send-to-switch-to-repl)
    (define-key evil-normal-state-map (kbd "¢")   'sp-copy-sexp) ; A-c gets corrupted somehow
    (define-key evil-normal-state-map (kbd (left-mod "c")) 'sp-copy-sexp) ; yank sexp
    (define-key evil-normal-state-map (kbd (left-mod "d")) 'sp-kill-sexp) ; kill sexp
    (define-key evil-normal-state-map (kbd (left-mod "m")) 'delete-sexp) ; murder sexp (don't put on kill ring)
    (define-key evil-normal-state-map (kbd (left-mod "r")) 'evil-lisp-state-sp-raise-sexp) ; raise sexp
    (define-key evil-normal-state-map (kbd (left-mod "w")) 'evil-lisp-state-wrap) ; wrap in sexp
    )

  (with-eval-after-load 'clojure-mode
    (define-key evil-normal-state-map (kbd (right-mod "k")) nil) ; kill-sentence -- bad if I think I'm in repl
    (define-key evil-normal-state-map (kbd "SPC m t s") 'cider-test-run-test)
    (define-key evil-normal-state-map (kbd "SPC b x") 'jump-to-cider-error)
    (define-key evil-normal-state-map (kbd ", t s") 'cider-test-run-test)
    ;; 'ns-tests'
    (define-key evil-normal-state-map (kbd "SPC m t n") 'cider-test-run-ns-tests)
    (define-key evil-normal-state-map (kbd ", t n") 'cider-test-run-ns-tests)
    (define-key evil-normal-state-map (kbd "SPC h c") 'clojure-cheatsheet)
    ;; TODO what I want is the next one, but I have to figure out how to get it
    ;; to load in the current buffer, not some arbitrary one.
    ;; (define-key evil-normal-state-map (kbd "SPC b c") 'cider-switch-to-repl-buffer)
    (define-key evil-normal-state-map (kbd "SPC b c") 'jump-to-clj-repl)
    (define-key evil-normal-state-map (kbd "SPC b C") 'jump-to-cljs-repl)
    (define-key evil-normal-state-map (kbd "SPC b S") 'jump-to-nrepl-server)
    (define-key evil-normal-state-map (kbd "SPC b E") 'jump-to-personal-file)
    (define-key evil-normal-state-map (kbd (left-mod "a")) "ya(") ; yank-around-parens (only in normal)
    (define-key evil-normal-state-map (kbd (left-mod "a")) "da(") ; delete-around-parens (only in normal)
    (define-key evil-normal-state-map (kbd (left-mod "t")) "ct-") ; change-to-hyphen
    (define-key evil-normal-state-map (kbd (left-mod "-")) 'jump-past-hyphen)
    (define-key evil-normal-state-map (kbd (left-mod "_")) 'jump-past-hyphen-back)
    (define-key evil-normal-state-map (kbd (left-mod "n")) 'copy-current-ns)
    (define-key evil-insert-state-map (kbd (left-mod "n")) 'copy-current-ns)
    (define-key evil-normal-state-map (kbd (left-mod "f")) 'cider-format-region-or-buffer)

    ;; Experiment w/ Sayid
    ;; (sayid-setup-package)

    ;; Define an "eval" operator
    (evil-define-operator generic-evil-eval-operator (beg end)
      (cider-eval-region beg end))
    (define-key evil-normal-state-map (kbd (left-mod "e")) 'generic-evil-eval-operator)

    ;; Use lispy definition of words
    ;; from https://timothypratley.blogspot.com/2014/08/clojure-friendly-word-definitions-in.html
    (dolist (c (string-to-list ":_-?!#*"))
      (modify-syntax-entry c "w" clojure-mode-syntax-table ))

    ;; Use @ag's clj-find-var
    (define-key evil-normal-state-map (kbd "g c") 'clj-find-var)
    (define-key evil-normal-state-map (kbd "g d") 'clj-find-var)

    )

  ;;;;;;;;; clojure function-key bindings (hyper) ;;;;;;

  ;; TODO commented out 09/14/2017, because it's denying that clj-bind exists.
  ;; Missing layer?
  ;;  (with-eval-after-load 'clojure-mode
  ;;
  ;;    (defun xpand (name)
  ;;      (yas-expand-snippet (yas-lookup-snippet name)))
  ;;
  ;;    ;; Convention: lower-case inserts; upper-case equivalent refactors
  ;;    (clj-bind (kbd "H-d")   (lambda () (interactive) (xpand "defn")))
  ;;    (clj-bind (kbd "H-D")   (lambda () (interactive) 'cljr-extract-function))
  ;;    (clj-bind (kbd "H-l")   (lambda () (interactive) (xpand "let")))
  ;;    (clj-bind (kbd "H-L")   (lambda () (interactive) 'cljr-introduce-let))
  ;;    (clj-bind (kbd "H-p")   (lambda () (interactive) (xpand "print")))
  ;;    (clj-bind (kbd "H-j")   (lambda () (interactive) (xpand "console-log")))
  ;;    (clj-bind (kbd "H-c")   (lambda () (interactive) 'comment-or-uncomment-region))
  ;;    ;; (clj-bind (kbd "H-f")   (lambda () (interactive) (xpand "fn")))
  ;;    ;; This one could be better -- really after evil-append-line
  ;;    ;; I just want to write the text that should be appended...
  ;;    (clj-bind (kbd "H-t") (lambda () (interactive)
  ;;                            (evil-append-line 1)
  ;;                            (insert " ;; TODO ")))
  ;;    )

  ;;;;; end clojure function-key bindings (hyper) ;;;;;;

  ;;;;;;;;   End key bindings ;;;;;;;
  )

(defun attempt-speedup-settings ()
    (setq-default

       ;; TODO YOUAREHERE trying some stuff to improve performance:
       visual-line-mode nil
       smooth-scrolling nil
       linum-mode nil
       projectile-mode nil ; check: does this persist?

       ;; As suggested at https://github.com/bbatsov/projectile/issues/600#issuecomment-69319512
       helm-projectile-fuzzy-match nil
    )
)

;; TODO attempting to trace the inner workings of aggressive-indent--proccess-changed-list-and-indent
;; in order to help address aggressive-indent problem on save. See
;; https://github.com/Malabarba/aggressive-indent-mode/issues/105#issuecomment-335991712
(defun agg-debug ()
  (interactive)
  (toggle-debug-on-error)
  (trace-function 'aggressive-indent--proccess-changed-list-and-indent))

;; TODO create key binding to toggle boolean
;; Jump target MAIN
(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'helm-bookmark)

  ;; TODO temp, see above
  ;; (agg-debug)

  ;; Defining inside user-config so that evil is already loaded
  (evil-define-command maclike-paste (count &optional register)
    (interactive "P<x>")
    (evil-paste-before count register)
    (forward-char))

  ;; Set all my key bindings:
  (set-egg-key-bindings)

  ;; auto-revert buffers when they're changed on filesystem
  ;; only works sometimes, unfortunately :/
  (global-auto-revert-mode 1)

  (add-hook 'prog-mode-hook 'spacemacs/toggle-fill-column-indicator-on)

  (setq-default

   ;; Cmd-1..9 should refer to #s in the current frame, NOT globally
   winum-scope 'frame-local

   ;; ;; pretty-print always in repl
   cider-repl-use-pretty-printing t

   )

  ;;  (defcustom nrepl-sync-request-timeout 120
  ;;    "The number of seconds to wait for a sync response.
  ;;Setting this to nil disables the timeout functionality."
  ;;    :type 'integer
  ;;    :group 'nrepl)

  ;; Shell customization:
  ;;  (setq comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
  ;;  (setq comint-scroll-to-bottom-on-output t) ; always add output at the bottom
  ;;  (setq comint-scroll-show-maximum-output t) ; scroll to show max possible output
  ;;  (setq comint-completion-autolist t)        ; show completion list when ambiguous
  ;;  (setq comint-input-ignoredups t)           ; no duplicates in command history
  ;;  (setq comint-completion-addsuffix t)       ; insert space/slash after file completion

  ;;  ;; interpret and use ansi color codes in shell output windows
  ;;  (ansi-color-for-comint-mode-on)

  ;; CIDER:
  (setq cider-repl-history-size 5000) ; the default is 500
  (setq cider-repl-history-file "~/tmp/.cider-history")

  (desktop-save-mode 0)
  ;; (desktop-save-mode 1)
  ;; (desktop-read)

  ;; Use narrow modeline
  (setq powerline-narrow t)
  (setq powerline-nano-theme t)

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
  (global-aggressive-indent-mode -1)
  ;; (global-aggressive-indent-mode 1)
  ;; (aggressive-indent-mode 1)
  ;; (aggressive-indent-mode nil)
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
  ;; Or the major mode because I just don't have room
  (setq mode-name nil)
  (setq mode-line-modes nil)


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
  (setq modeline-scale 0.5)

  ;; time in modeline
  (setq display-time-mode 1)

  ;; TODO doesn't work
  ;; (defvar my-keys-minor-mode-map
  ;;   (let ((map (make-sparse-keymap)))
  ;;     (define-key map (kbd (right-mod "s")) 'save-buffer)
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
  ;;     (kbd (right-mod "s")) 'save-buffer-always)
  ;;   (evil-define-key '(normal insert) 'clojure-mode-map
  ;;     (kbd  "}") 'evil-forward-paragraph)
  ;;   (evil-define-key '(normal insert) 'clojure-mode-map
  ;;     (kbd  "{") 'evil-backward-paragraph)
  ;;   )

  ;; (setq parinfer-extensions '(defaults
  ;;                              pretty-parens
  ;;                              smart-yank
  ;;                              smart-tab
  ;;                              evil))

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

  ;; Maybe prevent bug https://github.com/syl20bnr/spacemacs/issues/9563
  ;; (require 'tramp)

  ;; t: auto-save; prompt: ask every time; nil: don't save
  (setq cider-save-file-on-load nil)

  (setq-default vc-follow-symlinks t)

  (setq-default undo-tree-auto-save-history t)
  (setq-default undo-tree-history-directory-alist '(("." . "~/tmp/.undo-tree/")))

  ;; Ensure any of my own libs are loaded first:
  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (load-file "~/.emacs.d/lisp/clj-refactor.el")

  ;; No need, typically, to save history of *messages* buffer or minibuffer,
  ;; and it has a perf cost (per @ag):
  (savehist-mode -1)

  ;; Where org-agenda files live
  (setq org-agenda-files '("~/Dropbox/OrgNotes/org-agenda.org" "/home/egg/Dropbox/OrgNotes/"))

  ;; Always use soft wrap by default
  (setq-default visual-line-mode t)

  ;; org-mode: t = toggle todo state -- have to set at very end
  ;; (define-key org-bullets-bullet-map (kbd "t") 'org-todo)
  ;; TODO grargh this isn't working, I think I have the wrong map, maybe? Grr
  ;; This next one works, *sometimes*. But defines the key in insert mode also,
  ;;    so you can't type a letter `t` in an org-mode buffer.
  ;; (define-key org-mode-map (kbd "t") 'org-todo)
  (evil-define-key normal 'org-mode-map
      (kbd  "t") 'org-todo)

  )

;; ;; Do not write anything past this comment. This is where Emacs will
;; ;; auto-generate custom variable definitions.
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(evil-want-Y-yank-to-eol nil)
;;  '(package-selected-packages
;;    (quote
;;     (web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data silkworm-theme zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme smeargle orgit mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor powerline parent-mode projectile flx smartparens iedit anzu evil goto-chg undo-tree f dash diminish hydra s highlight seq spinner pkg-info epl bind-map bind-key packed helm avy helm-core async popup helm-company helm-c-yasnippet fuzzy company-statistics company-quickhelp pos-tip company clojure-snippets auto-yasnippet ac-ispell auto-complete clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider queue clojure-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile adaptive-wrap ace-window ace-link ace-jump-helm-line)))
;;  '(safe-local-variable-values
;;    (quote
;;     ((cider-cljs-lein-repl . "(do (require 'figwheel-sidecar.repl-api)
;;             (figwheel-sidecar.repl-api/start-figwheel! \"login\" \"imageviewer\" \"harmonium\")
;;             (figwheel-sidecar.repl-api/cljs-repl))")))))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((cider-cljs-lein-repl . "(do (require 'figwheel-sidecar.repl-api)
            (figwheel-sidecar.repl-api/start-figwheel! \"login\" \"imageviewer\" \"harmonium\")
            (figwheel-sidecar.repl-api/cljs-repl))")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
