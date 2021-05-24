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

---

[rclone]: https://rclone.org
