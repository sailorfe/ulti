;;; ulti-theme.el --- Tobiroppo theme -*- lexical-binding: t; -*-

;; Author: sailorfe
;; URL: https://codeberg.org/sailorfe/ulti
;; Package-Requires: ((emacs "30.1"))
;; Version: 0.1.0

;;; Commentary:
;; Emacs-first theme inspired by Ulti from /One Piece/.

;;; Code:

(require 'color)

(defvar ulti/theme-dir
  (file-name-directory (or load-file-name buffer-file-name default-directory))
  "Directory this file lives in.")

(defun ulti/hsl (h s l)
  "Convert H, S and L to a hex color string."
  (apply #'color-rgb-to-hex
         (append (color-hsl-to-rgb (/ h 360.0) s l) '(2))))

(defun ulti/bright (h s l &optional delta)
  "Raise L by DELTA (default 0.1) for a bright/terminal variant;
leave H and S alone."
  (ulti/hsl h s (min 1.0 (+ l (or delta 0.1)))))

(defun ulti/nearest-256 (hex)
  "Return the nearest xterm-256 color index for HEX."
  (let* ((r (string-to-number (substring hex 1 3) 16))
         (g (string-to-number (substring hex 3 5) 16))
         (b (string-to-number (substring hex 5 7) 16))
         (steps [0 95 135 175 215 255])
         (nearest-step
          (lambda (v)
            (let ((best 0) (bestd 1000))
              (dotimes (i 6)
                (let ((d (abs (- v (aref steps i)))))
                  (when (< d bestd) (setq bestd d best i))))
              best)))
         (ri (funcall nearest-step r))
         (gi (funcall nearest-step g))
         (bi (funcall nearest-step b))
         (cube-idx (+ 16 (* 36 ri) (* 6 gi) bi))
         (cube-dist (+ (expt (- r (aref steps ri)) 2)
                       (expt (- g (aref steps gi)) 2)
                       (expt (- b (aref steps bi)) 2)))
         (gray-idx (max 0 (min 23 (round (/ (- (/ (+ r g b) 3.0) 8) 10.0)))))
         (gray-val (+ 8 (* gray-idx 10)))
         (gray-dist (+ (expt (- r gray-val) 2)
                       (expt (- g gray-val) 2)
                       (expt (- b gray-val) 2))))
    (number-to-string (if (<= cube-dist gray-dist) cube-idx (+ 232 gray-idx)))))

(defvar ulti/palette
  (let* ((base (ulti/hsl 232 0.36 0.12))
         (surface (ulti/hsl 232 0.36 0.16))
         (overlay (ulti/hsl 232 0.36 0.2))
         (muted (ulti/hsl 232 0.24 0.42))
         (faint (ulti/hsl 232 0.24 0.68))
         (text (ulti/hsl 232 0.36 0.84))
         (light (ulti/hsl 232 0.36 0.92))
         (whoswho (ulti/hsl 2   0.58 0.6))  ; red pumps, ANSI red
         (sabretooth (ulti/bright 2   0.58 0.6))
         (sasaki (ulti/hsl 62  0.5  0.58)) ; pachycephalosaurus green, ANSI green
         (triceratops (ulti/bright 62  0.5  0.58))
         (ulti (ulti/hsl 330 0.81 0.74)) ; pink hair, ANSI "blue"
         (pachycephalos (ulti/bright 330 0.81 0.74))
         (drake (ulti/hsl 215 0.74 0.62)) ; blue hair, ANSI "magenta"
         (allosaurus (ulti/bright 215 0.74 0.62))
         (pageone (ulti/hsl 258 0.72 0.64)) ; page one purple, ANSI "yellow"
         (spinosaurus (ulti/bright 258 0.72 0.64))
         (blackmaria (ulti/hsl 195 0.6  0.7))  ; skirt, ANSI "cyan"
         (rosamygale (ulti/bright 195 0.6  0.7))
         (low (ulti/hsl 232 0.24 0.16))
         (med (ulti/hsl 232 0.24 0.24))
         (high (ulti/hsl 232 0.24 0.32))

         (raw
          `((base . ,base)
            (surface . ,surface)
            (overlay . ,overlay)
            (muted . ,muted)
            (faint . ,faint)
            (text . ,text)
            (light . ,light)
            (whoswho . ,whoswho)
            (sabretooth . ,sabretooth)
            (sasaki . ,sasaki)
            (triceratops . ,triceratops)
            (ulti . ,ulti)
            (pachycephalos . ,pachycephalos)
            (drake . ,drake)
            (allosaurus . ,allosaurus)
            (pageone . ,pageone)
            (spinosaurus . ,spinosaurus)
            (blackmaria . ,blackmaria)
            (rosamygale . ,rosamygale)
            (low . ,low)
            (med . ,med)
            (high . ,high)
            )))
    (append raw
            (mapcar (lambda (p)
                      (cons (intern (format "%s-cterm" (car p)))
                            (ulti/nearest-256 (cdr p))))
                    raw))))

(deftheme ulti "Tobiroppo theme.")

(let* ((base (alist-get 'base ulti/palette))
       (surface (alist-get 'surface ulti/palette))
       (overlay (alist-get 'overlay ulti/palette))
       (text (alist-get 'text ulti/palette))
       (light (alist-get 'light ulti/palette))
       (faint (alist-get 'faint ulti/palette))
       (muted (alist-get 'muted ulti/palette))
       (low (alist-get 'low ulti/palette))
       (med (alist-get 'med ulti/palette))
       (high (alist-get 'high ulti/palette))
       (whoswho (alist-get 'whoswho ulti/palette))
       (sabretooth (alist-get 'sabretooth ulti/palette))
       (sasaki (alist-get 'sasaki ulti/palette))
       (triceratops (alist-get 'triceratops ulti/palette))
       (ulti (alist-get 'ulti ulti/palette))
       (pachycephalos (alist-get 'pachycephalos ulti/palette))
       (drake (alist-get 'drake ulti/palette))
       (allosaurus (alist-get 'allosaurus ulti/palette))
       (pageone (alist-get 'pageone ulti/palette))
       (spinosaurus (alist-get 'spinosaurus ulti/palette))
       (blackmaria (alist-get 'blackmaria ulti/palette))
       (rosamygale (alist-get 'rosamygale ulti/palette)))

  (custom-theme-set-faces
   'ulti
   ;; --- core ui -------------------------------------------------
   `(default ((t (:background ,base :foreground ,text))))
   `(cursor ((t (:background ,text))))
   `(region ((t (:background ,blackmaria :foreground ,base))))
   `(secondary-selection ((t (:background ,med :foreground ,ulti))))
   `(highlight ((t (:background ,overlay :foreground ,pageone))))
   `(hl-line ((t (:background ,overlay))))
   `(fringe ((t (:background ,base :foreground ,muted))))
   `(vertical-border ((t (:foreground ,surface))))
   `(window-divider ((t (:foreground ,surface))))
   `(window-divider-first-pixel ((t (:foreground ,surface))))
   `(window-divider-last-pixel ((t (:foreground ,surface))))
   `(minibuffer-prompt ((t (:foreground ,drake :weight bold))))
   `(shadow ((t (:foreground ,muted))))
   `(link ((t (:foreground ,drake :underline t))))
   `(link-visited ((t (:foreground ,sasaki :underline t))))
   `(escape-glyph ((t (:foreground ,blackmaria))))
   `(homoglyph ((t (:foreground ,blackmaria))))
   `(tooltip ((t (:background ,surface :foreground ,text))))
   `(trailing-whitespace ((t (:background ,overlay))))
   `(nobreak-space ((t (:foreground ,muted :underline t))))
   `(fill-column-indicator ((t (:foreground ,high))))
   `(bookmark-face ((t (:foreground ,drake))))

   ;; --- errors / warnings / success ------------------------------
   `(error ((t (:foreground ,whoswho :weight bold))))
   `(warning ((t (:foreground ,ulti :weight bold))))
   `(success ((t (:foreground ,sasaki :weight bold))))

   ;; --- mode-line / header / tab lines ---------------------------
   `(mode-line ((t (:background ,surface :foreground ,text))))
   `(mode-line-inactive ((t (:background ,base :foreground ,muted))))
   `(mode-line-active ((t (:background ,surface :foreground ,text))))
   `(mode-line-emphasis ((t (:foreground ,pageone :weight bold))))
   `(mode-line-highlight ((t (:foreground ,pageone :box (:line-width -1 :color ,pageone)))))
   `(mode-line-buffer-id ((t (:foreground ,text :weight bold))))
   `(header-line ((t (:background ,med :foreground ,faint))))
   `(header-line-highlight ((t (:background ,med :foreground ,pageone))))
   `(tab-line ((t (:background ,surface :foreground ,muted))))
   `(tab-line-tab ((t (:background ,surface :foreground ,muted))))
   `(tab-line-tab-inactive ((t (:background ,surface :foreground ,muted))))
   `(tab-line-tab-current ((t (:background ,overlay :foreground ,pageone :weight bold))))
   `(tab-line-highlight ((t (:background ,overlay :foreground ,pageone))))
   `(tab-bar ((t (:background ,surface :foreground ,muted))))
   `(tab-bar-tab ((t (:background ,overlay :foreground ,pageone :weight bold))))
   `(tab-bar-tab-inactive ((t (:background ,surface :foreground ,muted))))

   ;; --- line numbers ----------------------------------------------
   `(line-number ((t (:foreground ,muted :background ,base))))
   `(line-number-current-line ((t (:foreground ,text :background ,overlay :weight bold))))
   `(line-number-major-tick ((t (:foreground ,faint :background ,base))))
   `(line-number-minor-tick ((t (:foreground ,muted :background ,base))))

   ;; --- search / isearch --------------------------------------------
   `(isearch ((t (:background ,ulti :foreground ,base))))
   `(isearch-fail ((t (:background ,whoswho :foreground ,light))))
   `(isearch-group-1 ((t (:background ,drake :foreground ,base))))
   `(isearch-group-2 ((t (:background ,sasaki :foreground ,base))))
   `(lazy-highlight ((t (:background ,med :foreground ,ulti))))
   `(query-replace ((t (:background ,ulti :foreground ,base))))

   ;; --- show-paren --------------------------------------------------
   `(show-paren-match ((t (:background ,high :weight bold))))
   `(show-paren-match-expression ((t (:background ,overlay))))
   `(show-paren-mismatch ((t (:background ,whoswho :foreground ,light :weight bold))))

   ;; --- misc syntax ----------------------------------------------
   ;; sh
   `(sh-heredoc ((t (:foreground ,ulti :weight bold))))
   `(sh-quoted-exec ((t :foreground ,whoswho :slant italic)))
   `(sh-escaped-newline ((t :foreground ,faint)))

   ;; --- font-lock (syntax highlighting) -------------------------------
   ;; comment
   `(font-lock-comment-face ((t (:foreground ,faint :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,faint :slant italic))))
   `(font-lock-doc-face ((t (:foreground ,faint :slant italic))))
   `(font-lock-doc-markup-face ((t (:foreground ,faint))))

   ;; constant
   `(font-lock-constant-face ((t (:foreground ,ulti))))
   `(font-lock-number-face ((t (:foreground ,ulti))))

   ;; string
   `(font-lock-string-face ((t (:foreground ,sasaki))))

   ;; identifier
   `(font-lock-variable-name-face ((t (:foreground ,blackmaria))))
   `(font-lock-variable-use-face ((t (:foreground ,blackmaria))))

   ;; function
   `(font-lock-function-name-face ((t (:foreground ,drake))))
   `(font-lock-function-call-face ((t (:foreground ,drake))))

   ;; statement
   `(font-lock-keyword-face ((t (:foreground ,pageone :weight bold))))

   ;; preproc
   `(font-lock-preprocessor-face ((t (:foreground ,pageone))))

   ;; type
   `(font-lock-type-face ((t (:foreground ,ulti))))

   ;; special
   `(font-lock-builtin-face ((t (:foreground ,drake :weight bold))))
   `(font-lock-escape-face ((t (:foreground ,drake))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,drake :weight bold))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,drake :weight bold))))

   ;; misc
   `(font-lock-warning-face ((t (:foreground ,whoswho :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,drake :weight bold))))
   `(font-lock-property-name-face ((t (:foreground ,text))))
   `(font-lock-property-use-face ((t (:foreground ,text))))
   `(font-lock-operator-face ((t (:foreground ,text))))
   `(font-lock-bracket-face ((t (:foreground ,text))))
   `(font-lock-punctuation-face ((t (:foreground ,text))))
   `(font-lock-delimiter-face ((t (:foreground ,muted))))

   ;; --- diff-mode ------------------------------------------------
   `(diff-header ((t (:background ,surface))))
   `(diff-file-header ((t (:background ,surface :foreground ,text :weight bold))))
   `(diff-hunk-header ((t (:background ,surface :foreground ,muted))))
   `(diff-context ((t (:foreground ,faint))))
   `(diff-added ((t (:foreground ,sasaki))))
   `(diff-removed ((t (:foreground ,whoswho))))
   `(diff-changed ((t (:foreground ,pageone))))
   `(diff-refine-added ((t (:background ,sasaki :foreground ,base))))
   `(diff-refine-removed ((t (:background ,whoswho :foreground ,light))))
   `(diff-refine-changed ((t (:background ,pageone :foreground ,base))))
   `(diff-indicator-added ((t (:foreground ,sasaki))))
   `(diff-indicator-removed ((t (:foreground ,whoswho))))
   `(diff-indicator-changed ((t (:foreground ,pageone))))

   ;; --- diff-hl ----------------------------------------------------
   `(diff-hl-insert ((t (:foreground ,sasaki))))
   `(diff-hl-delete ((t (:foreground ,whoswho))))
   `(diff-hl-change ((t (:foreground ,pageone))))

   ;; --- flyspell ---------------------------------------------------
   `(flyspell-incorrect ((t (:foreground ,whoswho :underline (:style wave)))))
   `(flyspell-duplicate ((t (:foreground ,ulti :underline (:style wave)))))

   ;; --- completions (in-buffer / *Completions*) ---------------------
   `(completions-common-part ((t (:foreground ,pageone :weight bold))))
   `(completions-first-difference ((t (:foreground ,blackmaria :weight bold))))
   `(completions-annotations ((t (:foreground ,muted :slant italic))))
   `(completions-group-title ((t (:foreground ,faint :weight bold))))

   ;; --- widgets / custom-mode ----------------------------------------
   `(widget-field ((t (:background ,overlay :foreground ,text :box (:line-width 1 :color ,muted)))))
   `(widget-single-line-field ((t (:background ,overlay :foreground ,text))))
   `(widget-button ((t (:foreground ,pageone :weight bold))))
   `(widget-documentation ((t (:foreground ,faint))))
   `(custom-button ((t (:background ,surface :foreground ,text :box (:line-width 1 :color ,muted)))))
   `(custom-button-mouse ((t (:background ,overlay :foreground ,pageone :box (:line-width 1 :color ,pageone)))))
   `(custom-button-pressed ((t (:background ,overlay :foreground ,pageone :box (:line-width 1 :color ,pageone)))))
   `(custom-state ((t (:foreground ,sasaki))))
   `(custom-variable-tag ((t (:foreground ,pageone :weight bold))))
   `(custom-group-tag ((t (:foreground ,drake :weight bold))))

   ;; --- misc buffer / dired -----------------------------------------
   `(match ((t (:background ,med :foreground ,ulti))))
   `(next-error ((t (:background ,overlay))))
   `(help-key-binding ((t (:foreground ,pageone :background ,surface :box (:line-width 1 :color ,muted)))))
   `(dired-directory ((t (:foreground ,drake))))
   `(dired-symlink ((t (:foreground ,blackmaria))))
   `(dired-broken-symlink ((t (:foreground ,whoswho :underline t))))
   `(dired-marked ((t (:foreground ,pageone :weight bold))))
   `(dired-flagged ((t (:foreground ,whoswho :weight bold))))
   `(dired-header ((t (:foreground ,pageone :weight bold))))
   `(dired-ignored ((t (:foreground ,muted))))
   `(dired-mark ((t (:foreground ,pageone :weight bold))))
   `(dired-warning ((t (:foreground ,ulti :weight bold))))
   `(dired-perm-write ((t (:foreground ,ulti))))
   `(dired-set-id ((t (:foreground ,blackmaria :weight bold))))
   `(dired-special ((t (:foreground ,sasaki))))

   ;; --- diredfl --------------------------------------------------------
   `(diredfl-dir-heading ((t (:foreground ,pageone :weight bold))))
   `(diredfl-dir-name ((t (:foreground ,drake))))
   `(diredfl-dir-priv ((t (:foreground ,drake))))
   `(diredfl-file-name ((t (:foreground ,text))))
   `(diredfl-file-suffix ((t (:foreground ,faint))))
   `(diredfl-symlink ((t (:foreground ,blackmaria))))
   `(diredfl-number ((t (:foreground ,ulti))))
   `(diredfl-date-time ((t (:foreground ,faint))))
   `(diredfl-deletion ((t (:foreground ,whoswho :weight bold))))
   `(diredfl-deletion-file-name ((t (:foreground ,whoswho :strike-through t))))
   `(diredfl-flag-mark ((t (:foreground ,pageone :weight bold :background ,overlay))))
   `(diredfl-flag-mark-line ((t (:background ,overlay))))
   `(diredfl-ignored-file-name ((t (:foreground ,muted))))
   `(diredfl-compressed-file-suffix ((t (:foreground ,blackmaria))))
   `(diredfl-compressed-file-name ((t (:foreground ,text))))
   `(diredfl-executable-flag ((t (:foreground ,sasaki :weight bold))))
   `(diredfl-read-priv ((t (:foreground ,ulti))))
   `(diredfl-write-priv ((t (:foreground ,ulti))))
   `(diredfl-exec-priv ((t (:foreground ,sasaki))))
   `(diredfl-no-priv ((t (:foreground ,muted))))
   `(diredfl-rare-priv ((t (:foreground ,blackmaria :weight bold))))
   `(diredfl-link-priv ((t (:foreground ,blackmaria))))
   `(diredfl-autofile-name ((t (:foreground ,faint :slant italic))))
   `(diredfl-tagged-autofile-name ((t (:foreground ,pageone :slant italic))))

   ;; --- flymake --------------------------------------------------------
   `(flymake-error ((t (:underline (:style wave :color ,whoswho)))))
   `(flymake-warning ((t (:underline (:style wave :color ,ulti)))))
   `(flymake-note ((t (:underline (:style wave :color ,drake)))))
   `(flymake-error-echo ((t (:foreground ,whoswho))))
   `(flymake-warning-echo ((t (:foreground ,ulti))))
   `(flymake-note-echo ((t (:foreground ,drake))))

   ;; --- flycheck -------------------------------------------------------
   `(flycheck-error ((t (:underline (:style wave :color ,whoswho)))))
   `(flycheck-warning ((t (:underline (:style wave :color ,ulti)))))
   `(flycheck-info ((t (:underline (:style wave :color ,drake)))))
   `(flycheck-fringe-error ((t (:foreground ,whoswho :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,ulti :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,drake :weight bold))))
   `(flycheck-error-list-error ((t (:foreground ,whoswho :weight bold))))
   `(flycheck-error-list-warning ((t (:foreground ,ulti :weight bold))))
   `(flycheck-error-list-info ((t (:foreground ,drake))))

   ;; --- jinkx monsoon ---------------------------------------------------
   `(jinx-misspelled ((t (:foreground ,whoswho :underline (:style wave :color ,whoswho)))))
   `(jinx-highlight ((t (:foreground ,base :background ,ulti))))

   ;; --- eldoc / help hints & tooltips -----------------------------------
   `(eldoc-highlight-function-argument ((t (:foreground ,pageone :weight bold))))
   `(eldoc-box-body ((t (:background ,surface :foreground ,text))))
   `(eldoc-box-border ((t (:background ,muted))))

   ;; --- markdown-mode -------------------------------------------------
   `(markdown-header-face ((t (:foreground ,pageone :weight bold))))
   `(markdown-header-face-1 ((t (:foreground ,pageone :weight bold))))
   `(markdown-header-face-2 ((t (:foreground ,ulti :weight bold))))
   `(markdown-header-face-3 ((t (:foreground ,sasaki :weight bold))))
   `(markdown-header-face-4 ((t (:foreground ,blackmaria :weight bold))))
   `(markdown-header-face-5 ((t (:foreground ,drake :weight bold))))
   `(markdown-header-face-6 ((t (:foreground ,whoswho :weight bold))))
   `(markdown-header-delimiter-face ((t (:foreground ,muted))))
   `(markdown-link-face ((t (:foreground ,drake :underline t))))
   `(markdown-url-face ((t (:foreground ,drake :slant italic :underline t))))
   `(markdown-code-face ((t (:foreground ,sasaki))))
   `(markdown-inline-code-face ((t (:foreground ,sasaki))))
   `(markdown-blockquote-face ((t (:foreground ,faint :slant italic))))
   `(markdown-list-face ((t (:foreground ,ulti))))
   `(markdown-bold-face ((t (:weight bold))))
   `(markdown-italic-face ((t (:slant italic))))
   `(markdown-strike-through-face ((t (:strike-through t :foreground ,muted))))
   `(markdown-markup-face ((t (:foreground ,muted))))

   ;; --- org-mode basics ------------------------------------------------
   `(org-level-1 ((t (:foreground ,pageone :weight bold))))
   `(org-level-2 ((t (:foreground ,ulti :weight bold))))
   `(org-level-3 ((t (:foreground ,sasaki :weight bold))))
   `(org-level-4 ((t (:foreground ,blackmaria :weight bold))))
   `(org-level-5 ((t (:foreground ,drake :weight bold))))
   `(org-level-6 ((t (:foreground ,whoswho :weight bold))))
   `(org-document-title ((t (:foreground ,pageone :weight bold))))
   `(org-document-info ((t (:foreground ,faint))))
   `(org-block ((t (:background ,surface :foreground ,text))))
   `(org-block-begin-line ((t (:background ,surface :foreground ,muted))))
   `(org-block-end-line ((t (:background ,surface :foreground ,muted))))
   `(org-code ((t (:foreground ,sasaki))))
   `(org-verbatim ((t (:foreground ,blackmaria))))
   `(org-link ((t (:foreground ,drake :underline t))))
   `(org-todo ((t (:background ,whoswho :foreground ,low :weight bold))))
   `(org-done ((t (:background ,sasaki :foreground ,low :weight bold))))
   `(org-headline-todo ((t (:foreground ,whoswho))))
   `(org-headline-done ((t (:foreground ,sasaki))))
   `(org-date ((t (:foreground ,muted :underline t))))
   `(org-tag ((t (:foreground ,faint))))
   `(org-special-keyword ((t (:foreground ,muted))))
   `(org-quote ((t (:foreground ,faint :slant italic))))
   `(org-macro ((t (:foreground ,ulti))))
   `(org-table ((t (:foreground ,pageone))))
   `(org-footnote ((t :foreground ,blackmaria :underline t)))
   ;; custom todo keywords
   `(sailorfe-org-todo-next ((t (:background ,pageone :foreground ,low :weight bold))))
   `(sailorfe-org-todo-prog ((t (:background ,blackmaria :foreground ,low :weight bold))))
   `(sailorfe-org-todo-wait ((t (:background ,drake :foreground ,low :weight bold))))
   `(sailorfe-org-todo-void ((t (:background ,high :foreground ,low :weight bold :strikethrough t))))

   ;; --- org-agenda -----------------------------------------------------
   `(org-agenda-structure ((t (:foreground ,pageone :weight bold))))
   `(org-agenda-date ((t (:foreground ,drake))))
   `(org-agenda-date-weekend ((t (:foreground ,faint))))
   `(org-agenda-date-today ((t (:foreground ,pageone :weight bold :underline t))))
   `(org-agenda-current-time ((t (:foreground ,ulti))))
   `(org-agenda-clocking ((t (:background ,med))))
   `(org-agenda-done ((t (:foreground ,sasaki))))
   `(org-agenda-dimmed-todo-face ((t (:foreground ,muted))))
   `(org-agenda-restriction-lock ((t (:background ,overlay))))
   `(org-agenda-filter-tags ((t (:foreground ,blackmaria))))
   `(org-time-grid ((t (:foreground ,muted))))
   `(org-scheduled ((t (:foreground ,text))))
   `(org-scheduled-today ((t (:foreground ,pageone))))
   `(org-scheduled-previously ((t (:foreground ,ulti))))
   `(org-upcoming-deadline ((t (:foreground ,ulti))))
   `(org-upcoming-distant-deadline ((t (:foreground ,faint))))
   `(org-imminent-deadline ((t (:foreground ,whoswho :weight bold))))
   `(org-warning ((t (:foreground ,whoswho :weight bold))))
   `(org-priority ((t (:foreground ,blackmaria))))
   `(org-column ((t (:background ,surface))))
   `(org-column-title ((t (:background ,surface :foreground ,pageone :weight bold))))

   ;; --- magit ------------------------------------------------------------

   ;; sections / headers
   `(magit-section-heading ((t (:foreground ,pageone :weight bold))))
   `(magit-section-heading-selection ((t (:background ,overlay :foreground ,pageone :weight bold))))
   `(magit-section-highlight ((t (:background ,surface))))

   ;; popup / transient interface
   `(transient-heading ((t (:foreground ,pageone :weight bold))))
   `(transient-key ((t (:foreground ,drake :weight bold))))
   `(transient-argument ((t (:foreground ,sasaki))))
   `(transient-value ((t (:foreground ,ulti))))
   `(transient-inactive-argument ((t (:foreground ,muted))))
   `(transient-inactive-value ((t (:foreground ,muted))))

   ;; branch / refs
   `(magit-branch-local ((t (:foreground ,sasaki :weight bold))))
   `(magit-branch-remote ((t (:foreground ,drake :weight bold))))
   `(magit-branch-current ((t (:foreground ,pageone :weight bold))))
   `(magit-branch-upstream ((t (:foreground ,ulti))))
   `(magit-head ((t (:foreground ,pageone :weight bold))))

   `(magit-tag ((t (:foreground ,blackmaria :weight bold))))

   ;; commit metadata
   `(magit-log-author ((t (:foreground ,text))))
   `(magit-log-date ((t (:foreground ,muted))))
   `(magit-log-graph ((t (:foreground ,faint))))
   `(magit-hash ((t (:foreground ,muted))))
   `(magit-reflog-commit ((t (:foreground ,sasaki))))
   `(magit-reflog-other ((t (:foreground ,drake))))

   ;; commit messages
   `(magit-diff-file-heading ((t (:foreground ,pageone :weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,surface :foreground ,pageone :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,overlay :foreground ,light :weight bold))))
   `(magit-diff-hunk-heading ((t (:background ,surface :foreground ,drake))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,overlay :foreground ,pageone))))
   `(magit-diff-hunk-heading-selection ((t (:background ,overlay :foreground ,light))))

   ;; diff content
   `(magit-diff-context ((t (:foreground ,faint))))
   `(magit-diff-context-highlight ((t (:background ,surface :foreground ,text))))

   `(magit-diff-added ((t (:foreground ,sasaki))))
   `(magit-diff-added-highlight ((t (:background ,sasaki :foreground ,base))))

   `(magit-diff-removed ((t (:foreground ,whoswho))))
   `(magit-diff-removed-highlight ((t (:background ,whoswho :foreground ,light))))

   `(magit-diff-added-highlight ((t (:background ,sasaki :foreground ,base))))
   `(magit-diff-removed-highlight ((t (:background ,whoswho :foreground ,light))))

   `(magit-diff-whitespace-warning ((t (:background ,ulti :foreground ,base))))

   ;; status buffer
   `(magit-diffstat-added ((t (:foreground ,sasaki))))
   `(magit-diffstat-removed ((t (:foreground ,whoswho))))
   `(magit-diffstat-neutral ((t (:foreground ,muted))))

   `(magit-status-heading ((t (:foreground ,pageone :weight bold))))
   `(magit-status-heading-key ((t (:foreground ,drake))))
   `(magit-status-untracked ((t (:foreground ,blackmaria))))
   `(magit-status-ignored ((t (:foreground ,muted))))
   `(magit-status-modified ((t (:foreground ,ulti))))
   `(magit-status-added ((t (:foreground ,sasaki))))
   `(magit-status-renamed ((t (:foreground ,drake))))
   `(magit-status-conflict ((t (:foreground ,whoswho :weight bold))))

   ;; process / errors
   `(magit-process-ok ((t (:foreground ,sasaki :weight bold))))
   `(magit-process-ng ((t (:foreground ,whoswho :weight bold))))

   ;; blame
   `(magit-blame-heading ((t (:background ,surface :foreground ,text))))
   `(magit-blame-highlight ((t (:background ,overlay))))
   `(magit-blame-date ((t (:foreground ,muted))))
   `(magit-blame-name ((t (:foreground ,pageone))))

   ;; --- in-buffer completion popups (corfu) ----------------------------
   `(corfu-default ((t (:background ,surface :foreground ,text))))
   `(corfu-current ((t (:background ,overlay :foreground ,pageone :weight bold))))
   `(corfu-bar ((t (:background ,high))))
   `(corfu-border ((t (:background ,muted))))
   `(corfu-annotations ((t (:foreground ,muted :slant italic))))
   `(corfu-deprecated ((t (:foreground ,muted :strike-through t))))

   ;; --- minibuffer completion UI ---------------------------------------
   `(vertico-current ((t (:background ,overlay :foreground ,pageone :weight bold))))
   `(vertico-group-title ((t (:foreground ,faint :weight bold))))
   `(vertico-group-separator ((t (:foreground ,muted :strike-through t))))
   `(vertico-multiline ((t (:foreground ,muted))))
   `(orderless-match-face-0 ((t (:foreground ,pageone :weight bold))))
   `(orderless-match-face-1 ((t (:foreground ,drake :weight bold))))
   `(orderless-match-face-2 ((t (:foreground ,sasaki :weight bold))))
   `(orderless-match-face-3 ((t (:foreground ,blackmaria :weight bold))))

   ;; --- eww -------------------------------------------------------------
   `(eww-form-file ((t (:foreground ,base :background ,faint :box nil))))
   `(eww-form-submit ((t (:foreground ,base :background ,faint :box nil))))
   `(eww-form-text ((t (:foreground ,base :background ,text :box nil))))
   `(eww-form-select ((t (:foreground ,base :background ,blackmaria :box nil))))
   `(eww-form-checkbox ((t (:foreground ,base :background ,blackmaria :box nil))))
   `(eww-form-textarea ((t (:foreground ,base :background ,text :box nil))))
   `(eww-invalid-certificate ((t :foreground ,whoswho :weight bold)))
   `(eww-valid-certificate ((t :foreground ,sasaki :weight bold)))

   ;; --- dashboard -------------------------------------------------------
   `(dashboard-heading ((t (:foreground ,drake :weight bold))))
   `(dashboard-navigator ((t (:foreground ,blackmaria :weight bold))))
   `(dashboard-items-face ((t (:foreground ,blackmaria :weight bold))))
   `(dashboard-no-items-face ((t (:foreground ,muted :weight bold))))
   `(dashboard-footer-face ((t (:foreground ,faint :slant italic))))
   `(dashboard-text-banner ((t (:foreground ,drake))))
   `(dashboard-banner-logo-title ((t (:foreground ,text))))
   
   ;; --- vterm -----------------------------------------------------------
   `(vterm-color-black ((t (:foreground ,low :background ,low))))
   `(vterm-color-bright-black ((t (:foreground ,med :background ,med))))
   `(vterm-color-red ((t (:foreground ,whoswho :background ,whoswho))))
   `(vterm-color-bright-red ((t (:foreground ,sabretooth :background ,sabretooth))))
   `(vterm-color-green ((t (:foreground ,sasaki :background ,sasaki))))
   `(vterm-color-bright-green ((t (:foreground ,triceratops :background ,triceratops))))
   `(vterm-color-yellow ((t (:foreground ,ulti :background ,ulti))))
   `(vterm-color-bright-yellow ((t (:foreground ,pachycephalos :background ,pachycephalos))))
   `(vterm-color-blue ((t (:foreground ,drake :background ,drake))))
   `(vterm-color-bright-blue ((t (:foreground ,allosaurus :background ,allosaurus))))
   `(vterm-color-magenta ((t (:foreground ,pageone :background ,pageone))))
   `(vterm-color-bright-magenta ((t (:foreground ,spinosaurus :background ,spinosaurus))))
   `(vterm-color-cyan ((t (:foreground ,blackmaria :background ,blackmaria))))
   `(vterm-color-bright-cyan ((t (:foreground ,rosamygale :background ,rosamygale))))
   `(vterm-color-white ((t (:foreground ,text :background ,text))))
   `(vterm-color-bright-white ((t (:foreground ,light :background ,light))))
   `(vterm-color-underline ((t (:foreground ,blackmaria))))
   `(vterm-color-inverse-video ((t (:background ,base :inverse-video t))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'ulti)

;;; --- automated exports -------------------------------------------------

(defun ulti/render-template (template-file output-file &optional strip-hash)
  "Inject ulti/palette values into TEMPLATE-FILE and write to extras/OUTPUT-FILE.
STRIP-HASH optionally removes # from templates that require bare rrggbb."
  (with-temp-buffer
    (insert-file-contents template-file)
    (dolist (pair ulti/palette)
      (goto-char (point-min))
      (let ((value (if strip-hash (substring (cdr pair) 1) (cdr pair))))
        (while (search-forward (format "{{%s}}" (car pair)) nil t)
          (replace-match value t t))))
    (make-directory (file-name-directory output-file) t)
    (write-region (point-min) (point-max) output-file)
    (message "ulti: wrote %s" output-file)))

(defvar ulti/export-targets
  '(("templates/palette.json" . "palette.json")
    ("templates/ansi.json" . "extras/ansi/ulti.json")
    ("templates/foot.ini" "extras/foot/ulti.ini" t)
    ("templates/mako" . "extras/mako/ulti")
    ("templates/shell.sh" . "extras/shell/ulti.sh")
    ("templates/termux.properties" . "extras/termux/ulti.properties")
    ("templates/tty.conf" "extras/tty/ulti.conf" t)
    ("templates/vim.vim" "extras/vim/colors/ulti.vim")))

(defun ulti/export-all ()
  "Render every template in `ulti/export-targets' against `ulti/palette'.
Callable interactively, or headless via:
  `emacs --batch -l ulti-theme.el -f ulti/export-all`."
  (interactive)
  (dolist (entry ulti/export-targets)
    (let ((template (if (consp (cdr entry)) (nth 0 entry) (car entry)))
          (output    (if (consp (cdr entry)) (nth 1 entry) (cdr entry)))
          (strip     (if (consp (cdr entry)) (nth 2 entry) nil)))
      (ulti/render-template
       (expand-file-name template ulti/theme-dir)
       (expand-file-name output)
       strip))))

;;; ulti-theme.el ends here
