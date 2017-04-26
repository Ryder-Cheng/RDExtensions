//
//  UIColor+Extension.m
//  RDExtensions
//
//  Created by ChengYaojun on 2017/4/6.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "UIColor+Extension.h"


@implementation UIColor (Extension)

+ (UIColor *)colorFromHex:(Hex)hex {
    return [UIColor colorWithRed:(((hex & 0xFF0000) >> 16))/255.0
                           green:(((hex & 0xFF00) >>8))/255.0
                            blue:((hex & 0xFF))/255.0
                           alpha:1.0];
}

+ (UIColor *)HSLToRGB:(CGFloat)h s:(CGFloat)s l:(CGFloat)l a:(CGFloat)a {
    h = h * 360;
    double c = (1 - fabs(2 * l - 1)) * s;
    double x = c * (1 - fabs(fmod(h/60, 2) - 1));
    double m = l - c/2;
    double r, g ,b;
    
    if (h >= 0 && h < 60) {
        r = c;
        g = x,
        b = 0;
    } else if (h >= 60 && h < 120) {
        r = x;
        g = c,
        b = 0;
    } else if (h >= 120 && h < 180) {
        r = 0;
        g = c,
        b = x;
    } else if (h >= 180 && h < 240) {
        r = 0;
        g = x,
        b = c;
    } else if (h >= 240 && h < 300) {
        r = x;
        g = 0,
        b = c;
    } else if (h >= 300 && h < 360) {
        r = c;
        g = 0,
        b = x;
    }
    
    r = (r + m);
    g = (g + m);
    b = (b + m);
    return [UIColor colorWithRed:r
                           green:g
                            blue:b
                           alpha:a];
}
+ (UIColor *)HSLToRGB:(CGFloat)h s:(CGFloat)s l:(CGFloat)l {
    return [UIColor HSLToRGB:h s:s l:l a:1.0];
    
}


+ (UIColor *)HSVToRGB:(CGFloat)h s:(CGFloat)s v:(CGFloat)v a:(CGFloat)a {
    h = h * 360;
    double c = v * s;
    double x = c * (1 - fabs(fmod(h/60, 2) - 1));
    double m = v - c;
    double r, g ,b;
    if (h >= 0 && h < 60) {
        r = c;
        g = x,
        b = 0;
    } else if (h >= 60 && h < 120) {
        r = x;
        g = c,
        b = 0;
    } else if (h >= 120 && h < 180) {
        r = 0;
        g = c,
        b = x;
    } else if (h >= 180 && h < 240) {
        r = 0;
        g = x,
        b = c;
    } else if (h >= 240 && h < 300) {
        r = x;
        g = 0,
        b = c;
    } else if (h >= 300 && h < 360) {
        r = c;
        g = 0,
        b = x;
    }
    
    r = (r + m);
    g = (g + m );
    b = (b + m);
    return [UIColor colorWithRed:r
                           green:g
                            blue:b
                           alpha:a];
}

+ (UIColor *)HSVToRGB:(CGFloat)h s:(CGFloat)s v:(CGFloat)v {
    return [UIColor HSVToRGB:h s:s v:v a:1.0];
}

+ (NSDictionary *)RGBToHSV:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    double r = red / 255.0;
    double g = green / 255.0;
    double b = blue / 255.0;
    double a = 1.0;
    double max = MAX(r, MAX(g, b));
    double min = MIN(r, MIN(g, b));
    double h,s,v = max,  d = max - min;
    if (max == min) {
        h = 0;
        s = 0;
    } else {
        s = d / max;
        
        if (max == r) {
            h = 60 * fmod((g - b) / d, 7);
        } else if (max == g) {
            h = 60 * ((b - r)/2 + 2);
        } else if(max == b) {
            h = 60 *(((r - g) / d) + 4);
        }
    }
    h = h/360;
    return @{
             @"s":@(s),
             @"h":@(h),
             @"v":@(v),
             @"a":@(a),
             };
}

+ (NSDictionary *)RGBToHSL:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    double r = red / 255.0;
    double g = green / 255.0;
    double b = blue / 255.0;
    double a = 1.0;
    double max = MAX(r, MAX(g, b));
    double min = MIN(r, MIN(g, b));
    double h,s,l = (max + min)/2,  d = max - min;
    if (max == min) {
        h = 0;
        s = 0;
    } else {
        s = d / (1 - fabs(2 * l - 1));
        
        if (max == r) {
            h = (g - b) / d + (g < b ? 6 : 0);
        } else if (max == g) {
            h = (b - r) / d + 2;
        } else if(max == b) {
            h = (r - g) / d + 4;
        }
        
        h /= 6;
    }
    return @{
             @"s":@(s),
             @"h":@(h),
             @"l":@(l),
             @"a":@(a),
             };
}

+ (UIColor *)spin:(UIColor *)color amount:(CGFloat)amount {
    CGFloat r, g, b, a;
    
    [color getRed:&r
            green:&g
             blue:&b
            alpha:&a];
    NSDictionary *hsv = [UIColor RGBToHSV:r * 255
                                    green:g * 255
                                     blue:b * 255];
    CGFloat h,s,v;
    h = [hsv[@"h"] floatValue];
    s = [hsv[@"s"] floatValue];
    v = [hsv[@"v"] floatValue];
    
    CGFloat hue = fmod(h + amount, 360);
    h = hue < 0 ? 360 + hue : hue;
    return [UIColor HSVToRGB:h s:s v:v];

}

+ (UIColor *)lighten:(UIColor *)color amount:(CGFloat)amount {
    CGFloat r, g, b, a;
    
    [color getRed:&r
            green:&g
             blue:&b
            alpha:&a];
    NSDictionary *hsv = [UIColor RGBToHSV:r * 255
                                    green:g * 255
                                     blue:b * 255];
    CGFloat h,s,v;
    h = [hsv[@"h"] floatValue];
    s = [hsv[@"s"] floatValue];
    v = [hsv[@"v"] floatValue];
    v = v + amount;
    v = clamp(v);
    return [UIColor HSVToRGB:h s:s v:v];

}

+ (UIColor *)darken:(UIColor *)color amount:(CGFloat)amount {
    CGFloat r, g, b, a;
    
    [color getRed:&r
            green:&g
             blue:&b
            alpha:&a];
    NSDictionary *hsv = [UIColor RGBToHSV:r * 255
                                    green:g * 255
                                     blue:b * 255];
    CGFloat h,s,v;
    h = [hsv[@"h"] floatValue];
    s = [hsv[@"s"] floatValue];
    v = [hsv[@"v"] floatValue];
    v = v - amount;
    v = clamp(v);
    return [UIColor HSVToRGB:h s:s v:v];
}

+ (UIColor *)fadein:(UIColor *)color amount:(CGFloat)amount {
    CGFloat r, g, b, a;
    
    [color getRed:&r
            green:&g
             blue:&b
            alpha:&a];
    NSDictionary *hsv = [UIColor RGBToHSV:r * 255
                                    green:g * 255
                                     blue:b * 255];
    CGFloat h,s,v;
    h = [hsv[@"h"] floatValue];
    s = [hsv[@"s"] floatValue];
    v = [hsv[@"v"] floatValue];
    a =  a + amount;
    a = clamp(a);
    return [UIColor HSVToRGB:h s:s v:v a:a];
    
}
+ (UIColor *)fadeout:(UIColor *)color amount:(CGFloat)amount {
    CGFloat r, g, b, a;
    
    [color getRed:&r
            green:&g
             blue:&b
            alpha:&a];
    NSDictionary *hsv = [UIColor RGBToHSV:r * 255
                                    green:g * 255
                                     blue:b * 255];
    CGFloat h,s,v;
    h = [hsv[@"h"] floatValue];
    s = [hsv[@"s"] floatValue];
    v = [hsv[@"v"] floatValue];
    a =  a - amount;
    a = clamp(a);
    return [UIColor HSVToRGB:h s:s v:v a:a];
}
+ (UIColor *)fade:(UIColor *)color amount:(CGFloat)amount {
    CGFloat r, g, b, a;
    
    [color getRed:&r
            green:&g
             blue:&b
            alpha:&a];
    NSDictionary *hsv = [UIColor RGBToHSV:r * 255
                                    green:g * 255
                                     blue:b * 255];
    CGFloat h,s,v;
    h = [hsv[@"h"] floatValue];
    s = [hsv[@"s"] floatValue];
    v = [hsv[@"v"] floatValue];
    a = amount;
    a = clamp(a);
    return [UIColor HSVToRGB:h s:s v:v a:a];
}

@end
