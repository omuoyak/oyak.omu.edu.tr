#!/bin/bash
set -e

rm -f /oyak_omu_edu_tr/tmp/pids/server.pid

exec "$@"