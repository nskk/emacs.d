;;; package --- Summary
;;; Commentary:
;;; Code:

(global-anzu-mode +1)

(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000))

(global-set-key (kbd "C-c C-a C-r") 'anzu-replace-at-cursor-thing)

(provide 'init-anzu)
;;; init-anzu.el ends here
