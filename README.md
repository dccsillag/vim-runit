`vim-runit`
===========

A quick Vim/NeoVim plugin to run the current file in a terminal buffer.

Quickstart
----------

Add the following to your vimrc (of course, feel free to change these mappings):

```vim
nmap <Leader>r <Plug>(RunIt)
nmap <Leader>R <Plug>(ReplIt)
```

Now, when editing a file of a supported language:

- When you hit `\r`, a terminal split will open with the command to run the program you were editing;
- When you hit `\R` a terminal split will open with a REPL with the program you were editing loaded.

Supported Languages
-------------------

These are basically languages that I use / had to use, so I went adding them.

- Python
- Racket

More coming soon!
