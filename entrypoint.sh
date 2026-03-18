#!/bin/bash
set -e

chown -R openclaw:openclaw /data
chmod 700 /data

if [ ! -d /data/.linuxbrew ]; then
  cp -a /home/linuxbrew/.linuxbrew /data/.linuxbrew
fi

rm -rf /home/linuxbrew/.linuxbrew
ln -sfn /data/.linuxbrew /home/linuxbrew/.linuxbrew

if [ ! -d /data/.openclaw-hub ]; then
  cp -a /openclaw /data/.openclaw-hub
fi

rm -rf /openclaw
ln -sfn /data/.openclaw-hub /openclaw

exec gosu openclaw node src/server.js
