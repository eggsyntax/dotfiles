(message "Loading egg's custom hooks.")

;; A couple of hooks that exist only for bindings may be in bindings.el

(with-eval-after-load 'clojure-mode

  (add-hook 'clojure-mode-hook       #'spacemacs//init-jump-handlers-clojure-mode)
  (add-hook 'clojurescript-mode-hook #'spacemacs//init-jump-handlers-clojurescript-mode)
  (add-hook 'clojurec-mode-hook      #'spacemacs//init-jump-handlers-clojurec-mode)
  (add-hook 'cider-repl-mode-hook    #'spacemacs//init-jump-handlers-cider-repl-mode)

  )

;;;; Misc

;; Use different themes for certain files

(defun ensure-theme (theme buf-name)
  (when (and (string-match-p buf-name (or buffer-file-name ""))
             (not (string= spacemacs--cur-theme theme)))
    (message "Loading " theme " for " buf-name)
    (spacemacs/load-theme theme)))

(defun per-file-colors (filename)
  (ensure-theme 'zenburn         "dw-TODO.org")
  (ensure-theme 'spacemacs-light "egg-works/project.clj")
  (ensure-theme 'ample-light     "turbovote-http-api/project.clj")
  (ensure-theme 'organic-green   "turbovote-web/project.clj")
  (ensure-theme 'organic-green   "turbovote-web-reframe/project.clj")
  (ensure-theme 'flatui          "tv-rabbit-client/project.clj")
  )
(add-hook 'after-load-functions 'per-file-colors)

;; Fill column indicator
(add-hook 'prog-mode-hook 'spacemacs/toggle-fill-column-indicator-on)

;; remove trailing whitespace when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; TODO I had this previously -- do I miss it?
;; (require 'magit-gitflow)
;; (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)


