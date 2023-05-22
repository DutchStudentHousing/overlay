#!/bin/sh
pwgen -Bs1 12 | docker secret create postgres-passwd -