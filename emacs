(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(add-to-list 'load-path "~/.emacs.d" t)
(require 'go-mode)
(require 'go-autocomplete)

(require 'auto-complete-config)

(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.8")
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.8.2/backward")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/include")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/include")  
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
(add-hook 'before-save-hook 'gofmt-before-save)
(load-theme 'zenburn t)
