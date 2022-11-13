#include "../../src/include/haicam_libvlc.h"
#import "HaicamInputStream.h"

void* (*haicam_libvlc_play_callback)(uint32_t type, uint64_t accountId, uint64_t cameraId) = NULL;

int (*haicam_libvlc_seek_callback)(void *opaque, uint64_t offset) = NULL;

int (*haicam_libvlc_open_callback)(void *opaque, void **datap, uint64_t *sizep) = NULL;

ssize_t (*haicam_libvlc_read_callback)(void *opaque, unsigned char *buf, size_t len) = NULL;

void (*haicam_libvlc_close_callback)(void *opaque) = NULL;


@implementation HaicamInputStream
{
    id <NSStreamDelegate> delegate;
    NSStreamStatus streamStatus;
    void* haicamObj;
}

@synthesize streamStatus;

#pragma mark Object lifecycle

- (instancetype)initWithType: (int)type accountId: (uint64_t)accountId cameraId: (uint64_t)cameraId
{
    self = [super init];
    if (self) {
        
        [self setDelegate:self];

        self.streamStatus = NSStreamStatusNotOpen;

        haicamObj = haicam_libvlc_play_callback(type, accountId, cameraId);
    }

    return self;
}

#pragma mark NSStream subclass methods

- (void)open {
    haicam_libvlc_open_callback(haicamObj, NULL, NULL);
    streamStatus = NSStreamStatusOpen;
}

- (void)close {
    haicam_libvlc_close_callback(haicamObj);
    streamStatus = NSStreamStatusClosed;
}

- (id <NSStreamDelegate> )delegate {
    return delegate;
}

- (void)setDelegate:(id<NSStreamDelegate>)aDelegate {
    if (aDelegate == nil) {
        delegate = self;
    }
    else {
        delegate = aDelegate;
    }
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode {

}

- (void)removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode {

}

- (id)propertyForKey:(NSString *)key {
    return nil;
}

- (BOOL)setProperty:(id)property forKey:(NSString *)key {
    return YES;
}

#pragma mark NSInputStream subclass methods

- (NSInteger)read:(uint8_t *)buffer maxLength:(NSUInteger)len {
    return haicam_libvlc_read_callback(haicamObj, buffer, len);
}

- (BOOL)getBuffer:(uint8_t **)buffer length:(NSUInteger *)len {
    return NO;
}

- (BOOL)hasBytesAvailable {
    return YES;
}


#pragma mark NSStreamDelegate methods

- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode {

    switch (eventCode) {
        case NSStreamEventOpenCompleted:
            break;

        case NSStreamEventHasBytesAvailable:
            break;

        case NSStreamEventErrorOccurred:
            break;
            
        case NSStreamEventEndEncountered:
            break;
            
        case NSStreamEventHasSpaceAvailable:
            break;
            
        default:
            break;
    }
}

@end