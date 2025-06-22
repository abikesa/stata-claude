/**************************************************************************
 🧱 config.do – Configuration settings, globals, system macros
**************************************************************************/

clear all
set more off

* 🌐 Set global slash (OS-specific shell separator)
if c(os) == "Windows" {
    global SL "\"
}
else {
    global SL "/"
}

* 🌊 Set working directory as root + define key folders
global root c(pwd)

foreach folder in data output code notes {
    local fpath "$root${SL}`folder'"
    capture mkdir "`fpath'"
    global `folder' "`fpath'"
}
