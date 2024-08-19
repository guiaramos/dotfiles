# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "$HOME/Desktop/jobget.nosync/user-service"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "user-service"; then
  # Create a new window inline within session layout definition.
  new_window "code"
  split_v 20
  select_pane 0
  run_cmd "n"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
