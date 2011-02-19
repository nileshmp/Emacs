;; (defun duplicate-line (arg)
;;   "Duplicate current line, leaving point in lower line."
;;   (interactive "*p")

;;   ;; save the point for undo
;;   (setq buffer-undo-list (cons (point) buffer-undo-list))

;;   ;; local variables for start and end of line
;;   (let ((bol (save-excursion (beginning-of-line) (point)))
;;         eol)
;;     (save-excursion

;;       ;; don't use forward-line for this, because you would have
;;       ;; to check whether you are at the end of the buffer
;;       (end-of-line)
;;       (setq eol (point))

;;       ;; store the line and disable the recording of undo information
;;       (let ((line (buffer-substring bol eol))
;;             (buffer-undo-list t)
;;             (count arg))
;;         ;; insert the line arg times
;;         (while (> count 0)
;;           (newline)         ;; because there is no newline in 'line'
;;           (insert line)
;;           (setq count (1- count)))
;;         )

;;       ;; create the undo information
;;       (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
;;     ) ; end-of-let

;;   ;; put the point in the lowest line and return
;;   (next-line arg))

;; (provide 'duplicate-line)


(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(provide 'duplicate-current-line-or-region)