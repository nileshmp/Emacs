;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
 (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
   (setenv "PATH" path-from-shell)
   (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

;; dir to store all extra extensions
(setq vendor-dir (concat dotfiles-dir "/vendor"))

;; add my vendor dir to load path
(add-to-list 'load-path vendor-dir)

;; wombat color theme
(add-to-list 'load-path (concat vendor-dir "/color-theme-wombat"))
(require 'color-theme-wombat)
(color-theme-wombat)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 160)

;; Custom functions

(defvar *clojure-scratch-dir* "~/sandbox/projects/clojure/clj-scratch"
  "Location of a scratch project for quickly playing with clojure stuff")

(defun scratch-clojure ()
  (interactive)
  (if (file-exists-p *clojure-scratch-dir*)
      (progn
        (cd *clojure-scratch-dir*)
        (elein-swank)
        (find-file (concat *clojure-scratch-dir* "/src/clj_scratch/core.clj")))
    (message "make sure you have your clj-scratch project set up sucker")))

;; elein
(add-to-list 'load-path (concat vendor-dir "/elein"))
(require 'elein)

(require 'undo-tree)

;; durendal
;; (add-to-list 'load-path (concat vendor-dir "/durendal"))
;; (require 'durendal)

;;line numbers
(require 'linum)

;; yasnippets
(add-to-list 'load-path (concat vendor-dir "/yasnippet-0.6.1c"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat vendor-dir "/yasnippet-0.6.1c/snippets"))
;;(yas/load-directory (concat vendor-dir "/yasnippets-rails/rails-snippets"))

(add-to-list 'load-path (concat vendor-dir "/textmate"))
(require 'textmate)
(textmate-mode)

;; do not make backup files
(setq make-backup-files nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; customizing in default settings...
(load-file "~/.emacs.d/packages/key-bindings.el")
;; end of customizing in default settings...

;;duplicate line
;; (require 'duplicate-line)
(require 'duplicate-current-line-or-region)
;;end duplicate line

;;move lines up or down..
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))
;; move lines end......

;;fullscreen mode
(require 'fullscreen)
;; end of fullscreen mode

;; highlight parenthesis
(show-paren-mode 1)
;;color themes
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-robin-hood)
;(require 'color-theme-gruber-darker)
;(color-theme-gruber-darker)
;;end of color themes


;; Originally from stevey, adapted to support moving to a new directory.
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive
   (progn
     (if (not (buffer-file-name))
         (error "Buffer '%s' is not visiting a file!" (buffer-name)))
     (list (read-file-name (format "Rename %s to: " (file-name-nondirectory
                                                     (buffer-file-name)))))))
  (if (equal new-name "")
      (error "Aborted rename"))
  (setq new-name (if (file-directory-p new-name)
                     (expand-file-name (file-name-nondirectory
                                        (buffer-file-name))
                                       new-name)
                   (expand-file-name new-name)))
  ;; If the file isn't saved yet, skip the file rename, but still update the
  ;; buffer name and visited file.
  (if (file-exists-p (buffer-file-name))
      (rename-file (buffer-file-name) new-name 1))
  (let ((was-modified (buffer-modified-p)))
    ;; This also renames the buffer, and works with uniquify
    (set-visited-file-name new-name)
    (if was-modified
        (save-buffer)
      ;; Clear buffer-modified flag caused by set-visited-file-name
      (set-buffer-modified-p nil))
  (message "Renamed to %s" new-name)))


;; resizing to screen size hard coded...way of doing it...
;; (setq initial-frame-alist
;;       `((left . 0) (top . 10)
;;         (width . 237) (height . 65)))

;; another elegant way of amximizing..
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)