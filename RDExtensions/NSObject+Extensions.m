//
//  NSObject+Extensions.m
//  RDExtensions
//
//  Created by ChengYaojun on 2017/4/8.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "NSObject+Extensions.h"

@implementation NSObject (Extensions)

void print(id firstObject, ...) {
    va_list args;
    va_start(args, firstObject);
    NSMutableArray *array = [NSMutableArray array];
    for (id eachObject = firstObject; eachObject != nil; eachObject = va_arg(args,id)) {
        [array addObject:eachObject];
    }
    va_end(args);
    for (id object in array) {
        NSLog(@"%@", object);
    }
}

+ (NSString *)className {
    return NSStringFromClass(self.class);
}

- (NSString *)classNameForProperty {
    return NSStringFromClass(self.class);
}

@end

