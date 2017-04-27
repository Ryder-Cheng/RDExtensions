//
//  UIColor+Extensions.h
//  RDExtensions
//
//  Created by ChengYaojun on 2017/4/6.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSInteger Hex;

UIKIT_STATIC_INLINE CGFloat clamp(CGFloat val) {
    return MIN(1, MAX(0, val));
}

@interface UIColor (Extensions)
+ (UIColor *)colorFromHex:(Hex)hex;
+ (UIColor *)HSLToRGB:(CGFloat)h
                    s:(CGFloat)s
                    l:(CGFloat)l;
+ (UIColor *)HSVToRGB:(CGFloat)h
                    s:(CGFloat)s
                    v:(CGFloat)v;
+ (NSDictionary *)RGBToHSV:(CGFloat)red
                  green:(CGFloat)green
                   blue:(CGFloat)blue;
+ (NSDictionary *)RGBToHSL:(CGFloat)red
                  green:(CGFloat)green
                   blue:(CGFloat)blue;
+ (UIColor *)darken:(UIColor *)color
             amount:(CGFloat)amount;
+ (UIColor *)HSLToRGB:(CGFloat)h s:(CGFloat)s l:(CGFloat)l a:(CGFloat)a;
+ (UIColor *)HSVToRGB:(CGFloat)h s:(CGFloat)s v:(CGFloat)v a:(CGFloat)a;
+ (UIColor *)spin:(UIColor *)color amount:(CGFloat)amount;
+ (UIColor *)lighten:(UIColor *)color amount:(CGFloat)amount;
+ (UIColor *)fadein:(UIColor *)color amount:(CGFloat)amount;
+ (UIColor *)fadeout:(UIColor *)color amount:(CGFloat)amount;
+ (UIColor *)fade:(UIColor *)color amount:(CGFloat)amount;
@end
