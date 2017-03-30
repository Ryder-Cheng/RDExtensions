//
//  UIView+Extension.h
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/24.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIViewGestureRecognizerDelegate <NSObject>

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

@interface UIView (Extension)<UIViewGestureRecognizerDelegate>
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
- (void)removeSubviews;
- (void)addViews:(NSArray *)array;

@end


