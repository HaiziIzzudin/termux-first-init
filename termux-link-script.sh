device_model=$(termux-info | awk '/^Device model:/{getline; gsub(/^[ \t]+|[ \t]+$/,""); print; exit}')
