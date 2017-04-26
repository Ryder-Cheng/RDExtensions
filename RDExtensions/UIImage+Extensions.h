//
//  UIImage+Extensions.h
//  RDExtensions
//
//  Created by ryder on 2017/4/25.
//  Copyright © 2017年 ryder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extensions)
- (NSData *)comressImage:(CGFloat)rate;
- (UIImage *)resize:(CGSize)size;
- (UIImage *)resizeWithWidth:(CGFloat)width;
- (UIImage *)resizeWithHeight:(CGFloat)height;
- (UIImage *)croppedImageWithFrame:(CGRect)frame;
- (UIImage *)tintColor:(UIColor *)color;
@end
