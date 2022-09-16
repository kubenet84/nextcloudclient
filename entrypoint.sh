#!/bin/sh
env >> /etc/environment
# execute CMD
echo [ENTRYPOINT] Init Conainer and call "$@" as service
exec "$@"