#!/bin/sh
# For GOD so loved the world that He gave His only begotten Son
# That all who believe in Him should not perish but have everlasting life
# Simple shell-based filter. It is meant to be invoked as follows:
#       /path/to/script -f sender recipients...

# Localize these. The -G option does nothing before Postfix 2.3.
INSPECT_DIR=/tmp/
SENDMAIL="/usr/sbin/sendmail -G -i" # NEVER NEVER NEVER use "-t" here.

# Exit codes from <sysexits.h>
EX_TEMPFAIL=75
EX_UNAVAILABLE=69

# Clean up when done or when aborting.
trap "rm -f in.$$" 0 1 2 3 15

# Start processing.
cd $INSPECT_DIR || {
    echo $INSPECT_DIR does not exist; exit $EX_TEMPFAIL; }

cat >in.$$ || { 
    echo Cannot save mail to file; exit $EX_TEMPFAIL; }

# Specify your content filter here.
# filter <in.$$ || {
#   echo Message content rejected; exit $EX_UNAVAILABLE; }
#echo "$@" ALELUYA >| /tmp/pfix-aleluya

$SENDMAIL "$@" <in.$$

exit $?
