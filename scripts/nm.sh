#!/bin/bash

kitty --hold --class "netman" -e bash -c "echo -e 'Scanning wifi ...\n';
                        nmcli device wifi list;
                        echo -e '\nnmcli device wifi connect SSID/BSSID --ask';";


