if [ "$(cat /etc/*-release | grep ID | head -1 | awk -F= '{print $2}')" = "Ubuntu" ]; then
    if [ -n "$(dpkg -l | grep -i qualys)" ]; then
        echo "Qualys is already installed in this Ubuntu."
    else
        echo "Qualys is not installed in this Ubuntu machines. Proceeding with the installation."
        sudo wget -P /tmp https://downloads.company.com/scanners/qualys/qualys-cloud-agent-linux_ubuntu-x_64_v5.9.0-31.deb && sudo dpkg -i /tmp/qualys-cloud-agent-linux_ubuntu-x_64_v5.9.0-31.deb && sudo /usr/local/qualys/cloud-agent/bin/qualys-cloud-agent.sh ActivationId=[Your activation ID]
        echo "Cleaning up installation..."
        sudo rm /tmp/qualys-cloud-agent-linux_ubuntu-x_64_v5.9.0-31.deb
    fi
elif [ "$(cat /etc/*-release | grep ID | head -1 | awk -F= '{print $2}')" = "Linux" ]; then
    if [ -n "$(rpm -qa | grep -i qualys)" ]; then
        echo "Qualys is already installed in this Linux."
    else
        echo "Qualys is not installed in this Linux machines. Proceeding with the installation."
        sudo rpm -ivh https://downloads.company.com/scanners/qualys/qualys-cloud-agent-linux-x_64_v5.9.0-31.rpm && sudo /usr/local/qualys/cloud-agent/bin/qualys-cloud-agent.sh ActivationId=[Your activation ID]
    fi
elif [ "$(cat /etc/*-release | grep ID | head -1 | awk -F= '{print $2}')" = '"amzn"' ]; then
    if [ -n "$(rpm -qa | grep -i qualys)" ]; then
        echo "Qualys is already installed in this Amzn Linux."
    else
        echo "Qualys is not installed in this Amzn Linux machines. Proceeding with the installation."
        sudo rpm -ivh https://downloads.company.com/scanners/qualys/qualys-cloud-agent-linux-x_64_v5.9.0-31.rpm && sudo /usr/local/qualys/cloud-agent/bin/qualys-cloud-agent.sh ActivationId=[Your activation ID]
    fi
fi