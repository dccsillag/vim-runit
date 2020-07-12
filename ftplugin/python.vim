let b:runit_syntax = "python"
let b:runit_exec = { path -> "python " . path }
let b:runit_repl = { path -> "python -i " . path }
let b:runit_init = { path -> "" }
