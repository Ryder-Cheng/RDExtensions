//
//  NSObject+Extensions.h
//  RDExtensions
//
//  Created by ChengYaojun on 2017/4/8.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Extensions)

void print(id firstObject, ...) NS_REQUIRES_NIL_TERMINATION;

- (NSString *)classNameForProperty;

+ (NSString *)className;

@end

