#include "imxrt1060.h"

void startup(void) {
	/* TODO: board initialisation */

	kmain();

	/* TODO: handle board reset? */
	while (1);
}
