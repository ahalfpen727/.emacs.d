;; General initialisation

(unless (string-match "GNU" (emacs-version))
  (error "GNU Emacs required for this .emacs initialisation file"))
(when (string< emacs-version "23.1")
  (error "GNU Emacs 23.1 or later required for this .emacs initialisation file"))

(setq load-path                         ; Search $HOME/lib/emacs for libraries
      (cons "~/lib/emacs" load-path))

(when (require 'package nil t)          ; Emacs 24.1 and later supports packages
  (setq package--init-file-ensured t)   ;   Don't add code to ~/.emacs
  (setq package-archives                ;   Set custom archive paths
	`(("gnu" .
           ,(format "http%s://elpa.gnu.org/packages/"
                    (if (gnutls-available-p) "s" "")))
          ("melpa" .
           ,(format "http%s://melpa.org/packages/"
                    (if (gnutls-available-p) "s" "")))))
  (package-initialize))                 ;   Initialise ELPA/MELPA packages

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


; **********************************************************************                                                                                                                                          
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

;;ESS (Emacs Speaks Statistics) stuff ; bash-like comments after code
(add-to-list 'load-path "~/.emacs.d/comment-edit.el")
(add-to-list 'load-path "~/.emacs.d/ess-site.el")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/csv-mode.el") 
(add-to-list 'load-path "~/.emacs.d/lisp/pager.el")
(add-to-list 'load-path "~/.emacs.d/lisp/ansi-color.el")
(add-to-list 'load-path "~/.emacs.d/mardown-mode/")
(add-to-list 'load-path "~/.emacs.d/mardown-mode/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; So ESS can find Rterm
(setq inferior-R-program-name "/Library/Frameworks/R.framework/Versions/3.0/Resources/bin/R")
(setq csv-separators '("," "\t"))
;;(require 'init-ess-r-mode)
;;(require 'init-ess-site)

(org-babel-do-load-languages
'org-babel-load-languages
'((R . t)))

;; snakemake mode added from .emacs.d/
(add-to-list 'load-path "~/.emacs.d/snakemake-mode/")
(add-to-list 'load-path "~/.emacs.d/snakemake-mode/snakemake.el")
;;(require 'snakemake-mode)

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
