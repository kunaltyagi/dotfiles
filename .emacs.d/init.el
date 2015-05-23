
;;; -*- mode: Emacs-Lisp -*-
;;; Emacs version: 24.4


;;;;;;;;;;;;;;;;;;;;;;;;;;; Appearance and Editing ;;;;;;;;;;;;;;;;;;;;;;

;; Set this to 'dark if your background is black
(setq frame-background-mode 'light)

;;; Set the editing mode for *scratch* buffer to text (it's Lisp per default)
(setq initial-major-mode 'text-mode)

;;; Set the mode for buffers with unknown mode to text
;;; previously DEFAULT-MAJOR-MODE in emacs23
(setq major-mode 'text-mode)

;;; Highlight the opening / closing brackets
(show-paren-mode t)

;;; Default tab and indentation width
(setq default-tab-width 2)
(setq standard-indent 2)

;;; Display the column in the status (mode part)
(column-number-mode t)

;;; Don't use tabs for whitespace while indenting
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;;; No menu bar and toolbar on the top of emacs
;;; I kind of like the menu bar right now, so it will stay.
;;; (menu-bar-mode -1)
(tool-bar-mode -1)

;;; Highlight and overwrite selected regions (CUA mode)
;;; new in emacs24
(cua-mode 1)
(setq cua-enable-cua-keys nil)
(setq cua-enable-modeline-indications t)
(setq cua-remap-control-v nil)
(setq cua-remap-control-z nil)

;;; Enable editing in columns: C-x C-n (enable) and C-u C-x C-n (disable)
(put 'set-goal-column 'disabled nil)

;; Enable narrowing of pages: C-x n p (narrow) and C-x n w (widen)
(put 'narrow-to-page 'disabled nil)

;;; Editing code in different programming languages. Emacs major modes.
;;; Lisp specific things are in the bottom of the file.
(autoload 'c++-mode  "cc-mode" "C++ Editing Mode" t)
(autoload 'c-mode    "cc-mode" "C Editing Mode"   t)
(autoload 'xrdb-mode "xrdb-mode" "Mode for editing X resource files" t)
(autoload 'yaml-mode "yaml-mode" "Mode for editing YAML files" t)
(autoload 'rnc-mode "rnc-mode" "Relax NG editing mode (XML related)" t)
(autoload 'cmake-mode "cmake-mode" "CMake related files editing mode" t)
(setq auto-mode-alist
      (append '(("\\.C$"       . c++-mode)
                ("\\.cc$"      . c++-mode)
                ("\\.c$"       . c-mode)
                ("\\.h$"       . c++-mode)
                ("\\.i$"       . c++-mode)
                ("\\.ii$"      . c++-mode)
                ("\\.m$"       . objc-mode)
                ("\\.pl$"      . prolog-mode)
                ("\\.sql$"     . c-mode)
                ("\\.sh$"      . shell-script-mode)
                ("\\.mak$"     . makefile-mode)
                ("\\.GNU$"     . makefile-mode)
                ("makefile$"   . makefile-mode)
                ("Makefile$"   . makefile-mode)
                ("Imakefile$"  . makefile-mode)
                ("\\.Xdefaults$"    . xrdb-mode)
                ("\\.Xenvironment$" . xrdb-mode)
                ("\\.Xresources$"   . xrdb-mode)
                ("*.\\.ad$"         . xrdb-mode)
                ("\\.[eE]?[pP][sS]$" . ps-mode)
                ("\\.nsp"      . lisp-mode)
                ("\\.asd"      . lisp-mode)
                ("\\.vimpulse" . lisp-mode)
                ("\\.cl$"      . lisp-mode)
                (".sbclrc" . lisp-mode)
                (".xcvb" . lisp-mode)
                ("PKGBUILD" . sh-mode)
                ("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode)
                ("\\.yml\\'" . yaml-mode)
                ("\\.yaml\\'" . yaml-mode)
                ("\\.rnc\\'" . rnc-mode))
              auto-mode-alist))

;; (setq rnc-enable-flymake t)

;;; Spell checker
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))
(dolist (hook '(lisp-mode-hook c++-mode-hook python-mode-hook))
  (add-hook hook (lambda () (flyspell-prog-mode))))


;;;;;;;;;;;;;;;;;;;;;;;;;;; Key Bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Fix for the DEL key that acts like BACKSPACE on some machines
(global-set-key '[delete] 'delete-char)

;;; Use regexp search per default.
;;; Swap regexp and normal search key bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-%") 'query-replace)

;;; Disable iconification bindings, they are annoying
(global-unset-key "\C-z")
(global-unset-key "\C-x\C-z")

;;; Moving through windows faster
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)


;;;;;;;;;;;;;;;;;;;;;;;;;;; Features ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Emacs should always ask for confirmation on exit
(setq confirm-kill-emacs 'yes-or-no-p)

;;; Enable copy-pasting between programs (Kill-ring <-> x11)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;; Start emacs server for emacsclient
(server-start)

;;; Disable recursive minibuffers
(setq minibuffer-max-depth nil)

;;; Scrolling is too agressive in emacs.
(setq scroll-step 1) ; sets the keyboard scrolling step
(setq scroll-margin 1) ; sets the margin for keyboard scrolling
(setq scroll-conservatively 5) ; centers the window on the point conservatively

;;; Turn off the startup screen
(setq inhibit-startup-screen t)

;;; *scratch* should be empty on startup
(setq initial-scratch-message nil)

;;; Don't clutter the directories with *~ backup files
;;; and automatically overwrite them up to a number of backup versions
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/emacs-file-backups"))))
(setq delete-old-versions t)
(setq version-control t)
(setq kept-new-versions 3)
(setq kept-old-versions 3)

;;; Don't automatically save the window configuration.
;;; Use M-x desktop-save and M-x desktop-clear instead.
(setq desktop-save-mode nil)

;;; Enable undo on window configuration: C-c left (undo) and C-c right (redo)
(winner-mode)

;;; Set the default browser to open URLs
;;; Soon we should switch to eww, but for now let's keep the default.
;;; (setq browse-url-browser-function (quote browse-url-default-browser))

;;; Enable tooltips: bubbles with help text
(gud-tooltip-mode t)

;;; Enable autocompletion suggestions for minibuffer
(icomplete-mode 1)

;;; When opening Lisp files, don't ask if the variables are safe for this list.
;;; These are the variables from slime.
(setq safe-local-variable-values
      (quote ((TeX-PDF . t) (readtable . nisp) (readtable . :nisp)
              (Package . NISP) (Syntax . Common-Lisp) (Package . SAX)
              (Encoding . utf-8) (Syntax . COMMON-LISP) (Package . CL-PPCRE)
              (package . rune-dom) (readtable . runes)
              (Syntax . ANSI-Common-Lisp) (Base . 10) (lexical-binding . t))))


;;;;;;;;;;;;;;;;;;;;;;;;;; Packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; All the packages should go into the PACKAGES directory.
;;; Let emacs know about it.
(add-to-list 'load-path "~/.emacs.d/packages")

;;; Yasnippets: templates for standard structures. E.g. bsd TAB.
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
(yas-global-mode 1)

;;; Whitespace highlights lines longer than 80 characters and similar.
;;; It is included in emacs23 or later.
(require 'whitespace)
(setq whitespace-style '(face trailing lines-tail indentation::space))
(setq whitespace-line-column 80)
(setq whitespace-indentation nil)
(global-whitespace-mode 1)
(set-face-attribute 'whitespace-line nil
                    :foreground "#880"
                    :background nil
                    :weight 'bold)
(set-face-attribute 'whitespace-trailing nil
                    :background "#FDD")

;;; Autocomplete in the minibuffer for filenames etc.
(require 'ido)
(ido-mode 'both)
(ido-everywhere 1)
(setq ido-completion-buffer-all-completions t)
(setq ido-auto-merge-delay-time 2)
(setq ido-default-buffer-method (quote selected-window))
(setq ido-default-file-method (quote samewindow))
(setq ido-enable-dot-prefix t)
(setq ido-enable-flex-matching t)
(setq ido-max-window-height 5)
(setq ido-read-file-name-as-directory-commands (quote (find-dired)))
(setq ido-show-dot-for-dired t)
(setq ido-use-filename-at-point (quote guess))
(setq ido-use-url-at-point t)

;;; When working with rectangles, highlight them
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)
(autoload 'rm-mouse-drag-region "rect-mark"
  "Drag out a rectangular region with the mouse." t)
(define-key ctl-x-map "r\C-@" 'rm-set-mark)
(define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
(define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
(define-key ctl-x-map "r\C-w" 'rm-kill-region)
(define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
(define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)


;;;;;;;;;;;;;;;;;;;;;;;;;; Lisp specific ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Adjust the indentation for MAKE-INSTANCE
(put 'make-instance 'common-lisp-indent-function '(4 &rest 2))

;;; Paredit mode for editing lisp code.
;;; Automatically generates closing parenthesis, enforces correct code structure.
;;; It is autoloaded in case one opens emacs without intending to program Lisp.
(autoload 'paredit-mode "paredit" "Pseudo-structural Lisp editing mode." t)
(add-hook 'emacs-lisp-mode-hook                  #'paredit-mode)
(add-hook 'lisp-mode-hook                        #'paredit-mode)
(add-hook 'inferior-lisp-mode-hook               #'paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)
(add-hook 'ielm-mode-hook                        #'paredit-mode)
(add-hook 'lisp-interaction-mode-hook            #'paredit-mode)
(add-hook 'scheme-mode-hook                      #'paredit-mode)
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "<M-left>") 'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "<M-right>") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "<C-left>") 'backward-word)
     (define-key paredit-mode-map (kbd "<C-right>") 'forward-word)))


;;;;;;;;;;;;;;;;;;;;;;;;;; ROS and SLIME specific ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (require 'slime-config "/opt/ros/indigo/share/slime_ros/slime-config.el")
(require 'slime-config "/home/kunaltyagi/workspace/ros_lisp/install/share/slime_ros/slime-config.el")

(setq inferior-lisp-program "/usr/bin/sbcl --dynamic-space-size 4096")

(setq ros-completion-function (quote ido-completing-read))
(setq slime-startup-animation nil)
(setq slime-kill-without-query-p t)
(setq slime-repl-history-file "~/.emacs.d/.slime-history.eld")
(setq slime-repl-history-size 2000)
(setq slime-repl-only-save-lisp-buffers nil)
(setq slime-ros-completion-function (quote ido-completing-read))
(add-hook 'slime-mode-hook (lambda () (slime-highlight-edits-mode 0)))

(when (file-exists-p "/home/kunaltyagi/workspace/ros_lisp/hyperspec")
  ;; the last slash in the following is crucial
  (setq common-lisp-hyperspec-root "file:/home/kunaltyagi/workspace/ros_lisp/hyperspec/"))

(eval-after-load 'slime
  '(progn
     ;; Fix for M-, when using it with dired and A
     (define-key slime-mode-map (kbd "M-,")
       (lambda ()
         (interactive)
         (condition-case nil
             (slime-pop-find-definition-stack)
           (error (tags-loop-continue)))))
     (global-set-key "\C-cs" 'slime-selector)
     (define-key slime-repl-mode-map (kbd "C-M-<backspace>")
       'slime-repl-delete-current-input)
     (define-key slime-mode-map "\r" 'newline-and-indent)
     (define-key slime-mode-map [tab]
       (lambda ()
         (interactive)
         (let ((yas-fallback-behavior nil))
           (unless (yas-expand)
             (slime-fuzzy-indent-and-complete-symbol)))))
     (define-key slime-mode-map (kbd "M-a")
       (lambda ()
         (interactive)
         (let ((ppss (syntax-ppss)))
           (if (nth 3 ppss)
               (goto-char (1+ (nth 8 ppss)))
             (progn
               (backward-up-list 1)
               (down-list 1))))))
     (define-key slime-mode-map (kbd "M-e")
       (lambda ()
         (interactive)
         (let ((ppss (syntax-ppss)))
           (if (nth 3 ppss)
               (progn
                 (goto-char (nth 8 ppss))
                 (forward-sexp 1)
                 (backward-char 1))
             (progn
               (up-list 1)
               (backward-down-list 1))))))))

;;; [ and ] should be handled paranthesis-like in lisp files.
(modify-syntax-entry ?\[ "(]  " lisp-mode-syntax-table)
(modify-syntax-entry ?\] ")[  " lisp-mode-syntax-table)

;;; Global key bindings
(global-set-key "\C-cl" 'slime)
(global-set-key "\C-cf"
                '(lambda ()
                   (interactive)
                   (slime-quit-lisp)))
(put 'upcase-region 'disabled nil)
