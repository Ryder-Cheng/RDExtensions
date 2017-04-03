//
//  UIView+Extension.m
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/24.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "UIView+Extension.h"
#import "BlockTap.h"
#import "BlockLongPress.h"
#import "BlockPinch.h"
#import "BlockSwipe.h"
#import "BlockPan.h"

@implementation UIView (Extension)
#pragma mark -

#pragma mark - to image

- (UIImage *)toImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:false];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end


@implementation UIView (Geometry)


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



#pragma mark - setter and getter CenterX && centerY

-  (CGFloat)centerX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)centerY {
    return CGRectGetMidY(self.frame);
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (UIEdgeInsets (^)(UIEdgeInsets))edges {
    return ^UIEdgeInsets(UIEdgeInsets inset) {
        CGRect frame = self.frame;
        frame.size.width = frame.size.width + inset.left + inset.right;
        frame.size.height = frame.size.height + inset.top + inset.bottom;
        frame.origin.x = frame.origin.x - inset.left;
        frame.origin.y = frame.origin.y - inset.top;
        self.frame = frame;
        return inset;
    };
}

- (CGPoint (^)(CGPoint))offset {
    return ^CGPoint(CGPoint point) {
        CGRect frame = self.frame;
        frame.origin.x = frame.origin.x + point.x;
        frame.origin.y = frame.origin.y + point.y;
        self.frame = frame;
        return point;
    };
}

- (CGFloat (^)(CGFloat))offsetX {
    return ^CGFloat(CGFloat x) {
        CGRect frame = self.frame;
        frame.origin.x = frame.origin.x + x;
        self.frame = frame;
        return x;
    };
}

- (CGFloat (^)(CGFloat))offsetY {
    return ^CGFloat(CGFloat y) {
        CGRect frame = self.frame;
        frame.origin.y = frame.origin.y + y;
        self.frame = frame;
        return y;
    };
}

- (CGFloat (^)(CGFloat))cornerRadius {
    return ^CGFloat(CGFloat cornerRadius) {
        self.layer.cornerRadius = cornerRadius;
        return cornerRadius;
    };
}

@end

@implementation UIView (Hierarchy)

#pragma mark - remove all subviews

- (void)removeSubviews {
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

- (void)addViews:(NSArray *)array {
    for (UIView *subview in array) {
        [self addSubview:subview];
    }
}


@end

@implementation UIView (GestureRecognizer)

#pragma mark - UIViewGestureRecognizerDelegate's Tap/LongPress/Pinch/Swipe/Pan
#pragma mark UITapGestureRecognizer
- (void)addTapGestureRecognizer:(NSInteger)tapCount target:(NSObject *)target action:(SEL)action {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}

- (void)addTapGestureRecognizer:(NSInteger)tapCount action:(void (^)(UITapGestureRecognizer *))action {
    BlockTap *tap = [[BlockTap alloc] init:tapCount
                               fingerCount:1
                                    action:action];
    [self addGestureRecognizer:tap];
    [self setUserInteractionEnabled:true];
}


- (void)addTap:(NSObject *)target action:(SEL)action  {
    [self addTapGestureRecognizer:1 target:target action:action];
}

- (void)addTapGestureRecognizer:(void (^)(UITapGestureRecognizer *))action {
    [self addTapGestureRecognizer:1 action:action];
}

#pragma mark UILongPressGestureRecognizer

- (void)addLongPressed:(id)target action:(SEL)action {
    BlockLongPress *longPressed = [[BlockLongPress alloc] initWithTarget:self action:action];
    [self addGestureRecognizer:longPressed];
    [self setUserInteractionEnabled:true];
}

- (void)addLongPressedGestureRecognizer:(void (^)(UILongPressGestureRecognizer *))action {
    BlockLongPress *longPressed = [[BlockLongPress alloc] init:action];
    [self addGestureRecognizer:longPressed];
    [self setUserInteractionEnabled:true];
}

#pragma mark UIPinchGestureRecognizer

- (void)addPinch:(id)target action:(SEL)action {
    BlockPinch *pinch = [[BlockPinch alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:pinch];
    [self setUserInteractionEnabled:true];
}

- (void)addPinchGestureRecognizer:(void (^)(UIPinchGestureRecognizer *))action {
    BlockPinch *pinch = [[BlockPinch alloc] init:action];
    [self addGestureRecognizer:pinch];
    [self setUserInteractionEnabled:true];
}

#pragma mark UISwipeGestureRecognizer

- (void)addSwipe:(id)target action:(SEL)action {
    BlockSwipe *swipe = [[BlockSwipe alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:swipe];
    [self setUserInteractionEnabled:true];
}

- (void)addSwipeGestureRecognizer:(void (^)(UISwipeGestureRecognizer *))action {
    BlockSwipe *swipe = [[BlockSwipe alloc] init:action];
    [self addGestureRecognizer:swipe];
    [self setUserInteractionEnabled:true];
}

#pragma mark UIPanGestureRecognizer


- (void)addPan:(id)target action:(SEL)action {
    BlockPan *pan = [[BlockPan alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:pan];
    [self setUserInteractionEnabled:true];
}

- (void)addPanGestureRecognizer:(void (^)(UIPanGestureRecognizer *))action {
    BlockPan *pan = [[BlockPan alloc] init:action];
    [self addGestureRecognizer:pan];
    [self setUserInteractionEnabled:true];
}

@end


@implementation UIView (Layer)

- (void)addBorder:(CGFloat)size withColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = size;
    self.layer.masksToBounds = true;
}

- (void)addBorderLeft:(CGFloat)size withColor:(UIColor *)borderColor {
    CALayer *leftBoderLayer = [[CALayer alloc] init];
    CGRect frame = CGRectMake(0, 0, size, CGRectGetHeight(self.frame));
    leftBoderLayer.frame = frame;
    leftBoderLayer.backgroundColor = borderColor.CGColor;
    [self.layer addSublayer:leftBoderLayer];
}

- (void)addBorderRight:(CGFloat)size withColor:(UIColor *)borderColor {
    CALayer *rightBoderLayer = [[CALayer alloc] init];
    CGRect frame = CGRectMake(CGRectGetWidth(self.frame), 0, size, CGRectGetHeight(self.frame));
    rightBoderLayer.frame = frame;
    rightBoderLayer.backgroundColor = borderColor.CGColor;
    [self.layer addSublayer:rightBoderLayer];
}

- (void)addBorderTop:(CGFloat)size withColor:(UIColor *)borderColor {
    CALayer *topBorderLayer = [[CALayer alloc] init];
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), size);
    topBorderLayer.frame = frame;
    topBorderLayer.backgroundColor = borderColor.CGColor;
    [self.layer addSublayer:topBorderLayer];
}

- (void)addBorderBottom:(CGFloat)size withColor:(UIColor *)borderColor {
    CALayer *bottomBorderLayer = [[CALayer alloc] init];
    CGRect frame = CGRectMake(0, CGRectGetHeight(self.frame), CGRectGetWidth(self.frame), size);
    bottomBorderLayer.frame = frame;
    bottomBorderLayer.backgroundColor = borderColor.CGColor;
    [self.layer addSublayer:bottomBorderLayer];
}


@end
