let b:runit_syntax = "racket"
let b:runit_exec = { path -> "racket " . path }
let b:runit_repl = { path -> "racket" }
let b:runit_init = { path -> "(enter! \"" . path . "\")\<CR>" }
