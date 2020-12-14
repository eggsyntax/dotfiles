;; Loaded before the config in main.el
;; (directly from init.el's dotspacemacs/user-init)

;; NOTE! Still in spacemacs' init.el (of necessity AFAIK)
;; dotspacemacs/layers
;; dotspacemacs-additional-packages

(message "Loading egg-init.el")

(setq-default

 dotspacemacs-themes '(spacemacs-dark
                       solarized-light
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
                               '("Fira Mono"
                                 :size 16
                                 :weight normal
                                 :width normal)
                             '("Hack"
                               :size 26
                               :weight normal
                               :width condensed))

 ;; Not sure why this has to be set at init stage but it does.
 org-hide-leading-stars 't


 )
