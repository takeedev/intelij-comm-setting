#!/usr/bin/env sh

config_path_last_version=$(ls -d $HOME/AppData/Roaming/JetBrains/IdeaIC* | sort -V | tail -n 1)
echo "Latest version: $config_path_last_version"


curl -k https://raw.githubusercontent.com/takeedev/setting-intelij-comm/refs/heads/main/config/options/editor.xml -o "$config_path_last_version/options/editor_Test_Git.xml"