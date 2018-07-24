# https://myrlang.org/
# Derived from the go.kak syntax highlighter provided in the base
# Kakoune install
#

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*\.myr %{
    set-option buffer filetype myrddin
}

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/myrddin regions
add-highlighter shared/myrddin/code default-region group
add-highlighter shared/myrddin/double_string region '"' (?<!\\)(\\\\)*" fill string
add-highlighter shared/myrddin/single_string region "'" (?<!\\)(\\\\)*' fill string
add-highlighter shared/myrddin/comment region /\* \*/ fill comment
add-highlighter shared/myrddin/comment_line region '//' $ fill comment

add-highlighter shared/myrddin/code/ regex %{-?([0-9]*\.(?!0[xX]))?\b([0-9]+|0[xX][0-9a-fA-F]+)\.?([eE][+-]?[0-9]+)?i?\b} 0:value

evaluate-commands %sh{
    # Grammar
    keywords="\$noret|break|const|continue|elif|else|extern|false"
    keywords="${keywords}|for|generic|goto|if|impl|in|match|pkg"
    keywords="${keywords}|pkglocal|sizeof|struct|trait|true|type"
    keywords="${keywords}|union|use|var|void|while"
    types="void|bool|char|byte|int8|uint8|int16|uint16|int32|uint32"
    types="${types}|int64|uint64|int|uint|flt32|flt64"
    values="false|true|0x[0-9a-fA-F_]+|0o[0-7_]+|0b[0-1_]+"
    values="${values}|[0-9_]+(.[0-9_]+(e[0-9_]+)?)?"
    functions=""

    # Add the language's grammar to the static completion list
    printf %s\\n "hook global WinSetOption filetype=myrddin %{
        set-option window static_words ${keywords} ${attributes} ${types} ${values} ${functions}
    }" | tr '|' ' '

    # Highlight keywords
    printf %s "
        add-highlighter shared/myrddin/code/ regex \b(${keywords})\b 0:keyword
        add-highlighter shared/myrddin/code/ regex \b(${attributes})\b 0:attribute
        add-highlighter shared/myrddin/code/ regex \b(${types})\b 0:type
        add-highlighter shared/myrddin/code/ regex \b(${values})\b 0:value
        add-highlighter shared/myrddin/code/ regex \b(${functions})\b 0:builtin
    "
}

# Commands
# ‾‾‾‾‾‾‾‾

# TODO

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook -group myrddin-highlight global WinSetOption filetype=myrddin %{ add-highlighter window/myrddin ref myrddin }

hook -group myrddin-highlight global WinSetOption filetype=(?!myrddin).* %{ remove-highlighter window/myrddin }
