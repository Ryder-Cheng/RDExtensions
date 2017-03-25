//
//  UIView+Extension.m
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/24.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

#pragma mark - setter and getter X coord

- (CGFloat)x {
    return CGRectGetMinX(self.frame);
}

- (void)setX:(CGFloat)x {
    [self setFrame:CGRectMake(x,
                              CGRectGetMinY(self.frame),
                              CGRectGetWidth(self.frame),
                              CGRectGetHeight(self.frame))];
}

#pragma mark - setter and getter Y coord

- (CGFloat)y {
    return CGRectGetMinY(self.frame);
}

- (void)setY:(CGFloat)y {
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame),
                              y,
                              CGRectGetWidth(self.frame),
                              CGRectGetHeight(self.frame))];
}

#pragma mark - setter and getter Width

- (CGFloat)w {
    return CGRectGetWidth(self.frame);
}

- (void)setW:(CGFloat)w {
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame),
                              CGRectGetMinY(self.frame),
                              w,
                              CGRectGetHeight(self.frame))];
}

#pragma mark - setter and getter Height

- (CGFloat)h {
    return CGRectGetHeight(self.frame);
}

- (void)setH:(CGFloat)h {
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame),
                              CGRectGetMinY(self.frame),
                              CGRectGetWidth(self.frame),
                              h)];
}

#pragma mark - setter and getter Left

- (CGFloat)left {
    return CGRectGetMinX(self.frame);
}

- (void)setLeft:(CGFloat)left {
    [self setFrame:CGRectMake(left,
                              CGRectGetMinY(self.frame),
                              CGRectGetWidth(self.frame),
                              CGRectGetHeight(self.frame))];
}

#pragma mark - setter and getter Right

- (CGFloat)right {
    return CGRectGetMinX(self.frame) + CGRectGetWidth(self.frame);
}

- (void)setRight:(CGFloat)right {
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame),
                              CGRectGetMinY(self.frame),
                              right - CGRectGetMinX(self.frame),
                              CGRectGetHeight(self.frame))];
}

#pragma mark - setter and getter Top

- (CGFloat)top {
    return CGRectGetMinY(self.frame);
}

- (void)setTop:(CGFloat)top {
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame),
                              top,
                              CGRectGetWidth(self.frame),
                              CGRectGetHeight(self.frame))];
}


#pragma mark - setter and getter Bottom

- (CGFloat)bottom {
    return CGRectGetMinY(self.frame) + CGRectGetHeight(self.frame);
}

- (void)setBottom:(CGFloat)bottom {
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame),
                              CGRectGetMinY(self.frame),
                              CGRectGetWidth(self.frame),
                              bottom - CGRectGetMinY(self.frame))];
}

#pragma mark - setter and getter Position

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    [self setFrame:CGRectMake(origin.x,
                              origin.y,
                              CGRectGetWidth(self.frame),
                              CGRectGetHeight(self.frame))];
}

#pragma mark - setter and getter Size

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame),
                              CGRectGetMinY(self.frame),
                              size.width,
                              size.height)];
}



#pragma mark - setter and getter CenterX

-  (CGFloat)centerX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)centerY {
    return CGRectGetMidY(self.frame);
}

#pragma mark - remove all subviews

- (void)removeSubviews {
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}


@end
