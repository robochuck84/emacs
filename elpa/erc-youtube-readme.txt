Show inlined info about youtube links in erc buffers.  Requires
Emacs 24.2

(require 'erc-youtube)
(add-to-list 'erc-modules 'youtube)
(erc-update-modules)

Or `(require 'erc-youtube)` and  `M-x customize-option erc-modules RET`

This plugin subscribes to hooks `erc-insert-modify-hook' and
`erc-send-modify-hook' to download and show youtubes.  In this early
version it's doing this synchronously.
