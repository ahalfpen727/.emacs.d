(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)
  (package-initialize)

;;ESS (Emacs Speaks Statistics) stuff
; bash-like comments after code
(add-to-list 'load-path "~/.emacs.d/comment-edit.el")
(add-to-list 'load-path "~/.emacs.d/ess-site.el")

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/csv-mode.el") 
(add-to-list 'load-path "~/.emacs.d/lisp/pager.el")
(add-to-list 'load-path "~/.emacs.d/lisp/ansi-color.el")
;;(require 'lisp)

; markdown and polymode stuff (for using Rmd files)
; file available from: http://jblevins.org/projects/markdown-mode/
(add-to-list 'load-path "~/.emacs.d/mardown-mode/")
(add-to-list 'load-path "~/.emacs.d/mardown-mode/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;(setq load-path (append '("~/.emacs.d/poly-mode/"  "~/emacs.d/poly-mode/modes") load-path))
;;(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . poly-markdown+r-mode))

(setq csv-separators '("," "\t"))
(require 'ess-r-mode)
(require 'ess-site)
;;(require 'color-theme-sanityinc-tomorrow-blue)
(org-babel-do-load-languages
'org-babel-load-languages
'((R . t)))

;; snakemake mode added from .emacs.d/
(add-to-list 'load-path "~/.emacs.d/snakemake-mode/")
(add-to-list 'load-path "~/.emacs.d/snakemake-mode/snakemake.el")
(require 'snakemake-mode)

(setq inferior-R-program-name "/usr/lib/R")
(ess-toggle-underscore nil)
(setq ess-default-style 'DEFAULT)
(setq ess-indent-level 2)
(setq ess-indent-with-fancy-comments nil)
(setq ess-history-file nil)
(setq ess-roxy-str "#'")
(setq inferior-R-args "--no-restore --no-save")
; disable C-c C-c ess-eval-buffer
(add-hook 'ess-mode-hook '(lambda () (define-key ess-mode-map "\C-c\C-c" nil)))
;(setq eldoc-echo-area-use-multiline-p t)
(add-to-list 'load-path "~/.emacs.d/mardown-mode/")

; window splitting, removing panes, etc
(global-set-key (kbd "M-0") 'delete-other-windows) ; 【Alt+0】 unsplit all
(global-set-key (kbd "M-+") 'split-window-right) ; 【Alt+'+'】add split
(global-set-key (kbd "M-RET") 'other-window) ; 【Alt+Return】 move cursor to next pane
(global-set-key (kbd "M-1") 'delete-window)  ; remove current pane

(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-unset-key (kbd "\C-x DEL") )
(global-unset-key (kbd "\C-t") )
(setq inhibit-startup-screen t)
(delete-selection-mode 1)
(setq scroll-conservatively 1000)
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq ring-bell-function 'ignore)
(display-time-mode 1)
;(global-linum-mode t)

; emacs window default font
(when (display-graphic-p)
  (set-default-font "-ADBO-Source Code Pro-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1"))

;(customize-set-variable 'frame-background-mode 'dark)
;; mouse stuff from http://www.emacswiki.org/emacs/SmoothScrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

; text mode hooks
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
; (add-hook 'text-mode-hook 'turn-on-flyspell) ; this breaks Rnw editing with ess
(add-hook 'text-mode-hook 'turn-on-auto-fill)

; version control                                                                
(setq version-control t ;; Use version numbers for backups.                  
  kept-new-versions 10  ;; Number of newest versions to keep.                
  kept-old-versions 0   ;; Number of oldest versions to keep.                
  delete-old-versions t ;; Don't ask to delete excess backup versions.       
  backup-by-copying t)  ;; Copy all files, don't rename them.                
(setq vc-make-backup-files t)
