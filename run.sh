#!/bin/sh

# First make sure capistrano is installed
# if ! type cap &> /dev/null ; then
#     fail "capistrano was not found, make sure you have it installed"
# else
#     info "capistrano is available"
#     debug "cap version: $(cap --version)"
# fi

cap_command="bundle exec cap"

# Parse some variable arguments
if [ -n "$WERCKER_CAP_STAGE" ] ; then
    cap_command="$cap_command $WERCKER_CAP_STAGE"
fi

if [ -n "$WERCKER_CAP_TASKS" ] ; then
    cap_command="$cap_command $WERCKER_CAP_TASKS"
else
    cap_command="$cap_command deploy"
fi

debug "$cap_command"
$cap_command

if [[ $? -ne 0 ]]; then
    warn "$result"
    fail "cap command failed"
else
    success "finished $cap_command"
fi
