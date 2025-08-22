#!/usr/bin/env sh

config_path_last_version=$(ls -d "$HOME/AppData/Roaming/JetBrains/"{IdeaI*,IntelliJIdea*} 2>/dev/null | sort -V | tail -n 1)
echo "Latest version: $config_path_last_version"

options_path="$config_path_last_version"/options
echo "$options_path"
mkdir -p $options_path
# config
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

template_path="$config_path_last_version"/templates
mkdir -p $template_path
# template
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/templates/Java.xml -o "$template_path/Java.xml"
status8=$?

keymap="$config_path_last_version/keymaps"
#keymap
mkdir -p keymap
curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/keymaps/'Windows copy.xml' -o "$keymap/Java.xml"
status9=$?

if [ $status1 -eq 0 ] && [ $status2 -eq 0 ] && [ $status3 -eq 0 ] && [ $status4 -eq 0 ] && [ $status5 -eq 0 ] && [ $status6 -eq 0 ] && [ $status7 -eq 0 ] && [ $status8 -eq 0 ] && [ $status9 -eq 0 ]; then
    echo "All downloads successful!"
else
    echo "One or more downloads failed!"
    [ $status1 -ne 0 ] && echo "colors.scheme.xml download failed!"
    [ $status2 -ne 0 ] && echo "editor-font.xml download failed!"
    [ $status3 -ne 0 ] && echo "editor.xm download failed!"
    [ $status4 -ne 0 ] && echo "ide.general.xml download failed!"
    [ $status5 -ne 0 ] && echo "laf.xml download failed!"
    [ $status6 -ne 0 ] && echo "templates.xml download failed!"
    [ $status7 -ne 0 ] && echo "ui.lnf.xml download failed!"
    [ $status8 -ne 0 ] && echo "Java.xml download failed!"
    [ $status8 -ne 0 ] && echo "Windows copy.xml download failed!"

fi

# curl -s https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/install-plugin.sh | /usr/bin/env sh