# crone

[![build](https://github.com/informaticsmatters/crone/actions/workflows/build.yaml/badge.svg)](https://github.com/informaticsmatters/crone/actions/workflows/build.yaml)
[![build latest](https://github.com/informaticsmatters/crone/actions/workflows/build-latest.yaml/badge.svg)](https://github.com/informaticsmatters/crone/actions/workflows/build-latest.yaml)
[![build tag](https://github.com/informaticsmatters/crone/actions/workflows/build-tag.yaml/badge.svg)](https://github.com/informaticsmatters/crone/actions/workflows/build-tag.yaml)
[![build stable](https://github.com/informaticsmatters/crone/actions/workflows/build-stable.yaml/badge.svg)](https://github.com/informaticsmatters/crone/actions/workflows/build-stable.yaml)

![GitHub](https://img.shields.io/github/license/informaticsmatters/crone)

![GitHub tag (latest SemVer pre-release)](https://img.shields.io/github/v/tag/informaticsmatters/crone?include_prereleases)

"**CR**on-rcl**ONE**"

...a simple container image based on [rclone] that provides cron-driven
execution of the `rclone sync` command for a container-local directory
against an environment-defined remote S3 target.

>   A utility initially designed to synchronise (backup) a discourse local
    directory (of backups) against a remote S3 path.

See the Dockerfile for environment configuration.

## Target (remote) path
The target (remote) path is expected to exist in the S3 service.
Assuming you have valid environment variables, you can create the directory
with the `mkdir` rclone command in the container: -

    # rclone mkdir target:discourse-backups/development

You can list objects in the path with `ls`: -

    # rclone ls target:discourse-backups/development

You can get a list of all commands with: -

    # rclone

## Changing the synchronisation time (Kubernetes)
Synchronisation is controlled by the root crontab file, written to
`/etc/crontabs/root` via the Dockerfile. Our build invokes the backup at
02:03 every morning. If you want to change this you could use a Kubernetes
**ConfigMap** and replace the root crontab with your own file.

---

[rclone]: https://rclone.org
