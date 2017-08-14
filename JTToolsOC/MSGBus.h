//
//  MSGBus.h
//  MSGBus
//
//  Created by TabZhou on 26/06/2017.
//  Copyright © 2017 Atlas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSGNames.h"
NS_ASSUME_NONNULL_BEGIN

@interface MSGBus : NSObject

+ (void) send:(NSString *)name;
+ (void) send:(NSString *)name from:(nullable id)sender;
+ (void) send:(NSString *)name from:(nullable id)sender info:(nullable NSDictionary *)info;

+ (void) onReceived:(NSString *)name target:(id<NSObject>)target handler:(void(^)(NSDictionary* info,  __nullable id sender))handler;


+ (void) unregister:(id<NSObject>) target;
+ (void) unregister:(id<NSObject>) target name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
