;; clj-find-var courtesy of @ag on Clojurians
(defun clj-find-var ()
  "Attempts to jump-to-definition of the symbol-at-point. If CIDER fails, or not available, falls back to dumb-jump"
  (interactive)
  (let ((var (cider-symbol-at-point)))
    (if (and (cider-connected-p) (cider-var-info var))
        (unless (eq 'symbol (type-of (cider-find-var nil var)))
          (dumb-jump-go))
      (dumb-jump-go))))

;; several related(?) hooks in hooks.el -- search init-jump-handlers

;; Toggle reader macro sexp comment
;; Toggles the #_ characters at the start of an expression
(defun clojure-toggle-reader-comment-sexp ()
  (interactive)
  (let* ((point-pos1 (point)))
    (evil-insert-line 0)
    (let* ((point-pos2 (point))
           (cmtstr "#_")
           (cmtstr-len (length cmtstr))
           (line-start (buffer-substring-no-properties point-pos2 (+ point-pos2 cmtstr-len))))
      (if (string= cmtstr line-start)
          (delete-char cmtstr-len)
        (insert cmtstr))
      (evil-normal-state))))

;; TODO not sure why this has to be an evil command rather than a function. Try converting.
(evil-define-command maclike-paste (count &optional register)
  (interactive "P<x>")
  (evil-paste-before count register)
  (forward-char))

;; Helper functions to hotload clojure dependencies
;; Taken from https://www.eigenbahn.com/2020/05/06/fast-clojure-deps-auto-reload

(defun prf/cider/send-to-repl (sexp &optional eval ns)
  "Send SEXP to Cider Repl. If EVAL is t, evaluate it.
Optionally, we can change namespace by specifying NS."
  (cider-switch-to-repl-buffer ns)
  (goto-char cider-repl-input-start-mark)
  (delete-region (point) (point-max))
  (save-excursion
    (insert sexp)
    (when (equal (char-before) ?\n)
      (delete-char -1)))
  (when eval
    (cider-repl--send-input t)))

(defun prf/clj/pomegranate-dep (dep)
  "Format a Clojure Pomegranate dependency import for DEP."
  (concat
   (format
    "%s"
    ;; NB: this is clojure!
    `(use '[cemerick.pomegranate :only (add-dependencies)]))
   (s-replace-all
    `(("\\." . ".")
      ("mydep" . ,dep))
    (format
     "%S"
     ;; NB: this is clojure!
     `(add-dependencies :coordinates '[mydep]
                        :repositories (merge cemerick.pomegranate.aether/maven-central
                                             {"clojars" "https://clojars.org/repo"}))))))

(defun egg-hotload-dependency (&optional dep ns)
  "Auto-import DEP in the current Clojure Repl using Pomegranate.
Optionally, we can change namespace by specifying NS."
  (interactive)
  (setq dep (or dep (read-string "Dep: ")))
  (prf/cider/send-to-repl (prf/clj/pomegranate-dep dep) t ns))

;; End helper functions to hotload clojure dependencies
