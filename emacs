
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-BibTeX "Biber")
;; '(TeX-view-program-selection (quote ((output-pdf "xdg-open"))))
 '(doc-view-continuous t)
 '(ebib-bibtex-dialect (quote biblatex))
 '(ebib-file-associations
   (quote
    (("pdf" . "evince")
     ("ps" . "gv")
     ("djvu" . "evince"))))
 '(ebib-file-search-dirs (quote ("/mnt/storage/Dati/Books")))
 '(ebib-preload-bib-files (quote ("Documenti/BibTeX/Bibliografia.bib")))
 '(tex-bibtex-command "biber")
 '(tool-bar-style (quote image)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Line numbers
(global-linum-mode 1)
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)));
;; Preventing the Creation of Backup Files
(setq make-backup-files nil)
;; Abilitare tasto TAB
(global-set-key (kbd "TAB") 'self-insert-command);

;; Abilita la tastiera ibycus
(set-input-method "greek-ibycus4")

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)
;; turn on abbrev mode globally
(setq-default abbrev-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Latex for Emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; only start server for okular comms when in latex mode
;;    (add-hook 'LaTeX-mode-hook 'server-start)
;;    (setq TeX-PDF-mode t) ;; use pdflatex instead of latex

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Standard emacs/latex config
;; https://www.emacswiki.org/emacs/AUCTeX
    (setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq-default TeX-master nil)
    
    (add-hook 'LaTeX-mode-hook 'visual-line-mode)
    (add-hook 'LaTeX-mode-hook 'flyspell-mode)
    (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
    
    ; enable auto-fill mode, nice for text
    (add-hook 'LaTeX-mode-hook 'auto-fill-mode)
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    (setq reftex-plug-into-AUCTeX t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable synctex correlation
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-start-server t)
(setq TeX-source-correlate-method 'auto)
;;(setq TeX-source-correlate-method 'synctex)
;;(setq TeX-source-correlate-method '((auto) (pdf . synctex)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable PDF Tools
(pdf-tools-install)
(setq TeX-view-program-selection '((output-pdf "PDF Tools")))
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Reledmac
(load "critical-keys")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PREDICTIVE MODE
;; https://www.emacswiki.org/emacs/PredictiveMode
;; To compile predictive package just install texinfo
;; predictive install location
	(add-to-list 'load-path "~/.emacs.d/predictive/")
;; dictionary locations
	(add-to-list 'load-path "~/.emacs.d/predictive/latex/")
	(add-to-list 'load-path "~/.emacs.d/predictive/texinfo/")
	(add-to-list 'load-path "~/.emacs.d/predictive/html/")
;; load predictive package
	(autoload 'predictive-mode "~/.emacs.d/predictive/predictive"
		"Turn on Predictive Completion Mode." t)
;; auto-load predictive mode
;;(add-hook 'LaTeX-mode-hook 'predictive-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
