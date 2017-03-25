//
//  UIColor+Extension.m
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/24.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)colorWithHex:(NSUInteger)hex {
    CGFloat red = ((hex & 0xff0000) >> 16);
    CGFloat green = ((hex & 0xff00) >> 8);
    CGFloat blue = ((hex & 0xff));
    return [UIColor colorWithRed:red/255.0
                           green:green/255.0
                            blue:blue/255.0
                           alpha:1.0];
}


@end
