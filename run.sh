#!/bin/sh

# First make sure capistrano is installed
# if ! type cap &> /dev/null ; then
#     fail "capistrano was not found, make sure you have it installed"
# else
#     info "capistrano is available"
#     debug "cap version: $(cap --version)"
# fi

cap_command="bundle exec cap"
cap_working_path=""

# Parse some variable arguments
if [ -n "$WERCKER_CAP_STAGE" ] ; then
    cap_command="$cap_command $WERCKER_CAP_STAGE"
fi

if [ -n "$WERCKER_CAP_TASKS" ] ; then
    cap_command="$cap_command $WERCKER_CAP_TASKS"
else
    cap_command="$cap_command deploy"
fi

# Figure out the working directory
if [ -n "$WERCKER_CAP_PATH" ] ; then
  cap_working_path="$WERCKER_CAP_PATH"
else
  cap_working_path="$WERCKER_SOURCE_DIR"
fi

# Stop processing if the working path was not found
if [ ! -d "$cap_working_path" ] ; then
    fail "Unable to continue; Working directory was not found: $cap_working_path"
else
    info "Switching to path: $cap_working_path"
    cd $cap_working_path

    debug "$cap_command"
    $cap_command

    if [[ $? -ne 0 ]]
    then
        warn "$result"
        fail "cap command failed"
    else
        success "finished $cap_command"
    fi
fi