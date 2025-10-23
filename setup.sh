#!/usr/bin/env sh

config_path_last_version=$(
  ls -d \
    "$HOME/AppData/Roaming/JetBrains/"{IdeaI*,IntelliJIdea*} \
    "$HOME"/Library/Application\ Support/JetBrains/"{IdeaI*,IntelliJIdea*} \
    2>/dev/null | sort -V | tail -n 1
)

echo "Latest version: $config_path_last_version"

options_path=$config_path_last_version/options
echo "$options_path"
mkdir -p $options_path
################################################################### config ##################################################################
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/colors.scheme.xml -o "$options_path/colors.scheme.xml"
status1=$?
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/editor-font.xml -o "$options_path/editor-font.xml"
status2=$?
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/editor.xml -o "$options_path/editor.xml"
status3=$?
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/ide.general.xml -o "$options_path/ide.general.xml"
status4=$?
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/laf.xml -o "$options_path/laf.xml"
status5=$?
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/postfixTemplates.xml -o "$options_path/postfixTemplates.xml"
status6=$?
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/templates.xml -o "$options_path/templates.xml"
status7=$?
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/ui.lnf.xml -o "$options_path/ui.lnf.xml"
status8=$?
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/terminal.xml -o "$options_path/terminal.xml"
status9=$?
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/terminal-font.xml -o "$options_path/terminal-font.xml"
status10=$?

path_windows=$options_path/windows
mkdir -p $path_windows
curl -k https://raw.githubusercontent.com/takeedev/intelij-comm-setting/refs/heads/main/config/options/windows/keymap.xml -o "$path_windows/keymap.xml"
status11=$?

path_mac=$options_path/mac
mkdir -p $path_mac
curl -k https://raw.githubusercontent.com/takeedev/intelij-comm-setting/refs/heads/main/config/options/mac/keymap.xml -o "$path_mac/keymap.xml"
status12=$?

echo "start template"
template_path=$config_path_last_version/templates
mkdir -p $template_path
# template
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/templates/Java.xml -o "$template_path/Java.xml"
status13=$?

echo "start keymaps"
keymap=$config_path_last_version/keymaps
#keymap
mkdir -p $keymap
echo $keymap
ls -ld "$keymap"
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/keymaps/Windows%20copy.xml -o "$keymap/Windows copy.xml"
status14=$?

if [ $status1 -eq 0 ] && [ $status2 -eq 0 ] && [ $status3 -eq 0 ] && [ $status4 -eq 0 ] && [ $status5 -eq 0 ] \
 && [ $status6 -eq 0 ] && [ $status7 -eq 0 ] && [ $status8 -eq 0 ] && [ $status9 -eq 0 ] && [ $status10 -eq 0 ] \
 && [ $status11 -eq 0 ] && [ $status12 -eq 0 ] && [ $status13 -eq 0 ] && [ $status14 -eq 0 ]; then
    echo "All downloads successful!"
else
    echo "One or more downloads failed!"
    [ $status1 -ne 0 ] && echo "colors.scheme.xml download failed!"
    [ $status2 -ne 0 ] && echo "editor-font.xml download failed!"
    [ $status3 -ne 0 ] && echo "editor.xm download failed!"
    [ $status4 -ne 0 ] && echo "ide.general.xml download failed!"
    [ $status5 -ne 0 ] && echo "laf.xml download failed!"
    [ $status6 -ne 0 ] && echo "postfixTemplates.xml download failed"
    [ $status7 -ne 0 ] && echo "templates.xml download failed!"
    [ $status8 -ne 0 ] && echo "ui.lnf.xml download failed!"
    [ $status9 -ne 0 ] && echo "terminal.xml download failed!"
    [ $status10 -ne 0 ] && echo "terminal-font.xml download failed!"
    [ $status11 -ne 0 ] && echo "keymap.xml windows download failed!"
    [ $status12 -ne 0 ] && echo "keymap.xml mac download failed!"
    [ $status13 -ne 0 ] && echo "Java.xml download failed"
    [ $status14 -ne 0 ] && echo "Windows copy.xml download failed!"
fi