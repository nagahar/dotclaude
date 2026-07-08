#!/bin/sh
echo "start setup dot claude files"

p=`pwd -P`
echo "######start setup .claude######"
ln -s $p/CLAUDE.md ~/.claude/CLAUDE.md
ln -s $p/settings.json ~/.claude/settings.json
ln -s $p/instructions.md ~/.claude/instructions.json
echo "######finished setup .claude######"
