#!/bin/bash
# Provides a cleaner output for Valheim server platforms on Linux

# Your log file location
logloc='/path/to/your/valheimlog.txt'

# Colors tput
magen="$(tput setaf 5)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
red="$(tput setaf 1)"
cyan="$(tput setaf 6)"
grey="$(tput setaf 240)"
def="$(tput sgr0)"

clear
# You can also replace the initial command with:
# journalctl -f -u valheimserver.service
# to tail systemd log
tail -f $logloc | \
        grep --line-buffered -v '^(Filename' `# Remove redundant lines` | \
        grep --line-buffered -v 'Destroying abandoned' | \
        grep --line-buffered -v 'Disposing socket' | \
        grep --line-buffered -v 'Closing socket 0' | \
        grep --line-buffered -v 'k_ESteam' | \
        grep --line-buffered -v 'k_EResult' | \
        grep --line-buffered -v 'Steamworks' | \
        \grep --line-buffered "\S" | \
        sed -e "s/\s*(Find.*//" \
        -e 's/\(\.[0-9][0-9][0-9]\)[0-9]*/\1/g' \
        -e 's/ \{1,\}/ /g' `# Delete lines after this if you only need cleaner logs without colour formatting`\
        -e "s,\(../../.... ..:..:..:\),${cyan}\1${def}," `# Color formatting`\
        -e "s,\(World saved.*\),${magen}\1${def}," \
        -e "s,\(Got session request.*\),${green}\1${def}," \
        -e "s,\(Got handshake.*\),${green}\1${def}," \
        -e "s,\(Got character ZDOID from.*\),${green}\1${def}," \
        -e "s,\(Server: New peer.*\),${green}\1${def}," \
        -e "s,\(Connections [0-9] ZDOS.*\),${yellow}\1${def}," \
        -e "s,\(RPC_Disconnect.*\),${red}\1${def}," \
        -e "s,\(Peer [0-9]*.*wrong password\),${red}\1${def}," \
        -e "s,\(Closing socket [0-9].*\),${red}\1${def}," \
        -e "s,\(Unloading.*\),${grey}\1${def}," \
        -e "s,\(Total:.*\),${grey}\1${def}," \