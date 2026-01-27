# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Uni/master-thesis"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "thesis"; then
    # Create a new window inline within session layout definition.
    new_window "main"
    run_cmd "nvim ."
    split_v 15
    select_pane 1
    run_cmd "z src "
    split_h 50
    select_pane 2
    run_cmd "z data "
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
