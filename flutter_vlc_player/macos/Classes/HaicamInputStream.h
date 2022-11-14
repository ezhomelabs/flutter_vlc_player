#import <Foundation/Foundation.h>

@interface HaicamInputStream : NSInputStream <NSStreamDelegate>

- (instancetype)initWithType: (int)type accountId: (uint64_t)accountId cameraId: (uint64_t)cameraId;

@end