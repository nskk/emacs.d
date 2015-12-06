;; RefTeX
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode

;; AUCTeX
(require 'tex-site)
(require 'tex-jp)
(setq TeX-default-mode 'japanese-latex-mode)
(setq japanese-TeX-command-default "pTeX")
(setq japanese-LaTeX-command-default "pLaTeX")
(setq japanese-LaTeX-default-style "jarticle")
(setq kinsoku-limit 10)
(setq LaTeX-indent-level 4)
(setq LaTeX-item-indent 2)
(setq TeX-output-view-style '(("^dvi$" "." "xdvi '%d'")))
(setq preview-image-type 'dvipng)
(add-hook 'LaTeX-mode-hook (function (lambda ()
  (add-to-list 'TeX-command-list
    '("pTeX" "%(PDF)ptex %`%S%(PDFout)%(mode)%' %t"
     TeX-run-TeX nil (plain-tex-mode) :help "Run ASCII pTeX"))
  (add-to-list 'TeX-command-list
    '("platex" "%(PDF)platex %`%S%(PDFout)%(mode)%' %t"
     TeX-run-TeX nil (latex-mode) :help "Run ASCII pLaTeX"))
  (add-to-list 'TeX-command-list
    '("evince" "evince '%s.pdf' " TeX-run-command t nil))
  (add-to-list 'TeX-command-list
    '("pdf" "dvipdfmx -V 4 -f ipa.map '%s' " TeX-run-command t nil))
  (add-to-list 'TeX-command-list
    '("go" "%(PDF)platex %`%S%(PDFout)%(mode)%' %t\n dvipdfmx -V 4 -f ipa.map '%s'\n evince '%s.pdf'"
      TeX-run-TeX nil (latex-mode) :help "Run ASCII pTeX"))
  )))
