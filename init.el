;; -*- lexical-binding: t; coding: utf-8; -*-

(setq custom-file "custom.el")

(setq gc-cons-threshold (* 256 1024 1024))
(setq read-process-output-max (* 1024 1024))

(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("stable-melpa" . "https://stable.melpa.org/packages/")))

(setq package-archive-priorities '(("melpa" . 0)
				   ("stable-melpa" . 1)
				   ("elpa" . 2)))

(package-refresh-contents)

(package-initialize)

(if (< emacs-major-version 29)
    (package-install 'use-package))

(use-package company
  :config (global-company-mode)
  :custom (company-backends '(company-capf
			      company-dabbrev
			      company-files))
  :ensure t)

(use-package consult
  :ensure t)

(use-package emacs
  :config (progn
	    (menu-bar-mode -1)
	    (tool-bar-mode -1)
	    (toggle-frame-fullscreen))
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :hook ((c++-mode . lsp)
	 (haskell-mode . lsp)))

(use-package lsp-ui
  :ensure t)

(use-package marginalia
  :config (marginalia-mode)
  :ensure t)

(use-package rainbow-mode
  :ensure t)

(use-package undo-tree
  :config (global-undo-tree-mode)
  :ensure t)

(use-package vertico
  :config (vertico-mode)
  :ensure t)

(load custom-file t)
