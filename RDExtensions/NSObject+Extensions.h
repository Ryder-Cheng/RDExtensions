//
//  NSObject+Extensions.h
//  Test
//
//  Created by ChengYaojun on 2017/4/8.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extensions)

@end


@interface NSObject(Log)

void print(id firstObject, ...)NS_REQUIRES_NIL_TERMINATION;

@end
