ARG from=rclone/rclone:1.55.1
FROM ${from}

# A cron-driven rclone that syncs a dirctory in the container
# with a remote (S3) service.

# An empty rclon.conf is installed (later).
# The container is expected to run as root
# and the user is expected to replace one or more
# of the following S3 "target" environment variables
# to satisfy their remote rclone "target" service,
# i.e. at least all those wits SetMe values!

ENV RCLONE_CONFIG_TARGET_TYPE s3
ENV RCLONE_CONFIG_TARGET_PROVIDER SetMe
ENV RCLONE_CONFIG_TARGET_ACCESS_KEY_ID SetMe
ENV RCLONE_CONFIG_TARGET_SECRET_ACCESS_KEY SetMe
ENV RCLONE_CONFIG_TARGET_ENDPOINT SetMe
ENV RCLONE_CONFIG_TARGET_ENV_AUTH false
ENV RCLONE_CONFIG_TARGET_ACL public-read

# Local and remote paths,
# used in 'cron-rclone-cmd.sh'.
# The local directory is syncrhonised with the remote path.
WORKDIR /data
ENV LOCAL /data
ENV REMOTE discourse-backup/production

# An empty rclon.conf (to avoid warnings about it being absent)
COPY rclone.conf /config/rclone/rclone.conf
# The rclone script - synchronises SOURCE to target:DESTINATION
COPY cron-rclone-cmd.sh /usr/local/bin/cron-rclone-cmd.sh
RUN chmod 0755 /usr/local/bin/cron-rclone-cmd.sh
# A default crontab (2AM executiuon of 'cron-rclone-cmd.sh')
COPY root-crontab /etc/crontabs/root

ENTRYPOINT []
CMD ['crond', '-l 2', '-f']
