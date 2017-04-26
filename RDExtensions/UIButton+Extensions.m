//
//  UIButton+Extensions.m
//  RDExtensions
//
//  Created by ChengYaojun on 2017/4/17.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "UIButton+Extensions.h"
#import <objc/runtime.h>

UIKIT_STATIC_INLINE NSString* keyBackgroundColorForState(UIControlState state) {
    switch (state) {
        case UIControlStateNormal:
            return @"kBackgroundColorForStateNormal";
            break;
        case UIControlStateHighlighted:
            return @"kBackgroundColorForStateHighlighted";
            break;
        case UIControlStateDisabled:
            return @"kBackgroundColorForStateDisabled";
            break;
        case UIControlStateSelected:
            return @"kBackgroundColorForStateSelected";
            break;
        case UIControlStateFocused :
            return @"kBackgroundColorForStateFocused";
            break;
        case UIControlStateApplication:
            return @"kBackgroundColorForStateApplication";
            break;
        case UIControlStateReserved:
            return @"kBackgroundColorForStateReserved";
            break;
        default:
            break;
    }
    return @"kBorderColorForStateNormal";
}


UIKIT_STATIC_INLINE NSString* keyBorderColorForState(UIControlState state) {
    
    switch (state) {
        case UIControlStateNormal:
            return @"kBorderColorForStateNormal";
            break;
        case UIControlStateHighlighted:
            return @"kBorderColorForStateHighlighted";
            break;
        case UIControlStateDisabled:
            return @"kBorderColorForStateDisabled";
            break;
        case UIControlStateSelected:
            return @"kBorderColorForStateSelected";
            break;
        case UIControlStateFocused :
            return @"kBorderColorForStateFocused";
            break;
        case UIControlStateApplication:
            return @"kBorderColorForStateApplication";
            break;
        case UIControlStateReserved:
            return @"kBorderColorForStateReserved";
            break;
        default:
            break;
    }
    return @"kBorderColorForStateNormal";
}


@implementation UIButton (Extensions)


- (UIColor *)backgroundColorForState:(UIControlState)state {
    NSString *key = keyBackgroundColorForState(state);
    UIColor *color =  objc_getAssociatedObject(self, (__bridge const void *)(key));
    return color;
}

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    NSString *key = keyBackgroundColorForState(state);
    objc_setAssociatedObject(self, (__bridge const void *)(key), color, OBJC_ASSOCIATION_RETAIN);
}


- (UIColor *)borderColorForState:(UIControlState)state {
    NSString *key = keyBorderColorForState(state);
    UIColor *color =  objc_getAssociatedObject(self, (__bridge const void *)(key));
    
    return color;
}

- (void)setBorderColor:(UIColor *)color forState:(UIControlState)state {
    NSString *key = keyBorderColorForState(state);
    objc_setAssociatedObject(self, (__bridge const void *)(key), color, OBJC_ASSOCIATION_RETAIN);
}

- (UIControlState)state {
    UIControlState cState = [super state];
    UIColor *borderColor = [self borderColorForState:cState];
    if (borderColor) {
        [self.layer setBorderColor:borderColor.CGColor];
        [self.layer setMasksToBounds:YES];
    }
    UIColor *bgColor = [self backgroundColorForState:cState];
    if (bgColor) {
        [self setBackgroundColor:bgColor];
    }
    return cState;
}


@end
