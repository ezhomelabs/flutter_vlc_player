
#ifndef HAICAM_LIBVLC_H
#define HAICAM_LIBVLC_H

#include <stdint.h>
#include <sys/types.h>

extern void* (*haicam_libvlc_play_callback)(uint32_t type, uint64_t accountId, uint64_t cameraId);

extern int (*haicam_libvlc_seek_callback)(void *opaque, uint64_t offset);

extern int (*haicam_libvlc_open_callback)(void *opaque, void **datap, uint64_t *sizep);

extern ssize_t (*haicam_libvlc_read_callback)(void *opaque, unsigned char *buf, size_t len);

extern void (*haicam_libvlc_close_callback)(void *opaque);

#endif