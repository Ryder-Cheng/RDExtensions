//
//  UIImage+Extensions.m
//  RDExtensions
//
//  Created by ryder on 2017/4/25.
//  Copyright © 2017年 ryder. All rights reserved.
//

#import "UIImage+Extensions.h"

@implementation UIImage (Extensions)

- (NSData *)comressImage:(CGFloat)rate {
    return UIImageJPEGRepresentation(self, rate);
}

- (UIImage *)resize:(CGSize)size {
    CGSize newSize = size;
    UIGraphicsBeginImageContextWithOptions(newSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, newSize.width, newSize.height);
    [self drawInRect:imageRect];
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)resizeWithWidth:(CGFloat)width {
    CGSize newSize = CGSizeMake(width, [self aspectHeightWithWidth:width]);
    return [self resize:newSize];
}

- (UIImage *)resizeWithHeight:(CGFloat)height {
    CGSize newSize = CGSizeMake([self aspectWidthWithHeight:height], height);
    return [self resize:newSize];
}

- (CGFloat)aspectHeightWithWidth:(CGFloat)width {
    return (width * self.size.height) / self.size.width;
}

- (CGFloat)aspectWidthWithHeight:(CGFloat)height {
    return (height * self.size.width) / self.size.height;
}

- (UIImage *)croppedImageWithFrame:(CGRect)frame {
    if (self.size.width <= frame.origin.x) {
        return nil;
    }
    
    if (self.size.height <= frame.origin.y) {
        return nil;
    }
    
    CGRect scaledBounds = CGRectMake(CGRectGetMinX(frame) * self.scale,
                                     CGRectGetMinY(frame) * self.scale,
                                     CGRectGetWidth(frame) * self.scale,
                                     CGRectGetHeight(frame) * self.scale);
    return [self croppedImageWithFrame:scaledBounds];
}

- (UIImage *)tintColor:(UIColor *)color {
    UIImage *image = [self imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [color set];
    [image drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
