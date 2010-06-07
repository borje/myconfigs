(setq inhibit-startup-message t)

(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;; ----------------------------------------------------------------------------
;; H�r kan du st�lla in f�rgerna i Emacs. Det finns grundf�rger s�som
;; bakgrund och mark�r. Ut�ver dessa finns det �ven specifika f�rger
;; f�r programkod som man kan st�lla in f�r att underl�tta l�sningen.
;;
;; F�r att f� reda p� vilka f�rger som finns i Emacs kan man via menyn
;; 'Edit' v�lja 'Text properties' och sedan 'Display Colors'.
;; ----------------------------------------------------------------------------

(set-default-font "9x15")
(menu-bar-mode 0)
(tool-bar-mode 0)
(global-font-lock-mode t)                      ; Highlighting...
(setq font-lock-maximum-decoration t)          ; ...as much as possible...
;(setq font-lock-support-mode 'lazy-lock-mode)  ; ...in the background (?)...
;(setq lazy-lock-stealth-time 30)               ; ...after 30 seconds...
;(setq lazy-lock-stealth-verbose t)             ; ...and report doing so...
;(setq lazy-lock-defer-driven 1)                ; ...defer-driven "eventually".

;; Grundf�rger.
(set-background-color "Black")
(set-foreground-color "CornFlowerBlue")
(set-cursor-color     "White")

(set-face-background 'modeline "CornFlowerBlue")
(set-face-foreground 'modeline "White")

;; F�rger i Emacs 19.XX
;; Kodspecifika f�rger. F�r varje kodtyp anges f�ljande:
;;     (FACE FOREGROUND BACKGROUND BOLD-P ITALIC-P UNDERLINE-P)
(if (string-match "^19" emacs-version)
    (setq font-lock-face-attributes
	  '((font-lock-comment-face       "FireBrick"   nil nil t   nil)
	    (font-lock-function-name-face "Blue"        nil t   nil nil)
	    (font-lock-keyword-face       "CornFlowerBlue" nil t   nil nil)
	    (font-lock-string-face        "ForestGreen" nil nil t   nil)
	    (font-lock-type-face          "Blue"        nil nil nil nil)
	    (font-lock-variable-name-face "CornFlowerBlue" nil nil nil nil)
	    (font-lock-reference-face     "ForestGreen" nil nil nil nil))))


;; F�rger i Emacs 20.XX
(if (string-match "^20" emacs-version)
    (progn
      (custom-set-variables)
      (custom-set-faces
       '(font-lock-comment-face ((((class color) (background light))
				  (:italic t :foreground "Firebrick"))))
       '(font-lock-function-name-face ((((class color) (background light))
					(:bold t :foreground "Blue"))))
       '(font-lock-keyword-face ((((class color) (background light))
				  (:bold t :foreground "CornFlowerBlue"))))
       '(font-lock-string-face ((((class color) (background light))
				 (:italic t :foreground "ForestGreen"))))
       '(font-lock-type-face ((((class color) (background light))
			       (:foreground "Blue"))))
       '(font-lock-variable-name-face ((((class color) (background light))
					(:foreground "CornFlowerBlue"))))
       '(font-lock-reference-face ((((class color) (background light))
				    (:foreground "ForestGreen")))))))

;; ----------------------------------------------------------------------------
;; N�gra extra saker som kan vara trevliga att ha.
;; ----------------------------------------------------------------------------

;; Ser till att det alltid finns ett "RETURN" i slutet av filen ...
(setq-default require-final-newline t)

;; Hantera character med kod 128+ (t. ex. svenska vokaler)
(set-input-mode (car (current-input-mode))
                     (nth 1 (current-input-mode))
                     0)

;; Delete-knapp raderar all text i ett markerat omr�de
(delete-selection-mode t)

;; Switch CR/LF. This will make <enter> indent program code automatically.
(defun my-ada-mode-hook ()
  (setq foo (global-key-binding "\C-m"))              ; Save CR binding.
  (global-set-key "\C-m" (global-key-binding "\C-j")) ; Set CR to LF.
  (global-set-key "\C-j" foo))                        ; Set LF to old CR.
(add-hook 'ada-mode-hook 'my-ada-mode-hook)

;; "Slipper" skriva "M-x goto-line".
(define-key global-map "\C-x\C-g" 'goto-line)

;; Mappar om "Delete" s� den funkar som den "ska".
(define-key global-map '[delete] 'delete-char)

;; "Ctrl-RET" f�r att fylla ut ett ord (ungef�r som "TAB" i skalf�nstret).
(global-set-key '[(control return)] 'dabbrev-expand)

(global-set-key '[f7] 'recompile)
;; Invertera markerat omr�de
(transient-mark-mode t)

;; Markera matchande parenteser
(show-paren-mode 1)

;; Se till att man inte kan g� l�ngre ner i filen �n till sista raden
;; G�r att man inte f�r en massa tomma rader i slutet av filen
(setq next-line-add-newlines nil)

;; G�r s� att man endast "scrollar" en rad i taget n�r man g�r upp�t
;; och ner�t
(setq scroll-step 1)
(setq scroll-conservatively 1)

;; Se till att vi h�ller reda p� vilken rad och position p� rad vi
;; befinner oss p�.
(setq line-number-mode t)
(setq column-number-mode t)

;; Smart "byta buffer"-hantering
(iswitchb-mode t)

;; Auto-complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete)
(require 'auto-complete-config)
(require 'go-mode-load)
(global-auto-complete-mode t)
;; Auto-complete configuration
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(global-auto-complete-mode t)
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")
(define-key ac-completing-map "\M-n" 'ac-next)
(define-key ac-completing-map "\M-p" 'ac-previous)
(setq ac-auto-start 2)
(setq ac-dwim t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;;yasnippet
(require 'yasnippet-bundle)
(yas/initialize)

;; Bredden p� tabbar
(setq default-tab-width 2)


;; emerge settings
;; emerge auto advance
