(global-set-key "\M-/" 'auto-complete)
(global-set-key "\M-?" 'dabbrev-expand)

;; (global-set-key (kbd "\C-d") 'duplicate-line)
(global-set-key (kbd "\C-d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-M-<up>") 'move-line-up)
(global-set-key (kbd "C-M-<down>") 'move-line-down)
(global-set-key (kbd "C-M-/") 'comment-or-uncomment-region-or-line)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; steve yegges's suggested keybindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-R" 'rename-file-and-buffer)
(global-set-key "\C-k" 'kill-whole-line)

;(global-set-key "\177" 'c-hungry-delete-backwards)
;(global-set-key "\C-d" 'c-hungry-delete-forward)

;(global-set-key (kbd "A-d") "\C-a\C- \C-n\M-w\C-y")
;(global-set-key (kbd "A-D") "\M-w\C-y")

;(global-set-key "\C-cc" 'mode-compile)
;(aglobal-set-key "\C-ck" 'mode-compile-kill)

;(define-key clojure-mode-map (kbd "\C-d") 'duplicate-line)
;(global-set-key (kbd "\C-y") 'kill-whole-line)
;(global-set-key (kbd "\C-y") "\C-a \C-k")

;(global-set-key (kbd "ESC M-d") 'ecb-toggle-ecb-windows)

;(define-key ac-completing-map "\M-n" 'ac-next)
;(define-key ac-completing-map "\M-p" 'ac-previous)
;(define-key ac-mode-map (kbd "\M-/") 'auto-complete) 
;(define-key ac-mode-map (kbd "ESC M-/") 'ac-complete-dictionary)
;(define-key anything-map "\C-cz" 'anything-execute-persistent-action)

;(global-set-key (kbd "\C-co") 'open-buffer-path)

;(global-set-key "\C-cy" 'browse-kill-ring)

;(global-set-key (kbd "ESC M-a") 'ack)

;(global-set-key "\M--" 'tabbar-backward)
;(global-set-key "\M-=" 'tabbar-forward)
;(global-set-key "\C-x o" 'switch-to-buffer)


;; map meta to command key for mac
;;(setq ns-command-modifier 'meta)

;;(global-set-key [f7] 'ns-toggle-fullscreen)


;;(global-set-key [f5] 'call-last-kbd-macro)
