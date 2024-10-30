#!/usr/bin/env bash

CWD=$(pwd)
for WS in external/*; do
	echo $WS
	cat $WS/package.json | jq .koishi.service
done
