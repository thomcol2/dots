/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[BG] =     "black",     /* background */
	[INIT] =   "#4f525c",   /* after initialization */
	[INPUT] =  "#005577",   /* during input */
	[FAILED] = "#CC241D",   /* wrong password */
};

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
    { "color0", STRING, &colorname[BG] },
    { "color1", STRING, &colorname[INIT] },
    { "color4", STRING, &colorname[INPUT] }
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;

/*
* Shapes:
* 0: square
* 1: circle
*/
static const int shape = 1;
/* size of square in px */
static const int shapesize = 50;
static const int shapegap = 35;
