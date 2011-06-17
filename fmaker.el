;; Colors
(set-face-background 'default "black")
(set-face-foreground 'default "green")

;; Green on Black
(set-background-color "black")
(set-foreground-color "green")
(set-cursor-color "green")

;; Font
;;(set-face-attribute 'default nil :height 85)
(set-default-font "Monospace:pixelsize=12")

;; Set the debug option to enable a backtrace when a
;; problem occurs.
(setq debug-on-error t)

;; General Settings
(setq visible-bell t) ;; Disable audible bell
(setq require-final-newline t)    ;; will make the last line end in a carriage return.
(fset 'yes-or-no-p 'y-or-n-p)     ;; will allow you to type just "y" instead of "yes" when you exit.
(setq next-line-add-newlines nil) ;; will disallow creation of new lines when you press the "arrow-down key" at end of the buffer.
(setq-default indent-tabs-mode nil) ;; will introduce spaces instead of tabs by default.
(transient-mark-mode t) ;; will highlight region between point and mark.
(setq font-lock-maximum-decoration t) ;; denotes our interest in maximum possible fontification.

;; Close all buffers
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; Comment region
(global-set-key "\C-c\C-c" 'comment-region)

;; Replace string
(global-set-key (kbd "s-r") 'replace-string)

;; Cut and Paste from X11
;;(setq x-select-enable-clipboard t)
;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
;;(global-set-key (kbd "s-r") 'clipboard-yank)

;; Magit
(global-set-key (kbd "s-g") 'magit-status)

;; Make
(global-set-key (kbd "s-b") 'compile)

;; Quick switch between .c and .h
;; (add-hook 'c-mode-common-hook
;;   (lambda() 
;;     (local-set-key  (kbd "C-tab") 'ff-find-other-file)))

;; Marmalade
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; C style
(c-toggle-auto-newline 1)
(setq-default indent-tabs-mode nil) ;; replace tabs with spaces
(setq c-set-style "Linux")


;;mode-compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)


;; Colors
(set-face-background 'default "black")
(set-face-foreground 'default "green")

;; Green on Black
(set-background-color "black")
(set-foreground-color "green")
(set-cursor-color "green")

;; Alternatives for Alt-M
;;(global-set-key "\C-x\C-m" 'execute-extended-command)
;;(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Hilight current line
(global-hl-line-mode 1)

;; Ctags generation function
(setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name)))
  )

;; XCscope
(require 'xcscope)

;; Better window movement
(global-set-key (kbd "s-b") 'windmove-left)
(global-set-key (kbd "s-f") 'windmove-right)
(global-set-key (kbd "s-n") 'windmove-down)
(global-set-key (kbd "s-p") 'windmove-up)

;; Goto line
(global-set-key (kbd "s-g") 'goto-line)

;; CC-mode

;; Hook to indent 
;; (defun my-make-CR-do-indent ()
;;   (define-key c-mode-base-map "\C-m" 'c-context-line-break))
;; (add-hook 'c-initialization-hook 'my-make-CR-do-indent)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; this will make sure spaces are used instead of tabs
  (setq indent-tabs-mode nil)
  
  ;; enable minor modes
  (c-toggle-electric-state 1)
  (c-toggle-auto-hungry-state 1)
  (subword-mode 1)
  (c-toggle-syntactic-indentation 1)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Latex related
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq latex-run-command "pdflatex")
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)

(defun tex-view ()
    (interactive)
    (tex-send-command "evince" (tex-append tex-print-file ".pdf")))


