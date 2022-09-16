#include "dummy.h"

static struct graphene_net network;

struct graphene_loader loader;
struct graphene_player player;

void intrument_main(void) {
	graphene_net_init(&network);

	while (1) {

	}
}

void graphene_net_init(struct graphene_net *self) {
	(void)self;
	/* TODO: implement */
}

b32 graphene_net_try_push_packet(struct graphene_net *self, struct graphene_net_packet *packet) {
	(void)self;
	(void)packet;
	/* TODO: implement */
	return true;
}

b32 graphene_net_try_pop_packet(struct graphene_net *self, struct graphene_net_packet *out) {
	(void)self;
	(void)out;
	/* TODO: implement */
	return true;
}
