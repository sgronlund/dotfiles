# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Uni/DTE"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "digtek"; then
    new_window "notes"
    run_cmd "z slides/ && vim ."
    new_window "problems"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
