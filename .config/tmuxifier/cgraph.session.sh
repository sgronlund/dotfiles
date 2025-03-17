# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Uni/computer-graphics"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "cgraph"; then

    new_window "notes"
    run_cmd "vim lec*/*.md *.md"
    new_window "project"
    run_cmd "z project"
    new_window "assignments"
    run_cmd "z gltf_viewer && vim ."
    split_h 30
    select_pane 1
    run_cmd "z gltf_viewer"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
