#!/bin/sh
# MacProtector Removal Tool (Super-Simple) 1.0 - http://www.icrontic.com/
# (C) 2011 All Rights Reserved, Phillip R. Jaenke (phil@icrontic.com)
# 
# LICENSE IS AS FOLLOWS:
# - This software is completely free to use or redistribute for personal use, 
# HOWEVER:
# -- It must retain the above copyright notice and reference to Icrontic!
# - This software is completely free to use or redistribute for commercial use,
# HOWEVER:
# -- It must retain the above copyright notice and reference to Icrontic!
# -- It must be disclosed to users that this utility was used to remove the 
#    infection!
# ALL WARRANTIES EXPRESSED OR IMPLIED ARE SPECIFICALLY DISCLAIMED. 
# YOU USE THIS UTILITY AT YOUR OWN RISK. DATA LOSS MAY RESULT FROM IMPROPER USE
# OR EVEN PROPER USE IN RARE CASES. NEITHER PHIILLIP R. JAENKE NOR ICRONTIC 
# ACCEPT OR MAY BE HELD LIABLE FOR ANY DAMAGES RESULTING FROM THE USE OF 
# THIS TOOL.
#

PROTECTOR=MacProtector
DEFENDER=MacDefender

# 1) Locate and terminate processes. 
for i in `ps ax |grep $PROTECTOR |grep -v grep |grep -v Clean_Mac |awk '{print $1}'`; do
	echo "MacProtector malware FOUND: Process IDs $i"
	kill -9 $i
done
for i in `ps ax |grep $DEFENDER |grep -v grep |grep -v Clean_Mac |awk '{print $1}'`; do
	echo "MacDefender malware FOUND: Process IDs $i - terminating!"
	kill -9 $i
done

# 2) Locate and remove the installation.
if [ -d /Applications/$PROTECTOR.app ]; then
	echo "MacProtector malware installed at: /Applications/$PROTECTOR.app - REMOVING"
	rm -rf /Applications/$PROTECTOR.app
fi
if [ -d /Applications/$DEFENDER.app ]; then
	echo "MacDefender malware installed at: /Applications/$DEFENDER.app - REMOVING"
	rm -rf /Applications/$DEFENDER.app
fi

# Search deeper as a preventative.
echo "Performing a deeper scan to ensure there are no other installations."
echo "Seriously though: this can take a while. So go grab some coffee."
sleep 15

# This can take a LONG time...
 / -name $PROTECTOR.app >& /dev/null > /tmp/malware_alternate
if [ -f /tmp/malware_alternate ]; then
	for i in `cat /tmp/malware_alternate`; do
		echo "Found $PROTECTOR installed at $i - removing."
		rm -rf $i
	done
	rm /tmp/malware_alternate
fi
 / -name $DEFENDER.app >& /dev/null > /tmp/malware_alternate
if [ -f /tmp/malware_alternate ]; then
	for i in `cat /tmp/malware_alternate`; do
		echo "Found $DEFENDER installed at $i - removing"
		rm -rf $i
	done
	rm /tmp/malware_alternate
fi

# 3) Clean it out of Startup.
# Relies on Clean_MacProtector_Login.scpt (AppleScript)
/usr/bin/osascript Clean_MacProtector_Login.scpt

# 4) Clean out the installer so it can't easily come back.
echo "Locating and deleting the installation packages."
for i in `ls /Users/`; do
	 /Users/$i -name MacProtector.mpkg* -exec rm -rf {} \;
	 /Users/$i -name Mac-Protector.mpkg* -exec rm -rf {} \;
	 /Users/$i -name Mac\ Protector.mpkg* -exec rm -rf {} \;
	 /Users/$i -name MacDefender.mpkg* -exec rm -rf {} \;
	 /Users/$i -name Mac-Defender.mpkg* -exec rm -rf {} \;
	 /Users/$i -name Mac\ Defender.mpkg* -exec rm -rf {} \;
done

# Done!
echo ""
echo "MacProtector and MacDefender malware has been removed from your system."
echo ""
echo "Thanks for using the MacDefender/MacProtector Removal Tool from Icrontic!"
echo "Come say hi to us at http://www.icrontic.com/"