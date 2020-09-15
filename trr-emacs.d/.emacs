(add-to-list 'load-path "~/.emacs.d/lisp/")

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-enabled-themes (quote (manoj-dark))))

(add-hook 'after-make-frame-functions
	  (lambda (frame)
            (select-frame frame)
            (load-theme 'manoj-dark t)))
(load-theme 'manoj-dark t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (add-to-list 'load-path "~/.emacs.d/jdee-20160304.536")
;; (load "jdee")



(blink-cursor-mode t)
(setq-default cursor-type 'box)

;;;; Macros ;;;;
;; Are we running XEmacs or Emacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;; Some simple macros to more easily tell if we're running GNUEmacs or XEmacs
;; taken from the .emacs of sukria@online.fr | http://sukria.online.fr
(defmacro GNUEmacs (&rest x)
  (list 'if (not running-xemacs) (cons 'progn x)))
(defmacro XEmacs (&rest x)
  (list 'if running-xemacs (cons 'progn x)))
(defmacro Xlaunch (&rest x)
  (list 'if (eq window-system 'x) (cons 'progn x)))
;;;; /Macros ;;;;



;; (windmove-default-keybindings)
;; (global-set-key [C-c <left>] 'windmove-left)          ; move to left window
;; (global-set-key [C-c <right>] 'windmove-right)        ; move to right window
;; (global-set-key [C-c <up>] 'windmove-up)              ; move to upper window
;; (global-set-key [C-c <down>] 'windmove-down)          ; move to lower window
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
;; (global-set-key (kbd "C-S-<right>") 'forward-word-mark)
;; (global-set-key (kbd "C-S-<left>") 'backward-word-mark)
;; (global-set-key (kbd "S-<right>") 'forward-char-mark)
;; (global-set-key (kbd "S-<left>") 'backward-char-mark)
;; (global-set-key (kbd "S-<up>") 'previous-line-mark)
;; (global-set-key (kbd "S-<down>") 'next-line-mark)
;; (global-set-key (kbd "S-<right>") [C-S-f])
;; (global-set-key (kbd "S-<left>") [C-S-b])

;; You can then switch to neighbouring windows using the following keys (where the arrow used intuitively defines the direction in which you move):
;;     S-<left>
;;     S-<right>
;;     S-<up>
;;     S-<down>


; close buffer in next pane
(defun close-buffer-in-next-pane ()
  "Kill the buffer in the other pane."
  (interactive)
  (other-window 1)
  ;(kill-buffer (buffer-name))
  (kill-this-buffer)
  (other-window 1)
  ;(close-current-buffer)
  ;(delete-window)
  )

(global-set-key [(control \q)] 'close-buffer-in-next-pane)

;;; add ansi-color to shell
(require 'ansi-color)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

(shell)
(set-buffer "*scratch*")
(shell)
(set-buffer "*shell*")




;; (shell)
;; (set-buffer "*shell*")
;; (shell)
;; (set-buffer "*shell*")
;; (shell)
;; (set-buffer "*shell*")
;; (shell)
;; (set-buffer "*shell*")
;; (shell)
;; (set-buffer "*shell*")
;; (shell)
;; (set-buffer "*shell*")


;; ;; (ansi-term "/bin/bash")
;; ;; (set-buffer "*ansi-term*")
;; ;; (ansi-term "/bin/bash")
;; ;; (set-buffer "*ansi-term*")
;; ;; (ansi-term "/bin/bash")
;; ;; (set-buffer "*ansi-term*")
;; (ansi-term "/bin/bash")
;; (set-buffer "*ansi-term*")

; C-1, C-2, C-3 ... C-9 to switch to shells annd ansi-terms
(global-set-key [(control \1)]
  (lambda () (interactive) (switch-to-buffer "*shell*")))
(global-set-key [(control \2)]
  (lambda () (interactive) (switch-to-buffer "*shell*<2>")))
(global-set-key [(control \3)]
  (lambda () (interactive) (switch-to-buffer "*shell*<3>")))
(global-set-key [(control \4)]
  (lambda () (interactive) (switch-to-buffer "*shell*<4>")))
(global-set-key [(control \5)]
  (lambda () (interactive) (switch-to-buffer "*shell*<5>")))
(global-set-key [(control \6)]
  (lambda () (interactive) (switch-to-buffer "*shell*<6>")))
(global-set-key [(control \7)]
  (lambda () (interactive) (switch-to-buffer "*shell*<7>")))
(global-set-key [(control \8)]
  (lambda () (interactive) (switch-to-buffer "*shell*<8>")))
(global-set-key [(control \9)]
  (lambda () (interactive) (switch-to-buffer "*ansi-term*")))
;; (global-set-key [(control \7)]
;;   (lambda () (interactive) (switch-to-buffer "*ansi-term*<2>")))
;; (global-set-key [(control \8)]
;;   (lambda () (interactive) (switch-to-buffer "*ansi-term*<3>")))
;; (global-set-key [(control \9)]
;;   (lambda () (interactive) (switch-to-buffer "*ansi-term*<4>")))

;; Following bound functions are defined in
;; personal-funcs.el file
;; Stuff collected from internet and created on my own
;; Bind function to usual kill-line key
;(global-set-key "\C-k" 'kill-whole-line)

(global-set-key "%" 'match-paren)
     (defun match-paren (arg)
       "Go to the matching paren if on a paren; otherwise insert %."
       (interactive "p")
       (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
             ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
             (t (self-insert-command (or arg 1)))))


;;; Some basic keybindings
(global-set-key [delete] 'delete-char)
(global-set-key [backspace] 'delete-backward-char)
(global-set-key [(meta backspace)] 'undo)
(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [(control delete)] 'kill-word)
(global-set-key [M-return] 'expand-abbrev)


;;; (global-set-key [end] 'end-of-line)
;;; (global-set-key [home] 'beginning-of-line)

;;; Key binding for switching to next and previous buffer
(global-set-key [C-tab] 'bs-cycle-next)
(global-set-key [S-tab] 'bs-cycle-previous)

;;; (global-set-key [(meta w)] 'copy-region-as-kill)

(global-set-key [f1] 'speedbar-get-focus)
(global-set-key [f2] 'man-follow)
(global-set-key [f3] 'buffer-menu)
(global-set-key [f4] 'ispell-buffer)
(global-set-key [f5] 'ispell-word)

;;; For JDEEbug
(global-set-key [f6] 'jdee-bug-step-over)
(global-set-key [f7] 'jdee-bug-step-into)
(global-set-key [f8] 'jdee-bug-step-into-all)
(global-set-key [f9] 'jdee-bug-step-out)
(global-set-key [f10] 'jdee-bug-continue)
(global-set-key [f11] 'jdee-bug-toggle-breakpoint)
(global-set-key [f12] 'jdee-bug-clear-breakpoints)

;;; For JDB
;; (global-set-key [f6] [C-c C-a C-s])
;; (global-set-key [f7] [C-c C-a C-n])
;; ;;(global-set-key [f8] )
;; (global-set-key [f9] [C-c C-a C-o])
;; (global-set-key [f10] [C-c C-a C-r])
;; (global-set-key [f11] [C-c C-a C-b])
;; ;;(global-set-key [f12] )

;; (global-set-key [end] 'end-of-line)
;; (global-set-key [home] 'beginning-of-line)
;;; Key binding for switching to next and previous buffer
;; (global-set-key [C-tab] 'bs-cycle-next)
;; (global-set-key [S-tab] 'bs-cycle-previous)

;;; Well, it is good to have the same keybinding for commenting out
;;; region in all modes.
(global-set-key [?\C-c ?c] 'comment-region)
(global-set-key [?\C-c ?u] 'uncomment-region)


;;; org-mode-hook
;; (setq org-support-shift-select t)
;; (cua-mode 0)

;; Conventional selection/deletion
(setq org-support-shift-select t)

;; based on a tip from the Org-mode list (thanks, "PT")
(defun my-org-mode-stuff ()
  (define-key org-mode-map [(meta tab)] 'previous-user-buffer)
  (local-set-key (kbd "C-S-<right>") 'forward-word-mark)
  (local-set-key (kbd "C-S-<left>") 'backward-word-mark)
  (local-set-key (kbd "S-<right>") 'forward-char-mark)
  (local-set-key (kbd "S-<left>") 'backward-char-mark)
  (local-set-key (kbd "S-<up>") 'previous-line-mark)
  (local-set-key (kbd "S-<down>") 'next-line-mark))

(add-hook 'org-mode-hook 'my-org-mode-stuff)

;;; Excellent package for better scrolling in emacs
;;; should be default package. But now it can be downloaded
;;; from: http://user.it.uu.se/~mic/pager.el
(require 'pager)

;;; Bind scrolling functions from pager library.
(global-set-key [next] 	   'pager-page-down)
(global-set-key [prior]	   'pager-page-up)
(global-set-key '[M-up]    'pager-row-up)
(global-set-key '[M-down]  'pager-row-down)

;; clear the current buffer
(fset 'clear
   [?\M-> ?\C-  ?\M-< ?\C-w return ?\M-p])
;(global-set-key [f8] 'clear)

;; remove ^M meta characters from a file globally
(fset 'dem
   [?\M-< ?\M-% ?\C-q ?\C-m return return ?! ?\M-<])
;(global-set-key [f7] 'dem)

(defun dos2unix ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))


;;; It is always better to know current line and column number
(column-number-mode t)
(line-number-mode t)

;;; Make all yes-or-no questions as y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;;; Some more customization for JDEE
(setq jdee-server-dir "/Applications/jdee-server-master/target")

; (jdee-set-variables)
(setq jdee-global-classpath (quote ("." "/Users/triley/adb/biojava-live/ant-build/biojava.jar" "/Users/triley/adb/biojava-live/ant-build/bytecode.jar" "/Users/triley/adb/biojava-live/ant-build/commons-cli.jar" "/Users/triley/adb/biojava-live/ant-build/commons-collections-2.1.jar" "/Users/triley/adb/biojava-live/ant-build/commons-dbcp-1.1.jar" "/Users/triley/adb/biojava-live/ant-build/commons-pool-1.1.jar" "/Users/triley/adb/BindingSites/java" "/Users/triley/adb/jfreechart/jfreechart-1.0.13/lib/jfreechart-1.0.13.jar" "/Users/triley/adb/jfreechart/jfreechart-1.0.13/lib/jcommon-1.0.16.jar" "/Users/triley/adb/util/commons-lang-2.4/commons-lang-2.4.jar" "/Users/triley/adb/util/commons-math3-3.2/commons-math3-3.2.jar" "/Users/triley/adb/util/itext-5.1.0/itextpdf-5.1.0.jar" "/Users/triley/adb/util/jmathplot/dist/jmathplot.jar" "/Users/triley/adb/util/forester/archaeoopteryx-read-only/forester/java/forester.jar" "/Users/triley/adb/util/jmol-12.0.47.jar" "/Users/triley/adb/util/vecmath-1.5.2.jar" "/Users/triley/adb/util/trove/3.0.2/lib/trove-3.0.2.jar" "/Users/triley/adb/util/jeplite/jeplite-0.8.7a.jar" "/Users/triley/adb/util/foxtrot-4.0/lib/foxtrot-core-4.0.jar" "/Users/triley/adb/util/java-genomics-io-master/dist/java-genomics-io.jar" "/Users/triley/adb/util/java-genomics-io-master/lib/BigWig.jar" "/Users/triley/adb/util/java-genomics-io-master/lib/hamcrest-core-1.1.0.jar" "/Users/triley/adb/util/java-genomics-io-master/lib/jacocoant.jar" "/Users/triley/adb/util/java-genomics-io-master/lib/junit.jar" "/Users/triley/adb/util/java-genomics-io-master/lib/log4j-1.2.15.jar" "/Users/triley/adb/util/java-genomics-io-master/lib/sam-1.67.jar" "/Users/triley/adb/util/java-genomics-io-master/lib/commons-lang3-3.1.jar" "/Users/triley/adb/util/commons-compress-1.8.1/commons-compress-1.8.1.jar" "/Users/triley/bionets/GUI/packaging/bionets-2.0/commons-io-2.5.jar" "/Users/triley/bionets/GUI/packaging/bionets-2.0/Bionets.jar" "/Users/triley/bionets/GUI/packaging/bionets-2.0/bionets.util.jar" "/Users/triley/bionets/GUI/packaging/bionets-2.0/commons-collections4-4.1.jar" "/Users/triley/adb/util/ujmp-complete-0.3.0.jar" "/Users/triley/bionets/GUI/packaging/bionets-2.0/WorkingDirs/first/BNRunTime.jar")))

(setq jdee-sourcepath (quote ("." "/Users/triley/adb/BindingSites/java" "/Users/triley/adb/BindingSites/java/org/biojava/bio/mydp" "/Users/triley/adb/biojava-live/src/org/biojava/bio" "/Users/triley/adb/biojava-live/src/org/biojava/bio/dist" "/Users/triley/adb/biojava-live/src/org/biojava/bio/symbol" "/Users/triley/adb/biojava-live/src/org/biojava/bio/dp" "/Users/triley/adb/biojava-live/src/org/biojava/bio/gui" "/Users/triley/adb/biojava-live/src/org/biojava/bio/seq" "/Users/triley/adb/biojava-live/src/org/biojava/bio/alignment" "/Users/triley/adb/biojava-live/src/org/biojava/bio/seq/impl" "/Users/triley/adb/biojava-live/src/org/biojava/bio/seq/glyph" "/Users/triley/adb/biojava-live/src/org/biojava/bio/seq/sequence" "/Users/triley/adb/biojava-live/src/org/biojava/bio/molbio")))

(defun my-jdee-mode-hook ()
  "Hook for running Java file..."
  (message "Loading my-java-hook...")
  (define-key c-mode-base-map "\C-ca" 'jdee-javadoc-generate-javadoc-template)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'statement-case-open 0)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-cont-nonempty '+)
  (c-set-offset 'case-label 0)
  (fset 'my-javadoc-code
	[?< ?c ?o ?d ?e ?>?< ?/ ?c ?o ?d ?e ?> left left left left left left left])
  (define-key c-mode-base-map "\C-cx" 'my-javadoc-code)
  (abbrev-mode t)
  (setq c-comment-continuation-stars "* "
	tab-width 4
	indent-tabs-mode nil
	tempo-interactive t
	c-basic-offset 4)
  (message "my-jdee-mode-hook function executed")
)
(add-hook 'jdee-mode-hook 'my-jdee-mode-hook)


(autoload 'dictionary-search "dictionary"
  "Ask for a word and search it in all dictionaries" t)
(autoload 'dictionary-match-words "dictionary"
  "Ask for a word and search all matching words in the dictionaries" t)
(autoload 'dictionary-lookup-definition "dictionary"
  "Unconditionally lookup the word at point." t)
(autoload 'dictionary "dictionary"
  "Create a new dictionary buffer" t)
(autoload 'dictionary-mouse-popup-matching-words "dictionary"
  "Display entries matching the word at the cursor" t)
(autoload 'dictionary-popup-matching-words "dictionary"
  "Display entries matching the word at the point" t)
(autoload 'dictionary-tooltip-mode "dictionary"
  "Display tooltips for the current word" t)
(autoload 'global-dictionary-tooltip-mode "dictionary"
  "Enable/disable dictionary-tooltip-mode for all buffers" t)

(global-set-key "\C-cs" 'dictionary-search)
(global-set-key "\C-cm" 'dictionary-match-words)

; Get rid of ^M at the end of the command
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)


(setq kill-emacs-query-functions
      (cons (lambda () (yes-or-no-p "Really kill Emacs? "))
            kill-emacs-query-functions))



;;; So ESS can find Rterm
(setq inferior-R-program-name "/Library/Frameworks/R.framework/Versions/3.0/Resources/bin/R")

;; -----------------------------------------------------------------
;; AUC TeX
(let ((my-path (expand-file-name "/usr/local/bin:/usr/local/texlive/2015/bin/x86_64-darwin")))
    (setenv "PATH" (concat my-path ":" (getenv "PATH")))
    (add-to-list 'exec-path my-path))

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "<S-s-mouse-1>") #'TeX-view))
          )

(server-start); start emacs in server mode so that skim can talk to it


;; -----------------------------------------------------------------
(one-buffer-one-frame-mode 0)
(setq ns-pop-up-frames nil)
(setq pop-up-frames nil)
(desktop-save-mode 0)

(put 'upcase-region 'disabled nil)


(put 'downcase-region 'disabled nil)

(turn-off-auto-fill)
;; ...or (auto-fill-mode -1)
(remove-hook 'text-mode-hook 'turn-off-auto-fill)

(global-set-key [(control shift \g)] 'goto-line)

(load-file "~/.emacs.d/lisp/csv-mode.el")
(setq csv-separators '("," "\t"))

;; (require 'exec-path-from-shell)
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

(custom-set-variables
 '(show-trailing-whitespace t)
 '(jdee-read-compile-args t)
 )
