# Cleaner Valheim Log Output for \*Nix servers
Provides cleaner output log tailing for monitoring purposes.

*Does not support third-party mods which change the log output, but you can modify if needed.*

## Usage:
Change the `logloc='/path/to/your/valheimlog.txt'` var to represent the location of your log file. (logs are produced by enabling the `-logfile somelog.txt` flag to your server executable) ***or*** you can also pipe systemd logging if you've installed the server as a systemd service by replacing `tail -f $logloc` with:

`journalctl -f -u yourvalserver.service` (@nimdy's script calls this service `valheimserver.service` by default). In this case, you can also delete lines below the commented section to produce a cleaner log file of journal by appending `>> cleanerlog.txt` 

You may need to make the script executable: `chmod +x cleaneroutput.sh`

## Example:
Logs **after:**

![GitHub Logo](https://raw.githubusercontent.com/ckbaudio/valheim-clean-logs/main/screenie2.png)

Logs **before:**

![GitHub Logo](https://raw.githubusercontent.com/ckbaudio/valheim-clean-logs/main/screenie1.png)
