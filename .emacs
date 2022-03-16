(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(blacken elpy flycheck org-superstar use-package-chords use-package-el-get use-package-ensure-system-package use-package-hydra org-bullets use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Setting up linum mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; Setting up repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://melpa.org/packages/") t)
(package-initialize)
;; If there are no archived package contents, refresh them 
(when (not package-archive-contents)
  (package-refresh-contents))

;; Org Bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))


;;packages
(defvar myPackages
  '(better-defaults   ;; set up better defaults
    flycheck ;; highlighting for proper formatting.
    blacken ;; automatic pep-8 formatting on save
    ))

(use-package elpy
  :ensure t
  :init
  (elpy-enable))
;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)
(setq elpy-rpc-python-command "python3")

;; ====================================

;; Development Setup

;; ====================================

;; Enable elpy

(elpy-enable)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
;; User-Defined init.el ends here
