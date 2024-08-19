# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "$HOME/Desktop/jobget.nosync/purge-staging-service"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "purge-script"; then
  new_window "code"
  run_cmd "n"
  select_pane 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
