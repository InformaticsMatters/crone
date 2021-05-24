#!/usr/bin/env sh

# A shell script that synchronises the a local directory ($SOURCE)
# with the configured remote "target" and destination. This is expected to run
# at regular intervals driven by cron (typically daily at 2AM).

rclone sync ${LOCAL} target:"${REMOTE}" --progress
