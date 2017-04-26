//
//  UIButton+Extensions.h
//  RDExtensions
//
//  Created by ChengYaojun on 2017/4/17.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extensions)

- (void)setBorderColor:(nullable UIColor *)color forState:(UIControlState)state;
- (void)setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state;

- (nullable UIColor *)borderColorForState:(UIControlState)state;
- (nullable UIColor *)backgroundColorForState:(UIControlState)state;

@end
