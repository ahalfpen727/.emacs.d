;;; ess-r-insert-obj-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ess-r-insert-obj" "ess-r-insert-obj.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ess-r-insert-obj.el

(autoload 'ess-r-insert-obj-dt-name "ess-r-insert-obj" "\
Insert name of data.frame-like object.

\(fn)" t nil)

(autoload 'ess-r-insert-obj-col-name "ess-r-insert-obj" "\
Insert column/variable name.

If called with a prefix, prompt for a data.frame-like object to search in.

With two \\[universal-argument] prefixes (i.e., when `current-prefix-arg' is (16)),
prompt for a data.frame-like object to search in.

\(fn)" t nil)

(autoload 'ess-r-insert-obj-col-name-all "ess-r-insert-obj" "\
Insert names of all column/variable name.

If called with a prefix, prompt for a data.frame-like object to search in.

With two \\[universal-argument] prefixes (i.e., when `current-prefix-arg' is (16)),
prompt for a data.frame-like object to search in.

\(fn)" t nil)

(autoload 'ess-r-insert-obj-value "ess-r-insert-obj" "\
Insert variable value.

If called with a prefix, prompt for a data.frame-like object or
column/variable to search in.

With a \\[universal-argument] prefix (i.e., when `current-prefix-arg' is (4)),
prompt for a column/variable object to search in.
With two \\[universal-argument] prefixes (i.e., when `current-prefix-arg' is (16)),
prompt for a data.frame-like object to search in.

\(fn)" t nil)

(autoload 'ess-r-insert-obj-value-all "ess-r-insert-obj" "\
Insert all variable values.

If called with a prefix, prompt for a data.frame-like object or
column/variable to search in.

With a \\[universal-argument] prefix (i.e., when `current-prefix-arg' is (4)),
prompt for a column/variable object to search in.
With two \\[universal-argument] prefixes (i.e., when `current-prefix-arg' is (16)),
prompt for a data.frame-like object to search in.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-r-insert-obj" '("ess-r-insert-obj-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ess-r-insert-obj-autoloads.el ends here
