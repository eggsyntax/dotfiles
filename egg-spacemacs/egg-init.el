;; Loaded before the config in main.el
;; (directly from init.el's dotspacemacs/user-init)

;; NOTE! Still in spacemacs' init.el (of necessity AFAIK)
;; dotspacemacs/layers
;; dotspacemacs-additional-packages

(message "Loading egg-init.el")

;;;; Pinned packages

(add-to-list 'configuration-layer-elpa-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-pinned-packages '(cider          . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(cider-nrepl    . "melpa-stable") t)
;; (add-to-list 'package-pinned-packages '(clj-refactor   . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(clojure        . "melpa-stable") t)

;;;; Var settings

(setq-default

 dotspacemacs-themes '(solarized-light
                       spacemacs-dark
                       spacemacs-light
                       apropospriate-light
                       zenburn
                       ;; leuven
                       alect-light-alt
                       ample-light
                       solarized-dark
                       flatui
                       )

 dotspacemacs-default-font (if (string-equal system-type "darwin")
                               '("Hack"
                                 :size 13
                                 :weight normal
                                 :width normal)
                             '("Hack"
                               :size 26
                               :weight normal
                               :width condensed))

 ;; Not sure why this has to be set at init stage but it does.
 org-hide-leading-stars 't


 )

;;;; Other stuff
