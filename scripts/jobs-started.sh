#!/usr/bin/env bash
set -Eeuo pipefail

# shellcheck source=runner/logger.sh
source logger.sh

log.debug "Running ARC Job Started Hooks"

for hook in /etc/arc/hooks/job-started.d/*; do
  log.debug "Running hook: $hook"
  "$hook" "$@"
done

sh /docker-login.sh > /dev/null
