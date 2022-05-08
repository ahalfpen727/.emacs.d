;; General initialisation
(setq load-path                         ; Search $HOME/lib/emacs for libraries
      (cons "/home/drew/.emacs.d/lisp/" load-path))

(if (display-graphic-p)                 ; Is this a graphics display?
    (progn                              ; Yes...
      (setq frame-title-format "%b - Emacs") ; Always show buffer name in frame
      (setq frame-resize-pixelwise t)   ;   Resize frames in non-char increments
      (setq pop-up-frames nil)          ;   Don't use separate frames for buffers
      (tool-bar-mode 0)                 ;   Turn the tool-bar off
      (set-scroll-bar-mode 'right)      ;   Make the scroll bar on the right
      (setq mouse-yank-at-point t)      ;   Insert text at text point
      (mouse-wheel-mode t)))             ;   Allow the use of the mouse wheel

(progn                                ; No, we are in a terminal
	(menu-bar-mode 0)                   ;   Turn the menu-bar off
	(when (fboundp #'tool-bar-mode)
	  (tool-bar-mode 0))              ;   and the tool-bar, too
	(xterm-mouse-mode 1))              ;   Enable the mouse under xterm(1)

(prefer-coding-system 'utf-8)           ; Use UTF-8 by default
(set-language-environment "utf-8")      ; We are a UTF-8 shop...
(setq inhibit-startup-buffer-menu nil)  ; Show buffer menu at startup
(setq file-name-coding-system 'utf-8)   ; Filenames are also in UTF-8
(setq x-select-request-type             ; Specify X11 Selection preferences
      '(UTF8_STRING COMPOUND_TEXT TEXT STRING)) ; (UTF-8 is always best)
(setq select-enable-clipboard t)        ; Use the clipboard under X11                                 
(line-number-mode 1)                    ; Display the line number
(column-number-mode 1)                  ; Display the column number
(file-name-shadow-mode 1)               ; Dim parts of filenames being ignored
(transient-mark-mode 0)                 ; Don't enable transient marks
(setq-default truncate-lines t)         ; Don't display continuation lines
(when (fboundp 'global-eldoc-mode)      ; Emacs 25.1 and later
  (global-eldoc-mode 0))                ; Don't automatically display help
(setq inhibit-startup-screen t)
(delete-selection-mode 1)
(setq scroll-conservatively 1000)
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq ring-bell-function 'ignore)
(display-time-mode 1)
;;(global-linum-mode t)

;; emacs default font
;;(when (display-graphic-p)
;;  (set-default-font "-ADBO-Source Code Pro-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1"))
(add-to-list 'default-frame-alist
	     '(font . "Inconsolata"))
(add-to-list 'default-frame-alist
	     '(font . "-ADBO-Source Code Pro-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1"))
(add-to-list 'default-frame-alist
	     '(font . "DejaVu Sans Mono-12"))

;; mouse stuff from http://www.emacswiki.org/emacs/SmoothScrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
; text mode hooks
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
; (add-hook 'text-mode-hook 'turn-on-flyspell) ; this breaks Rnw editing with ess
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(customize-set-variable 'frame-background-mode 'dark)

;; **********************************************************************                                                                                                                                          
;; Autoloaded non-ELPA/MELPA packages                                                                                                                                                                              

(autoload 'svn-status "psvn"
  "Examine the status of a Subversion working directory." t nil)
(autoload 'insert-random-uuid "uuidgen"
  "Insert a random UUID into the buffer." t nil)

(global-font-lock-mode 1)               ; Enable syntax highlighting
(setq font-lock-maximum-decoration t)   ;   with the best results
(defvar font-lock-todo-keywords
  '(("\\(@@@\\|\\_<BUG:\\|\\_<FIXME:\\|\\_<NB:\\|\\_<NOTE:\\|\\_<TODO:\\|\\_<XXX:\\|\\_<XXX\\_>\\)" .
     (1 'warning t)))
  "TODO-style keywords for syntax highlighting.")

(add-to-list 'load-path "~/.emacs.d/lisp/csv-mode.el") 
(add-to-list 'load-path "~/.emacs.d/lisp/pager.el")
(add-to-list 'load-path "~/.emacs.d/lisp/ansi-color.el")
(add-to-list 'load-path "~/.emacs.d/comment-edit.el")

;;ESS (Emacs Speaks Statistics) stuff ; bash-like comments after code
(let ((default-directory "~/.emacs.d/ess/"))
  (normal-top-level-add-subdirs-to-load-path))
;;(add-to-list 'load-path "~/.emacs.d/ess")
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(let ((default-directory "~/.emacs.d/emacs-compbio-kit/"))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/mardown-mode/")
(add-to-list 'load-path "~/.emacs.d/snakemake-mode/")
(add-to-list 'load-path "~/.emacs.d/snakemake-mode/snakemake.el")
(add-to-list 'load-path "~/.emacs.d/mardown-mode/markdown-mode.el")
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; So ESS can find Rterm
(setq inferior-R-program-name "/usr/bin/R")
(setq csv-separators '("," "\t"))
;;(require 'init-ess-r-mode)
;;(require 'init-ess-site)

;(add-to-list 'load-path "/path/to/auto-package-update")
;(require 'auto-package-update)

(org-babel-do-load-languages
'org-babel-load-languages
'((R . t)))

(setq inferior-R-program-name "/usr/lib/R")
;;(ess-toggle-underscore nil)
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

; version control                                                                
(setq version-control t ;; Use version numbers for backups.                  
  kept-new-versions 10  ;; Number of newest versions to keep.                
  kept-old-versions 0   ;; Number of oldest versions to keep.                
  delete-old-versions t ;; Don't ask to delete excess backup versions.       
  backup-by-copying t)  ;; Copy all files, don't rename them.                
(setq vc-make-backup-files t)

; markdown and polymode stuff (for using Rmd files)
; file available from: http://jblevins.org/projects/markdown-mode/
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (json-mode org htmlize db sqlite3 sqlite markdown-mode+ ess-R-data-view bug-hunter))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
