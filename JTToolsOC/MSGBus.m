//
//  MSGBus.m
//
//
//  Created by TabZhou on 26/06/2017.
//  Copyright © 2017 Atlas. All rights reserved.
//

#import "MSGBus.h"

#define M MSGBus

#pragma mark - Internal Class

@interface __MSG: NSObject
@property (weak,nonatomic) id<NSObject> observer;
@property (weak,nonatomic) id target;
@property (copy,nonatomic) NSString *name;
@property (assign,nonatomic,readonly,getter=isInvalid)BOOL invalid;
- (instancetype)initWithObserVer:(id<NSObject>) observer target:(id)target name:(NSString*)name;
@end

@implementation __MSG
- (instancetype)initWithObserVer:(id<NSObject>)observer target:(id)target name:(NSString *)name{
    self = [super init];
    if (self) {
        _observer = observer;
        _target = target;
        _name = [name copy];
    }
    return self;
}

- (BOOL)isInvalid {
    return ( self.target == nil
            || self.observer == nil
            || self.name == nil
            || [self.name isEqualToString:@""]);
}
@end

#pragma mark - Class

@implementation MSGBus

static NSMutableSet *_msgs;

#pragma mark Send

+ (void)send:(NSString *)name {
    [M send:name from:nil];

}

+ (void)send:(NSString *)name from:(nullable id)sender {
    [M send:name from:sender info:[[NSDictionary alloc] init]];
}

+ (void)send:(NSString *)name from:(nullable id)sender info:(NSDictionary *)info {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:sender userInfo:info];
}

#pragma mark Received

+ (void) onReceived:(NSString *)name target:(id<NSObject>)target handler:(void(^)(NSDictionary* info, id sender))handler {
    
     id<NSObject> observer = [[NSNotificationCenter defaultCenter]
         addObserverForName:name
         object:nil
         queue:[NSOperationQueue mainQueue]
         usingBlock:^(NSNotification * _Nonnull note) {
             handler([note.userInfo copy],note.object);
         }];
    
    NSAssert(target != nil, @"MessageBus 'onReceived' method: must has a target");
    
    [M _register:[[__MSG alloc] initWithObserVer:observer target:target name:name]];
    
}

#pragma mark Register & Unregister

+ (void) _register:(__MSG *)observer {
    if (_msgs == nil) {
        _msgs = [[NSMutableSet alloc] init];
    }
    [_msgs addObject:observer];
    
}

+ (void) unregisterInvalidMSG {
    
    NSMutableSet *deleteItem = [[NSMutableSet alloc] init];
    
    for (__MSG *msg in _msgs) {
        
        if ( msg.isInvalid) {
            
            [deleteItem addObject:msg];
            
        }
        
    }
    
    [M unregisterMsgs:deleteItem];
}

+ (void) unregister:(id<NSObject>) target {
    
    NSMutableSet *deleteItem = [[NSMutableSet alloc] init];
    
    for (__MSG *msg in _msgs) {
        
        if (msg.target == target || msg.isInvalid) {
            [deleteItem addObject:msg];
        }
        
    }
    
    [M unregisterMsgs:deleteItem];
}

+ (void) unregister:(id<NSObject>)target name:(NSString *)name {
    NSMutableSet *deleteItem = [[NSMutableSet alloc] init];
    
    for (__MSG *msg in _msgs) {
        
        if ((msg.target == target && msg.name == name) || msg.isInvalid) {
            [deleteItem addObject:msg];
        }
        
    }
    
    [M unregisterMsgs:deleteItem];
}

+ (void) unregisterMsgs:(NSSet*) deleteMsgs {
    for (__MSG *msg in deleteMsgs) {
        [[NSNotificationCenter defaultCenter] removeObserver:msg.observer];
    }
    [_msgs minusSet:deleteMsgs];
}

@end







