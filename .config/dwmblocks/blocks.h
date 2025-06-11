//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {"", "/home/thomcol/scripts/status_network.sh", 300, 0},
    {"", "/home/thomcol/scripts/status_battery.sh", 300, 0},
	{"", "date '+%A, %B %d %I:%M %p'", 60, 0}
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
