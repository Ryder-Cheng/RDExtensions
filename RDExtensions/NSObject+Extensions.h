//
//  NSObject+Extensions.h
//  RDExtensions
//
//  Created by ChengYaojun on 2017/4/8.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define print(args,...) println(args,##__VA_ARGS__,nil)

@interface NSObject (Extensions)

void println(id firstObject, ...) NS_REQUIRES_NIL_TERMINATION;

- (NSString *)classNameForProperty;

+ (NSString *)className;

@end

