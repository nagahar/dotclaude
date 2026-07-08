echo "######start setup .claude######"
mklink "c:%HOMEPATH%\.claude\CLAUDE.md" "%~dp0\CLAUDE.md"
mklink "c:%HOMEPATH%\.claude\setting.json" "%~dp0\setting.json"
echo "######finished setup .claude######"
pause
