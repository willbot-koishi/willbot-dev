#!/usr/bin/env bash

CWD=$(pwd)
for WS in external/*; do
	cd $WS
	GIT_OUTPUT="$(git status)"
	[[ "$GIT_OUTPUT" =~ "无文件要提交" ]] || {
		if [[ "$1" == i ]]; then
			while true; do
				clear
				echo -n "What to do with $WS? (d=diff/D=~cached/c=commit/q=quit/n=next) "
				read -n 1 res; echo
				case $res in
					(q) exit 0;;
					(d) git diff;;
					(D) git diff --cached;;
					(c) git add .
						echo -n "Commit message: "
						read msg
						git commit -m "$msg"
						git log -1 HEAD
						echo -n "Push? (y/n) "
						read -n 1 res; echo
						[[ "$res" = y ]] && git push
						;;
					(*) break
				esac
			done
		else
			echo -n "$WS "
		fi
	}
	cd "$CWD"
done
