#!/bin/bash
set -e

export LOGDIR=/var/log/airnotifier
export LOGFILE=$LOGDIR/airnotifier.log
export LOGFILE_ERR=$LOGDIR/airnotifier.err

sed -i "s/mongouser = \"root\"/mongouser = \"${MONGO_USER}\"/g" ./config.py
sed -i "s/mongopass = \"pass\"/mongopass = \"${MONGO_PASS}\"/g" ./config.py
sed -i "s/mongohost = \"localhost\"/mongohost = \"${MONGO_SERVER}\"/g" ./config.py
sed -i "s/mongoport = \"27017\"/mongoport = \"${MONGO_PORT}\"/g" ./config.py

if [ ! -f "$LOGFILE" ]; then
  touch "$LOGFILE"
fi

if [ ! -f "$LOGFILE_ERR" ]; then
  touch "$LOGFILE_ERR"
fi

echo "Installing AirNotifier ..."
pipenv run ./install.py
echo "Starting AirNotifier ..."
pipenv run ./app.py >> "$LOGFILE" 2>> "$LOGFILE_ERR"
