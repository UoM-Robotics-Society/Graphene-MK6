#ifndef DUMMY_H
#define DUMMY_H

#include "libgraphene.h"

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

typedef uint32_t b32;

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

typedef int8_t s8;
typedef int16_t s16;
typedef int32_t s32;
typedef int64_t s64;

typedef float f32;
typedef double f64;

#define ARRLEN(arr) (sizeof(arr) / sizeof((arr)[0]))

/* example graphene network interface */
enum __attribute__((packed)) graphene_net_packet_type {
	GRAPHENE_NET_PACKET_RESET,
};

struct graphene_net_packet {
	u8 type;
	u8 data[8];
};

#define GRAPHENE_NET_MAILBOX_SIZE 32

struct graphene_net {
	struct graphene_net_packet inbox[GRAPHENE_NET_MAILBOX_SIZE];
	struct graphene_net_packet outbox[GRAPHENE_NET_MAILBOX_SIZE];
	u8 inbox_head, inbox_tail, outbox_head, outbox_tail;
};

extern void graphene_net_init(struct graphene_net *self);
extern b32 graphene_net_try_push_packet(struct graphene_net *self, struct graphene_net_packet *packet);
extern b32 graphene_net_try_pop_packet(struct graphene_net *self, struct graphene_net_packet *out);

/* example graphene musician state interface */
enum graphene_loader_state {
	GRAPHENE_LOADER_STATE_RESET,
	GRAPHENE_LOADER_STATE_READY,
	GRAPHENE_LOADER_STATE_LOADING,
	_GRAPHENE_LOADER_STATE_COUNT,
};

struct graphene_loader;

typedef enum graphene_loader_state (*graphene_loader_state_handler)(struct graphene_loader *);

struct graphene_loader {
	enum graphene_loader_state state;
	graphene_loader_state_handler transitions[_GRAPHENE_LOADER_STATE_COUNT];
};

enum graphene_player_state {
	GRAPHENE_PLAYER_STATE_RESET,
	GRAPHENE_PLAYER_STATE_STOPPED,
	GRAPHENE_PLAYER_STATE_PLAYING,
	_GRAPHENE_PLAYER_STATE_COUNT,
};

struct graphene_player {
	u8 foo;
};

/* example graphene musician configuration interface */
struct graphene_configuration {
	u8 foo;
};

/* example graphene instrument interface */
struct graphene_instrument {
	u8 foo;
};

#endif /* DUMMY_H */
