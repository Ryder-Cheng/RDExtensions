//
//  UIView+Extension.h
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/24.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GestureRecognizer)
- (void)addTap:(id)target action:(SEL)action;
- (void)addTapGestureRecognizer:(void (^)(UITapGestureRecognizer *))action;
- (void)addTapGestureRecognizer:(NSInteger)tapCount target:(id)target action:(SEL)action;
- (void)addTapGestureRecognizer:(NSInteger)tapCount action:(void (^)(UITapGestureRecognizer *))action;

- (void)addLongPressed:(id)target action:(SEL)action;
- (void)addLongPressedGestureRecognizer:(void (^)(UILongPressGestureRecognizer *))action;

- (void)addPinch:(id)target action:(SEL)action;
- (void)addPinchGestureRecognizer:(void (^)(UIPinchGestureRecognizer *))action;

- (void)addSwipe:(id)target action:(SEL)action;
- (void)addSwipeGestureRecognizer:(void (^)(UISwipeGestureRecognizer *))action;

- (void)addPan:(id)target action:(SEL)action;
- (void)addPanGestureRecognizer:(void (^)(UIPanGestureRecognizer *))action;

@end

@interface UIView (Layer)
- (void)addBorder:(CGFloat)size withColor:(UIColor *)borderColor;
- (void)addBorderLeft:(CGFloat)size withColor:(UIColor *)borderColor;
- (void)addBorderRight:(CGFloat)size withColor:(UIColor *)borderColor;
- (void)addBorderTop:(CGFloat)size withColor:(UIColor *)borderColor;
- (void)addBorderBottom:(CGFloat)size withColor:(UIColor *)borderColor;

@end

@interface UIView (Extension)

- (UIImage *)toImage;

@end

@interface UIView (Geometry)

@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGPoint origin;
@property(nonatomic) CGSize size;
@property(nonatomic) CGFloat x;
@property(nonatomic) CGFloat y;
@property(nonatomic) CGFloat w;
@property(nonatomic) CGFloat h;
@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;
- (CGFloat (^)(CGFloat))cornerRadius;
- (UIEdgeInsets (^)(UIEdgeInsets))edges;
- (CGPoint (^)(CGPoint))offset;
- (CGFloat (^)(CGFloat))offsetX;
- (CGFloat (^)(CGFloat))offsetY;

@end

@interface UIView (Hierarchy)

- (void)removeSubviews;
- (void)addViews:(NSArray *)array;

@end

@interface UIView (animation)

- (void)spring:(NSTimeInterval)duration
     animation:(void (^)(void))animations;

- (void)springEaseIn:(NSTimeInterval)duration
           animation:(void (^)(void))animations;

- (void)springEaseOut:(NSTimeInterval)duration
            animation:(void (^)(void))animations;

- (void)springEaseInOut:(NSTimeInterval)duration
              animation:(void (^)(void))animations;

- (void)springLinear:(NSTimeInterval)duration
           animation:(void (^)(void))animations;

- (void)springWithDelay:(NSTimeInterval)duration
                  delay:(NSTimeInterval)delay
              animation:(void (^)(void))animations;

- (void)springWithCompletion:(NSTimeInterval)duration
                   animation:(void (^)(void))animations
                  completion:(void (^)(BOOL))completion;

- (void)keyframe:(NSTimeInterval)duration
       animation:(void (^)(void))animations;

- (void)keyframeWithDelay:(NSTimeInterval)duration
                    delay:(NSTimeInterval)delay
                animation:(void (^)(void))animations;

- (void)keyframeWithCompletion:(NSTimeInterval)duration
                         delay:(NSTimeInterval)delay
                     animation:(void (^)(void))animations
                    completion:(void (^)(BOOL))completion;

- (void)addKeyframeWithRelativeStartTime:(double)startTime
                        relativeDuration:(double)durantion
                               animation:(void (^)(void))animations;

- (void)pop;
- (void)push;
- (void)popleft;
- (void)popright;
- (void)popup;
- (void)popdown;
@end


