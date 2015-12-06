;;; ~/.emacs.d/init.el
;;; package固有の設定は ./init/init-(packagename).el に書く
;;; package管理には el-get を使用する

;; Enable el-get
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; set el-get setting directory
(setq el-get-user-package-directory (locate-user-emacs-file "init"))

;; load init files
(el-get-bundle emacs-jp/init-loader
  (setq-default init-loader-show-log-after-init nil
		init-loader-byte-compile t)
  (init-loader-load (locate-user-emacs-file "init-loader")))

;; put site-lisp and its subdirectories into load-path
(when (fboundp 'normal-top-level-add-subdirs-to-load-path)
  (let* ((dir (locate-user-emacs-file "site-lisp"))
	 (default-directory dir))
    (when (file-directory-p dir)
      (add-to-list 'load-path dir)
      (normal-top-level-add-subdirs-to-load-path))))

