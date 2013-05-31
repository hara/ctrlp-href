ctrlp-href
==========

This is a ctrlp.vim extension which extracts `href` attributes
from XML/HTML buffer and `:find` it.

Configuration
-------------

Enable the extension:
```vim
let g:ctrlp_extensions = ['href']
```

This extension works for following filetypes as default:

* xml
* html
* xhtml

If you want to use for other filetypes, add filetype to `g:ctrlp_href_filetypes`:

```vim
let g:ctrlp_href_filetypes = ['erb']
```

