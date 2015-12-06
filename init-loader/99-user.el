;;; 99-user.el

;; Delete auto save file when emacs closed
(setq delete-auto-save-files t)

;; Create auto save files to ~/.autosave/
(setq auto-save-list-file-prefix (expand-file-name "~/.autosave/"))

;; Don't create backup files
(setq make-backup-files nil)

;; Shrink and enlarge window by Ctrl up or down 
(global-set-key [(ctrl up)] '(lambda (arg) (interactive "p") (shrink-window arg)))
(global-set-key [(ctrl down)] '(lambda (arg) (interactive "p") (enlarge-window arg)))
(global-set-key [(ctrl left)] '(lambda (arg) (interactive "p") (shrink-window-horizontally arg)))
(global-set-key [(ctrl right)] '(lambda (arg) (interactive "p") (enlarge-window-horizontally arg)))

;; Assign C-h for backspace
(global-set-key (kbd "\C-h") 'delete-backward-char)

;; Move window by shift + arrow
(windmove-default-keybindings)

;; Show paren mode
(show-paren-mode t)
