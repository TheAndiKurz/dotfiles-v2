(define-lsp "steel-language-server" (command "steel-language-server") (args '()))
(define-language "scheme"
  (formatter (command "raco") (args '("fmt" "-i")))
  (auto-format #true)
  (language-servers '("steel-language-server"))
)

(require "helix/configuration.scm")
(require "cogs/oil.scm")
(require "cogs/keymaps.scm")

(oil-configure! #true #true)

(add-global-keybinding (hash "normal" (hash "space" (hash "e" ':oil))))

(define oil-keybindings (deep-copy-global-keybindings))
(define oil-keymaps
  (hash "normal"
    (hash
      "space" ':oil-enter
      "ret" ':oil-enter
      "-" ':oil-up
      "q" ':oil-close
      "esc" ':oil-close
      "w" ':oil-save
      "h" ':oil-toggle-hidden
      "i" ':oil-toggle-git-ignored
    )
  )
)
(merge-keybindings oil-keybindings oil-keymaps)
(set-global-buffer-or-extension-keymap (hash OIL-BUFFER-NAME oil-keybindings))
