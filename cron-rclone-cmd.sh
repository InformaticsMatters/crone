#!/usr/bin/env sh

# A shell script that synchronises the a local directory (/data) and optional
# path with the configured remote "target" and destination.
# This is expected to run at regular intervals driven by cron
# (typically daily at 2AM).

# Has the user provided a data sub-path?
LOCAL_PATH=/data
if [ -n "${DATA_PATH}" ]; then LOCAL_PATH=/data/$DATA_PATH; fi

rclone sync "${LOCAL_PATH}" target:"${REMOTE_PATH}" --progress
