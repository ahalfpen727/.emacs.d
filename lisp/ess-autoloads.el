;;; ess-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "ess" "ess.el" (23849 61180 257619 406000))
;;; Generated autoloads from ess.el

(autoload 'ess-version "ess" "\
Return a string with ESS version information.

\(fn)" t nil)

(autoload 'ess-submit-bug-report "ess" "\
Submit a bug report to the ESS maintainers.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "ess-bugs-d" "ess-bugs-d.el" (23849 61180 245619
;;;;;;  350000))
;;; Generated autoloads from ess-bugs-d.el

(autoload 'ess-bugs-mode "ess-bugs-d" "\
Major mode for BUGS.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.[Bb][Uu][Gg]\\'" . ess-bugs-mode))

(add-to-list 'auto-mode-alist '("\\.[Bb][Oo][Gg]\\'" . ess-bugs-mode))

(add-to-list 'auto-mode-alist '("\\.[Bb][Mm][Dd]\\'" . ess-bugs-mode))

;;;***

;;;### (autoloads nil "ess-custom" "ess-custom.el" (23849 61180 249619
;;;;;;  369000))
;;; Generated autoloads from ess-custom.el

(defvar ess-lisp-directory (file-name-directory (or load-file-name buffer-file-name)) "\
Directory containing ess-site.el(c) and other ESS Lisp files.")

(custom-autoload 'ess-lisp-directory "ess-custom" t)

(add-to-list 'load-path ess-lisp-directory)

(add-to-list 'load-path (file-name-as-directory (expand-file-name "obsolete" ess-lisp-directory)))

(put 'ess-indent-offset 'safe-local-variable #'numberp)

(put 'ess-style 'safe-local-variable #'symbolp)

;;;***

;;;### (autoloads nil "ess-gretl" "ess-gretl.el" (23849 61180 249619
;;;;;;  369000))
;;; Generated autoloads from ess-gretl.el

(autoload 'ess-gretl-mode "ess-gretl" "\
Major mode for editing gretl source.  See `ess-mode' for more help.

\(fn)" t nil)

(autoload 'gretl "ess-gretl" "\
Call 'gretl',
Optional prefix (C-u) allows to set command line arguments, such as
--vsize.  This should be OS agnostic.
If you have certain command line arguments that should always be passed
to gretl, put them in the variable `inferior-gretl-args'.

\(fn &optional START-ARGS)" t nil)

;;;***

;;;### (autoloads nil "ess-help" "ess-help.el" (23849 61180 249619
;;;;;;  369000))
;;; Generated autoloads from ess-help.el

(autoload 'ess-display-help-on-object "ess-help" "\
Display documentation for OBJECT.
If prefix arg is given, force an update of the cached help topics
and query the ESS process for the help file instead of reusing an
existing buffer if it exists. Uses the variable
`inferior-ess-help-command' for the actual help command. Prompts
for the object name based on the cursor location for all cases
except the S-Plus GUI. With S-Plus on Windows (both GUI and in an
inferior Emacs buffer) the GUI help window is used. If COMMAND is
suplied, it is used instead of `inferior-ess-help-command'.

\(fn OBJECT &optional COMMAND)" t nil)

(defalias 'ess-help 'ess-display-help-on-object)

(autoload 'ess-goto-info "ess-help" "\
Display node NODE from `ess-mode' info.

\(fn NODE)" nil nil)

;;;***

;;;### (autoloads nil "ess-inf" "ess-inf.el" (23849 61180 249619
;;;;;;  369000))
;;; Generated autoloads from ess-inf.el

(autoload 'ess-load-file "ess-inf" "\
Load FILENAME into an inferior ESS process.
This handles Tramp when working on a remote.

\(fn &optional FILENAME)" t nil)

;;;***

;;;### (autoloads nil "ess-jags-d" "ess-jags-d.el" (23849 61180 249619
;;;;;;  369000))
;;; Generated autoloads from ess-jags-d.el

(autoload 'ess-jags-mode "ess-jags-d" "\
Major mode for JAGS.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.[Jj][Aa][Gg]\\'" . ess-jags-mode))

;;;***

;;;### (autoloads nil "ess-julia" "ess-julia.el" (23849 61180 249619
;;;;;;  369000))
;;; Generated autoloads from ess-julia.el

(autoload 'ess-julia-mode "ess-julia" "\
Major mode for julia files.

\(fn)" t nil)

(autoload 'run-ess-julia "ess-julia" "\
Start an inferior julia process.
Optional prefix START-ARGS (\\[universal-argument]) allows to set
command line arguments, such as --load=<file>. This should be OS
agnostic. If you have certain command line arguments that should
always be passed to julia, put them in the variable
`inferior-julia-args'.

\(fn &optional START-ARGS)" t nil)

(defalias 'julia #'run-ess-julia)

;;;***

;;;### (autoloads nil "ess-mode" "ess-mode.el" (23849 61180 249619
;;;;;;  369000))
;;; Generated autoloads from ess-mode.el

(autoload 'ess-mode "ess-mode" "\
Major mode for editing ESS source.
Optional arg ALIST describes how to customize the editing mode.
Optional arg PROC-NAME is name of associated inferior process.

\\{ess-mode-map}

You can send text to the inferior ESS process from other buffers containing
ESS source.
    `ess-eval-region' sends the current region to the ESS process.
    `ess-eval-buffer' sends the current buffer to the ESS process.
    `ess-eval-function' sends the current function to the ESS process.
    `ess-eval-line' sends the current line to the ESS process.
    `ess-switch-to-ESS' switches the current buffer to the ESS process buffer.
    `ess-switch-to-end-of-ESS' switches the current buffer to the ESS process
        buffer and puts point at the end of it.

    `ess-eval-region-and-go', `ess-eval-buffer-and-go',
        `ess-eval-function-and-go', and `ess-eval-line-and-go' switch to the S
        process buffer after sending their text.

    `ess-load-file' sources a file of commands to the ESS process.

\\[ess-indent-command] indents for ESS code.
\\[backward-delete-char-untabify] converts tabs to spaces as it moves back.
Comments are indented in a similar way to Emacs-lisp mode:
       `###'     beginning of line
       `##'      the same level of indentation as the code
       `#'       the same column on the right, or to the right of such a
                 column if that is not possible.(default value 40).
                 \\[indent-for-comment] command automatically inserts such a
                 `#' in the right place, or aligns such a comment if it is
                 already inserted.
\\[ess-indent-exp] command indents each line of the syntactic unit following point.

Variables controlling indentation style:
 `ess-indent-offset'
    Indentation of ESS statements within surrounding block.
    The surrounding block's indentation is the indentation of the line on
    which the open-brace appears.
 `ess-offset-block'
    Indentation of blocks opened with curly braces or anonymous parentheses.
 `ess-offset-arguments'
    Indentation of function arguments or bracket indices.
 `ess-offset-arguments-newline'
    Indentation of function arguments or bracket indices when the opening
    delimiter is immediately followed by a newline.
 `ess-offset-continued'
    Indentation style for continued statements.
 `ess-align-nested-calls'
    Functions whose nested calls should be aligned.
 `ess-align-arguments-in-calls'
    Calls in which arguments should be aligned.
 `ess-align-continuations-in-calls'
    Whether ignore indentation after an operator in calls
 `ess-align-blocks'
    Blocks that should always be aligned vertically.
 `ess-indent-from-lhs'
    Whether function calls given as argument should be indented from the
    parameter name.
 `ess-indent-from-chain-start'
    Whether to indent arguments from the first of several consecutive calls.
 `ess-indent-with-fancy-comments'
    Non-nil means distinguish between #, ##, and ### for indentation.

Furthermore, \\[ess-set-style] command enables you to set up predefined ess-mode
indentation style. See `ess-style-alist' for predefined styles.

\(fn)" t nil)

(autoload 'ess-dump-object-into-edit-buffer "ess-mode" "\
Edit an ESS OBJECT in its own buffer.
Without a prefix argument, this simply finds the file pointed to by
`ess-source-directory'.  If this file does not exist, or if a
prefix argument is given, a dump() command is sent to the ESS process to
generate the source buffer.

\(fn OBJECT)" t nil)

;;;***

;;;### (autoloads nil "ess-r-mode" "ess-r-mode.el" (23849 61180 249619
;;;;;;  369000))
;;; Generated autoloads from ess-r-mode.el

(defvar ess-dev-map (let (ess-dev-map) (define-prefix-command 'ess-dev-map) (define-key ess-dev-map "" #'ess-r-set-evaluation-env) (define-key ess-dev-map "s" #'ess-r-set-evaluation-env) (define-key ess-dev-map "T" #'ess-toggle-tracebug) (define-key ess-dev-map "\f" #'ess-r-devtools-load-package) (define-key ess-dev-map "l" #'ess-r-devtools-load-package) (define-key ess-dev-map "`" #'ess-show-traceback) (define-key ess-dev-map "~" #'ess-show-call-stack) (define-key ess-dev-map "" #'ess-watch) (define-key ess-dev-map "w" #'ess-watch) (define-key ess-dev-map "" #'ess-debug-flag-for-debugging) (define-key ess-dev-map "d" #'ess-debug-flag-for-debugging) (define-key ess-dev-map "" #'ess-debug-unflag-for-debugging) (define-key ess-dev-map "u" #'ess-debug-unflag-for-debugging) (define-key ess-dev-map "" #'ess-debug-unflag-for-debugging) (define-key ess-dev-map "" #'ess-bp-set) (define-key ess-dev-map "b" #'ess-bp-set) (define-key ess-dev-map "" #'ess-bp-set-conditional) (define-key ess-dev-map "B" #'ess-bp-set-conditional) (define-key ess-dev-map "\f" #'ess-bp-set-logger) (define-key ess-dev-map "L" #'ess-bp-set-logger) (define-key ess-dev-map "" #'ess-bp-toggle-state) (define-key ess-dev-map "o" #'ess-bp-toggle-state) (define-key ess-dev-map "" #'ess-bp-kill) (define-key ess-dev-map "k" #'ess-bp-kill) (define-key ess-dev-map "" #'ess-bp-kill-all) (define-key ess-dev-map "K" #'ess-bp-kill-all) (define-key ess-dev-map "" #'ess-bp-next) (define-key ess-dev-map "n" #'ess-bp-next) (define-key ess-dev-map "i" #'ess-debug-goto-input-event-marker) (define-key ess-dev-map "I" #'ess-debug-goto-input-event-marker) (define-key ess-dev-map "" #'ess-bp-previous) (define-key ess-dev-map "p" #'ess-bp-previous) (define-key ess-dev-map "" #'ess-debug-toggle-error-action) (define-key ess-dev-map "e" #'ess-debug-toggle-error-action) (define-key ess-dev-map "0" #'ess-electric-selection) (define-key ess-dev-map "1" #'ess-electric-selection) (define-key ess-dev-map "2" #'ess-electric-selection) (define-key ess-dev-map "3" #'ess-electric-selection) (define-key ess-dev-map "4" #'ess-electric-selection) (define-key ess-dev-map "5" #'ess-electric-selection) (define-key ess-dev-map "6" #'ess-electric-selection) (define-key ess-dev-map "7" #'ess-electric-selection) (define-key ess-dev-map "8" #'ess-electric-selection) (define-key ess-dev-map "9" #'ess-electric-selection) (define-key ess-dev-map "?" #'ess-tracebug-show-help) ess-dev-map) "\
Keymap for commands related to development and debugging.")

(autoload 'run-ess-r "ess-r-mode" "\
Call 'R', the 'GNU S' system from the R Foundation.
Optional prefix (\\[universal-argument]) allows to set command line arguments, such as
--vsize.  This should be OS agnostic.
If you have certain command line arguments that should always be passed
to R, put them in the variable `inferior-R-args'.

START-ARGS can be a string representing an argument, a list of
such strings, or any other non-nil value.  In the latter case, you
will be prompted to enter arguments interactively.

\(fn &optional START-ARGS)" t nil)

(defalias 'R #'run-ess-r)

(autoload 'ess-r-mode "ess-r-mode" "\
Major mode for editing R source.  See `ess-mode' for more help.

\(fn)" t nil)

(defalias 'R-mode 'ess-r-mode)

(defalias 'r-mode 'ess-r-mode)

(add-to-list 'auto-mode-alist '("/R/.*\\.q\\'" . ess-r-mode))

(add-to-list 'auto-mode-alist '("\\.[rR]\\'" . ess-r-mode))

(add-to-list 'auto-mode-alist '("\\.[rR]profile\\'" . ess-r-mode))

(add-to-list 'auto-mode-alist '("NAMESPACE\\'" . ess-r-mode))

(add-to-list 'auto-mode-alist '("CITATION\\'" . ess-r-mode))

(autoload 'ess-r-transcript-mode "ess-r-mode" "\
A Major mode for R transcript files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.[Rr]out" . ess-r-transcript-mode))

(add-to-list 'interpreter-mode-alist '("Rscript" . ess-r-mode))

(add-to-list 'interpreter-mode-alist '("r" . ess-r-mode))

(defvar ess-rutils-map (let ((map (define-prefix-command 'ess-rutils-map))) (define-key map "l" #'ess-r-package-list-local-packages) (define-key map "r" #'ess-r-package-list-available-packages) (define-key map "u" #'ess-r-package-update-packages) (define-key map "o" #'ess-rdired) (define-key map "d" #'ess-change-directory) (define-key map "H" #'ess-rutils-html-docs) map))

(autoload 'ess-r-package-list-local-packages "ess-r-mode" "\
List all packages in all libraries.

\(fn)" t nil)

(autoload 'ess-r-package-list-available-packages "ess-r-mode" "\
List available packages.
Use the repositories as listed by getOptions(\"repos\") in the
current R session.

\(fn)" t nil)

(autoload 'ess-r-package-update-packages "ess-r-mode" "\
Update packages in library LIB and repo REPO.
This also uses checkBuilt=TRUE to rebuild installed packages if
needed.

\(fn LIB REPO)" t nil)

(add-to-list 'auto-mode-alist '("/Makevars\\(\\.win\\)?$" . makefile-mode))

(add-to-list 'auto-mode-alist '("DESCRIPTION$" . conf-colon-mode))

;;;***

;;;### (autoloads nil "ess-rd" "ess-rd.el" (23849 61180 253619 388000))
;;; Generated autoloads from ess-rd.el

(autoload 'Rd-mode "ess-rd" "\
Major mode for editing R documentation source files.

Type \\[list-abbrevs] to display the built-in abbrevs for Rd
keywords.To automatically turn on the abbrev(iate) features, add
the following to your Emacs configuration file:

  (add-hook 'Rd-mode-hook #'abbrev-mode)

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.Rd\\'" . Rd-mode))

;;;***

;;;### (autoloads nil "ess-rdired" "ess-rdired.el" (23849 61180 253619
;;;;;;  388000))
;;; Generated autoloads from ess-rdired.el

(autoload 'ess-rdired "ess-rdired" "\
Show R objects from the global environment in a separate buffer.
You may interact with these objects, see `ess-rdired-mode' for
details.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "ess-roxy" "ess-roxy.el" (23849 61180 253619
;;;;;;  388000))
;;; Generated autoloads from ess-roxy.el

(autoload 'ess-roxy-mode "ess-roxy" "\
Minor mode for editing ROxygen documentation.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "ess-s-lang" "ess-s-lang.el" (23849 61180 253619
;;;;;;  388000))
;;; Generated autoloads from ess-s-lang.el

(add-to-list 'auto-mode-alist '("\\.[Ss]t\\'" . S-transcript-mode))

(add-to-list 'auto-mode-alist '("\\.Sout" . S-transcript-mode))

;;;***

;;;### (autoloads nil "ess-sas-d" "ess-sas-d.el" (23849 61180 253619
;;;;;;  388000))
;;; Generated autoloads from ess-sas-d.el

(autoload 'SAS-mode "ess-sas-d" "\
Major mode for editing SAS source.  See `ess-mode' for more help.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.[Ss][Aa][Ss]\\'" . SAS-mode))

(autoload 'SAS-menu "ess-sas-d" "\
Start SAS from the menu.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "ess-sp6-d" "ess-sp6-d.el" (23849 61180 253619
;;;;;;  388000))
;;; Generated autoloads from ess-sp6-d.el

(autoload 'S+-mode "ess-sp6-d" "\
Major mode for editing S+ source.  See `ess-mode' for more help.

\(fn &optional PROC-NAME)" t nil)

;;;***

;;;### (autoloads nil "ess-stata-mode" "ess-stata-mode.el" (23849
;;;;;;  61180 253619 388000))
;;; Generated autoloads from ess-stata-mode.el

(autoload 'ess-stata-mode "ess-stata-mode" "\
Major mode for editing Stata source.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.do\\'" . ess-stata-mode))

(add-to-list 'auto-mode-alist '("\\.ado\\'" . ess-stata-mode))

;;;***

;;;### (autoloads nil "ess-trns" "ess-trns.el" (23849 61180 257619
;;;;;;  406000))
;;; Generated autoloads from ess-trns.el

(autoload 'ess-transcript-mode "ess-trns" "\
Major mode for transcript files.

Type \\[ess-transcript-send-command] to send a command in the
transcript to the current inferior process. \\[ess-transcript-copy-command]
copies the command but does not execute it, allowing you to edit it in
the process buffer first.

Type \\[ess-transcript-clean-region] to delete all outputs and prompts
in the region, leaving only the commands.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "essd-els" "essd-els.el" (23849 61180 257619
;;;;;;  406000))
;;; Generated autoloads from essd-els.el

(autoload 'ess-remote "essd-els" "\
Execute this command from within a buffer running a process.
It runs `ess-add-ess-process' to add the PROC-NAME to
`ess-process-name-alist' and to make it the
`ess-current-process-name'. It then prompts the user for an ESS
language and sets the editing characteristics appropriately.

To use this command, first start a process on a remote computer by
manual use of telnet, rlogin, ssh, or some other protocol.  Start the
relevant program (\"S\" or \"R\" or \"sas -stdio\") in that buffer.  Once
you are talking to S or R or SAS, then do \\[ess-remote] to make
the current buffer an inferior-ess buffer with the right behavior for
the language you are currently working with.  With S and R, use C-c
C-n to send lines over.  With SAS, use C-c i
`ess-eval-line-and-step-invisibly' to send lines over invisibly.

DIALECT is the desired ess-dialect. If nil, ask for dialect

\(fn &optional PROC-NAME DIALECT)" t nil)

;;;***

;;;### (autoloads nil "julia-mode" "julia-mode.el" (23849 61189 297661
;;;;;;  939000))
;;; Generated autoloads from julia-mode.el

(add-to-list 'auto-mode-alist '("\\.jl\\'" . julia-mode))

(autoload 'julia-mode "julia-mode" "\
Major mode for editing julia code.

\(fn)" t nil)

(autoload 'inferior-julia "julia-mode" "\
Run an inferior instance of `julia' inside Emacs.

\(fn)" t nil)

(defalias 'run-julia #'inferior-julia "\
Run an inferior instance of `julia' inside Emacs.")

;;;***

;;;### (autoloads nil "mouseme" "mouseme.el" (23849 61180 257619
;;;;;;  406000))
;;; Generated autoloads from mouseme.el

(autoload 'mouse-me "mouseme" "\
Popup a menu of functions to run on selected string or region.

\(fn EVENT)" t nil)

;;;***

;;;### (autoloads nil nil ("ess-bugs-l.el" "ess-mouse.el" "ess-r-completion.el"
;;;;;;  "ess-r-flymake.el" "ess-r-package.el" "ess-r-syntax.el" "ess-r-xref.el"
;;;;;;  "ess-rutils.el" "ess-sas-a.el" "ess-sas-l.el" "ess-site.el"
;;;;;;  "ess-stata-lang.el" "ess-toolbar.el" "ess-tracebug.el" "ess-utils.el"
;;;;;;  "julia-latexsubs.el" "make-regexp.el") (23849 61189 517662
;;;;;;  974000))

;;;***

(provide 'ess-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ess-autoloads.el ends here
