(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages"))


(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(setq ac-auto-start nil)
;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;;(define-key ac-completing-map "M-ESC" 'ac-stop)
(define-key ac-mode-map (kbd "M-SPC") 'auto-complete)




(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))


;autocomplete
;(require 'anything)
;(require 'anything-show-completion)
;(load-file "~/.packages/autocomplete-init.el")
;(add-to-list 'ac-modes 'javascript-mode)
;autocomplete ends


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
