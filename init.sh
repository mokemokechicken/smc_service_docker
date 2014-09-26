#!/bin/sh

rm -f /application/smcwebservice/target/universal/stage/RUNNING_PID
exec supervisord -n
