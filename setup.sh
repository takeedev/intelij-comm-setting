config_path_last_version=$(ls -d /mnt/c/Users/USER/AppData/Roaming/JetBrains/IdeaIC* | sort -V | tail -n 1)
echo "Latest version: $config_path_last_version"

cp testfile.sh $config_path_last_version/options

for check in $config_path_last_version/options/testfi*
do
echo "Check file copy : $check"
done