# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "vt25"; then

  # Create a new window inline within session layout definition.
  #new_window "misc"
  new_window "CISA"
  run_cmd "z computer-intensive-statistics-and-applications"
  new_window "Graph"
  run_cmd "z graph-theory"
  new_window "thesis"
  run_cmd "z thesis"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
