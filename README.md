# PHP-FPM Docker Image

This repository provides a Docker image for PHP-FPM, designed for development and production environments requiring PHP 8.5 and common extensions.

## Build Arguments
- `wwwdatauid` (default: 1000): Set the UID for the `www-data` user to match your host system.

## Installed Extensions
- pdo
- pdo_pgsql
- zip
- intl
- bcmath
- imagick

## Installed Tools
- Composer
- Git

## Notes
- The image is suitable for use as a base for PHP web applications, especially those using PostgreSQL and requiring image processing or internationalization.
- Adjust the `wwwdatauid` build argument if you need to match file permissions with your host system.
