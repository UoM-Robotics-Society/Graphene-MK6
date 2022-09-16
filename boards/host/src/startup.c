#include "host.h"

void startup(void) {
	/* TODO: board initialisation */

	/* program startpoint */
	kmain();

	/* TODO: reset board if program ends? */
	while (1);
}

int main(int argc, char **argv) {
	(void)argc;
	(void)argv;

	startup();

	return 0;
}
