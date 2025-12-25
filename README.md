This project is to create a Mini-Shell for me to explore low-level programming.


# Requirements

## 1. General Behavior

* The shell must display a prompt and continuously wait for user input (REPL loop).
* The shell must terminate gracefully when:

  * The user enters the `exit` command.
  * End-of-file is received (`Ctrl + D`) on an empty line.
* Empty or whitespace-only input must be ignored.
* The shell must not crash on invalid input.

## 2. Command Parsing and Tokenization

* User input must be tokenized into commands, arguments, and operators.
* The shell must correctly handle:

  * Words (command names and arguments)
  * Pipes (`|`)
  * Redirections (`<`, `>`, `>>`, `<<`)
  * Quoted strings (`'...'`, `"..."`)
* Quoting rules:

  * Single quotes (`'...'`) preserve literal content (no expansion).
  * Double quotes (`"..."`) allow variable expansion but preserve spaces.
  * Unclosed quotes must result in a syntax error.

## 3. Command Execution

* External commands must be executed using `fork()` and `execve()`.
* Commands must be resolved using the `PATH` environment variable unless a path is explicitly provided.
* Error handling:

  * Command not found → exit status `127`
  * Command found but not executable → exit status `126`
* The shell must correctly wait for all child processes to terminate.

## 4. Built-in Commands

The shell must implement the following built-in commands:

* `echo [-n]`
* `cd [path]`
* `pwd`
* `exit [status]`
* `export KEY=VALUE`
* `unset KEY`
* `env`

Behavior rules:

* Built-ins that modify shell state (`cd`, `export`, `unset`, `exit`) must execute in the **parent process** when no pipe is present.
* Built-ins executed as part of a pipeline must run in a child process.

## 5. Pipes

* The shell must support pipelines using the pipe operator (`|`).
* Output of one command must be passed as input to the next.
* The shell must correctly manage file descriptors:

  * Create `N-1` pipes for `N` commands.
  * Close unused file descriptors in all processes.
* The exit status of a pipeline must be the exit status of the **last command**.

## 6. Redirections

The shell must support:

* Input redirection (`<`)
* Output redirection (`>`)
* Output append redirection (`>>`)
* Here-documents (`<<`)

Rules:

* Redirections apply to the command in which they appear.
* Files must be created, truncated, or appended as required.
* A missing redirection target must produce a syntax error.
* Here-documents must read input until the specified delimiter is encountered.

## 7. Environment Variable Expansion

* The shell must support expansion of:

  * `$VAR` → environment variable value
  * `$?` → exit status of the last executed command or pipeline
* Expansion must respect quoting rules:

  * Disabled inside single quotes
  * Enabled inside double quotes
* Undefined variables must expand to an empty string.

## 8. Signal Handling

The shell must handle signals correctly:

* `Ctrl + C` (SIGINT):

  * Interrupts running commands.
  * At the prompt, clears the current line and displays a new prompt.
* `Ctrl + \` (SIGQUIT):

  * Ignored by the shell at the prompt.
  * Default behavior in child processes.
* `Ctrl + D`:

  * Exits the shell when no input is present.

## 9. Exit Status Management

* The shell must track and store the exit status of the last executed command.
* If a process terminates due to a signal, the exit status must reflect `128 + signal_number`.
* The special variable `$?` must always reflect the most recent exit status.

## 10. Memory and Resource Management

* The shell must not leak memory during normal execution.
* All dynamically allocated memory must be freed appropriately.
* File descriptors must be closed correctly to avoid resource leaks.
* Zombie processes must not be left behind.

## 11. Error Handling

* Syntax errors must be reported without executing partial commands.
* System call failures (`fork`, `pipe`, `open`, etc.) must be handled gracefully.
* Error messages should be clear and consistent.

If you want, next I can:

* 🔹 Rewrite this to **match a strict university rubric**
* 🔹 Convert this into **42-style Minishell wording**
* 🔹 Add a **“Limitations”** or **“Out of Scope”** section
* 🔹 Produce a **test cases section** that maps directly to these requirements

# Acquired Skills

* Systems programming in C on Unix/Linux
* Process creation and management using `fork`, `execve`, and `waitpid`
* Inter-process communication using pipes
* File descriptor manipulation and I/O redirection
* Implementation of shell built-in commands
* Command parsing, tokenization, and syntax validation
* Handling quoted strings and environment variable expansion
* Signal handling for interactive programs (`SIGINT`, `SIGQUIT`, EOF)
* Exit status tracking and error code management
* Memory management and resource cleanup in C
* Debugging runtime issues involving processes and file descriptors
* Modular software design and code organization
* Practical understanding of operating system concepts