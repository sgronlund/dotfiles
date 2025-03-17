# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Uni/advanced-computer-architecture"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "avdark"; then
  new_window "notes"
  new_window "labs"
  select_window "notes"
  run_cmd "vim ."
  select_window "labs"
  run_cmd "cd avdark-labs/"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
