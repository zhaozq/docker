(defvar current-date-time-format "%Y-%m-%d %a %H:%M")

(defun insert-current-date-time ()
  (interactive)
  (insert "<" (format-time-string current-date-time-format (current-time)) ">\n"))

(global-set-key "\C-c\C-d" 'insert-current-date-time)

(defun complete-fortran-prog ()
  (interactive)
  (insert "program")
  (newline)
  (insert "implicit none")
  (newline)
  (newline)
  (insert "end")
  (indent-for-tab-command))
(define-key global-map (kbd "C-c z C-p") 'complete-fortran-prog)

(defun complete-fortran-sub ()
  (interactive)
  (insert "implicit none")
  (indent-for-tab-command)
  (newline)
  (newline)
  (insert "return")
  (indent-for-tab-command)
  (newline)
  (insert "end")
  (indent-for-tab-command))
(define-key global-map (kbd "C-c z C-s") 'complete-fortran-sub)

(defun complete-fortran-do ()
  (interactive)
  (insert "do")
  (indent-for-tab-command)
  (newline)
  (newline)
  (insert "end do")
  (indent-for-tab-command))
(define-key global-map (kbd "C-c z C-d") 'complete-fortran-do)

(defun num-space (num)
  (cond ((> num 0) 
	 (progn
	   (insert " ")
	   (num-space (- num 1))))))

(defun insert-two-space ()
  (interactive)
  (num-space 2))
(define-key global-map (kbd "C-c z 2") 'insert-two-space)

(defun insert-three-space ()
  (interactive)
  (num-space 3))
(define-key global-map (kbd "C-c z 3") 'insert-three-space)

(defun insert-four-space ()
  (interactive)
  (num-space 4))
(define-key global-map (kbd "C-c z 4") 'insert-four-space)

(defun insert-five-space ()
  (interactive)
  (num-space 5))
(define-key global-map (kbd "C-c z 5") 'insert-five-space)

(defun insert-six-space ()
  (interactive)
  (num-space 6))
(define-key global-map (kbd "C-c z 6") 'insert-six-space)

(defun insert-seven-space ()
  (interactive)
  (num-space 7))
(define-key global-map (kbd "C-c z 7") 'insert-seven-space)

(defun insert-eight-space ()
  (interactive)
  (num-space 8))
(define-key global-map (kbd "C-c z 8") 'insert-eight-space)

(defun dash-space (num)
  (cond ((> num 0) 
	 (progn
	   (insert "-")
	   (dash-space (- num 1))))))

(defun insert-dash ()
  (interactive)
  (insert "!!")
  (dash-space 39))
(define-key global-map (kbd "C-c z d") 'insert-dash)

(defun my-change-number-at-point (change)
  (let ((number (number-at-point))
        (point (point)))
    (when number
      (progn
        (forward-word)
        (search-backward (number-to-string number))
        (replace-match (number-to-string (funcall change number)))
        (goto-char point)))))

(defun my-increment-number-at-point ()
  "Increment number at point like vim's C-a"
  (interactive)
  (my-change-number-at-point '1+))
(define-key global-map (kbd "C-c C-a") 'my-increment-number-at-point)

(defun my-decrement-number-at-point ()
  "Decrement number at point like vim's C-x"
  (interactive)
  (my-change-number-at-point '1-))
(define-key global-map (kbd "C-c C-x") 'my-decrement-number-at-point)

(defun bottom-line-replace ()
  (interactive)
  (let ((text (replace-regexp-in-string
               "_" "\\\\_" 
               (buffer-substring-no-properties
                (region-beginning) (region-end)))))
    (delete-region (region-beginning) (region-end))
    (goto-char (region-beginning))
    (insert text)
    ))
(define-key global-map (kbd "C-c z _") 'bottom-line-replace)

(provide 'self)
