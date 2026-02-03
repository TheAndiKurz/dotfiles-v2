$env.config.history.file_format = "sqlite"

$env.config.history.max_size = 5_000_000


# isolation (bool):
# `true`: New history from other currently-open Nushell sessions is not
# seen when scrolling through the history using PrevHistory (typically
# the Up key) or NextHistory (Down key)
# `false`: All commands entered in other Nushell sessions will be mixed with
# those from the current shell.
# Note: Older history items (from before the current shell was started) are
# always shown.
# This setting only applies to SQLite-backed history
$env.config.history.isolation = true


# show_banner (bool): Enable or disable the welcome banner at startup
$env.config.show_banner = false


# rm.always_trash (bool):
# true: rm behaves as if the --trash/-t option is specified
# false: rm behaves as if the --permanent/-p option is specified (default)
# Explicitly calling `rm` with `--trash` or `--permanent` always override this setting
# Note that this feature is dependent on the host OS trashcan support.
$env.config.rm.always_trash = true


# recursion_limit (int): how many times a command can call itself recursively
# before an error will be generated.
$env.config.recursion_limit = 50


# edit_mode (string) "vi" or "emacs" sets the editing behavior of Reedline
$env.config.edit_mode = "emacs" # i use emacs here, because if i open a shell in vim the keybinds overlap :(


# Command that will be used to edit the current line buffer with Ctrl+O.
# If unset, uses $env.VISUAL and then $env.EDITOR
#
# Tip: Set to "editor" to use the default editor on Unix platforms using
#      the Alternatives system or equivalent
$env.config.buffer_editor = "editor"


# cursor_shape_* (string)
# -----------------------
# The following variables accept a string from the following selections:
# "block", "underscore", "line", "blink_block", "blink_underscore", "blink_line", or "inherit"
# "inherit" skips setting cursor shape and uses the current terminal setting.
$env.config.cursor_shape.emacs = "line"         # Cursor shape in emacs mode
$env.config.cursor_shape.vi_insert = "block"       # Cursor shape in vi-insert mode
$env.config.cursor_shape.vi_normal = "underscore"  # Cursor shape in normal vi mode


# --------------------
# Completions Behavior
# --------------------
# $env.config.completions.*
# Apply to the Nushell completion system

# algorithm (string): Either "prefix" or "fuzzy"
$env.config.completions.algorithm = "fuzzy"

# sort (string): One of "smart" or "alphabetical"
# In "smart" mode sort order is based on the "algorithm" setting.
# When using the "prefix" algorithm, results are alphabetically sorted.
# When using the "fuzzy" algorithm, results are sorted based on their fuzzy score.
$env.config.completions.sort = "smart"

# case_sensitive (bool): true/false to enable/disable case-sensitive completions
$env.config.completions.case_sensitive = false

# quick (bool):
# true: auto-select the completion when only one remains
# false: prevents auto-select of the final result
$env.config.completions.quick = true

# partial (bool):
# true: Partially complete up to the best possible match
# false: Do not partially complete
# Partial Example: If a directory contains only files named "forage", "food", and "forest",
#                  then typing "ls " and pressing <Tab> will partially complete the first two
#                  letters, "f" and "o". If the directory also includes a file named "faster",
#                  then only "f" would be partially completed.
$env.config.completions.partial = true


# --------------------
# External Completions
# --------------------
# completions.external.*: Settings related to completing external commands
# and additional completers

# external.exnable (bool)
# true: search for external commands on the Path
# false: disabling might be desired for performance if your path includes
#        directories on a slower filesystem
$env.config.completions.external.enable = true

# max_results (int): Limit the number of external commands retrieved from
# path to this value. Has no effect if `...external.enable` (above) is set to `false`
$env.config.completions.external.max_results = 50

# completer (closure with a |spans| parameter): A command to call for *argument* completions
# to commands (internal or external).
#
# The |spans| parameter is a list of strings representing the tokens (spans)
# on the current commandline. It is always a list of at least two strings - The
# command being completed plus the first argument of that command ("" if no argument has
# been partially typed yet), and additional strings for additional arguments beyond
# the first.
#
# This setting is usually set to a closure which will call a third-party completion system, such
# as Carapace.
#
# Note: The following is an over-simplified completer command that will call Carapace if it
# is installed. Please use the official Carapace completer, which can be generated automatically
# by Carapace itself. See the Carapace documentation for the proper syntax.
source ~/.cache/nu/carapace.nu

# --------------------
# Terminal Integration
# --------------------
# Nushell can output a number of escape codes to enable advanced features in Terminal Emulators
# that support them. Settings in this section enable or disable these features in Nushell.
# Features aren't supported by your Terminal can be disabled. Features can also be disabled,
#  of course, if there is a conflict between the Nushell and Terminal's implementation.

# use_kitty_protocol (bool):
# A keyboard enhancement protocol supported by the Kitty Terminal. Additional keybindings are
# available when using this protocol in a supported terminal. For example, without this protocol,
# Ctrl+I is interpreted as the Tab Key. With this protocol, Ctrl+I and Tab can be mapped separately.
$env.config.use_kitty_protocol = true

# osc2 (bool):
# When true, the current directory and running command are shown in the terminal tab/window title.
# Also abbreviates the directory name by prepending ~ to the home directory and its subdirectories.
$env.config.shell_integration.osc2 = true

# osc7 (bool):
# Nushell will report the current directory to the terminal using OSC 7. This is useful when
# spawning new tabs in the same directory.
$env.config.shell_integration.osc7 = true

# osc9_9 (bool):
# Enables/Disables OSC 9;9 support, originally a ConEmu terminal feature. This is an
# alternative to OSC 7 which also communicates the current path to the terminal.
$env.config.shell_integration.osc9_9 = false

# osc8 (bool):
# When true, the `ls` command will generate clickable links that can be launched in another
# application by the terminal.
# Note: This setting replaces the now deprecated `ls.show_clickable_links`
$env.config.shell_integration.osc8 = true

# osc133 (bool):
# true/false to enable/disable OSC 133 support, a set of several escape sequences which
# report the (1) starting location of the prompt, (2) ending location of the prompt,
# (3) starting location of the command output, and (4) the exit code of the command.

# originating with Final Term. These sequences report information regarding the prompt
# location as well as command status to the terminal. This enables advanced features in
# some terminals, including the ability to provide separate background colors for the
# command vs. the output, collapsible output, or keybindings to scroll between prompts.
$env.config.shell_integration.osc133 = true

# osc633 (bool):
# true/false to enable/disable OSC 633, an extension to OSC 133 for Visual Studio Code
$env.config.shell_integration.osc633 = true

# reset_application_mode (bool):
# true/false to enable/disable sending ESC[?1l to the terminal
# This sequence is commonly used to keep cursor key modes in sync between the local
# terminal and a remove SSH host.
$env.config.shell_integration.reset_application_mode = true

# bracketed_paste (bool):
# true/false to enable/disable the bracketed-paste feature, which allows multiple-lines
# to be pasted into Nushell at once without immediate execution. When disabled,
# each pasted line is executed as it is received.
# Note that bracketed paste is not currently supported on the Windows version of
# Nushell.
$env.config.bracketed_paste = true

# use_ansi_coloring (bool):
# true/false to enable/disable the use of ANSI colors in Nushell internal commands.
# When disabled, output from Nushell built-in commands will display only in the default
# foreground color.
# Note: Does not apply to the `ansi` command.
$env.config.use_ansi_coloring = true

# ----------------------
# Error Display Settings
# ----------------------

# error_style (string): One of "fancy" or "plain"
# Plain: Display plain-text errors for screen-readers
# Fancy: Display errors using line-drawing characters to point to the span in which the
#        problem occurred.
$env.config.error_style = "fancy"

# display_errors.exit_code (bool):
# true: Display a Nushell error when an external command returns a non-zero exit code
# false: Display only the error information printed by the external command itself
# Note: Core dump errors are always printed; SIGPIPE never triggers an error
$env.config.display_errors.exit_code = false

# display_errors.termination_signal (bool):
# true/false to enable/disable displaying a Nushell error when a child process is
# terminated via any signal
$env.config.display_errors.termination_signal = true

# -------------
# Table Display
# -------------
# footer_mode (string or int):
# Specifies when to display table footers with column names. Allowed values:
# "always"
# "never"
# "auto": When the length of the table would scroll the header past the first line of the terminal
# (int): When the number of table rows meets or exceeds this value
# Note: Does not take into account rows with multiple lines themselves
$env.config.footer_mode = 25

# table.*
# table_mode (string):
# One of: "default", "basic", "compact", "compact_double", "heavy", "light", "none", "reinforced",
# "rounded", "thin", "with_love", "psql", "markdown", "dots", "restructured", "ascii_rounded",
# or "basic_compact"
# Can be overridden by passing a table to `| table --theme/-t`
$env.config.table.mode = "default"

# index_mode (string) - One of:
# "never": never show the index column in a table or list
# "always": always show the index column in tables and lists
# "auto": show the column only when there is an explicit "index" column in the table
# Can be overridden by passing a table to `| table --index/-i`
$env.config.table.index_mode = "always"

# show_empty (bool):
# true: show "empty list" or "empty table" when no values exist
# false: display no output when no values exist
$env.config.table.show_empty = true

# padding.left/right (int): The number of spaces to pad around values in each column
$env.config.table.padding.left = 1
$env.config.table.padding.right = 1

# trim.*: The rules that will be used to display content in a table row when it would cause the
#         table to exceed the terminal width.
# methodology (string): One of "wrapping" or "truncating"
# truncating_suffix (string): The text to show at the end of the row to indicate that it has
#                             been truncated. Only valid when `methodology = "truncating"`.
# wrapping_try_keep_words (bool): true to keep words together based on whitespace
#                                 false to allow wrapping in the middle of a word.
#                                 Only valid when `methodology = wrapping`.
$env.config.table.trim = {
  methodology: "wrapping"
  wrapping_try_keep_words: true
}

# header_on_separator (bool):
# true: Displays the column headers as part of the top (or bottom) border of the table
# false: Displays the column header in its own row with a separator below.
$env.config.table.header_on_separator = false

# abbreviated_row_count (int or nothing):
# If set to an int, all tables will be abbreviated to only show the first <n> and last <n> rows
# If set to `null`, all table rows will be displayed
# Can be overridden by passing a table to `| table --abbreviated/-a`
$env.config.table.abbreviated_row_count

# footer_inheritance (bool): Footer behavior in nested tables
# true: If a nested table is long enough on its own to display a footer (per `footer_mode` above),
#       then also display the footer for the parent table
# false: Always apply `footer_mode` rules to the parent table
$env.config.table.footer_inheritance = false

alias nu-open = open
alias open = ^open
