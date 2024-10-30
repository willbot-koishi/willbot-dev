#!/usr/bin/env bash

CWD=$(pwd)
for WS in external/*; do
	cd $WS
	GIT_OUTPUT="$(git status)"
	[[ "$GIT_OUTPUT" =~ "无文件要提交" ]] || {
		echo -n "$WS "
	}
	cd "$CWD"
done
