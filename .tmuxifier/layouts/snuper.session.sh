# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "$HOME/Desktop/projects.nosync/snuper"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "snuper"; then
  # Create a new window inline within session layout definition.
  new_window "server_aws"
  run_cmd "cd ./server_aws"
  new_window "web_aws"
  run_cmd "cd ./web_aws"
  select_window 0
  run_cmd "n"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
