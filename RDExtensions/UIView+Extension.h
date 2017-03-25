//
//  UIView+Extension.h
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/24.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
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

@end
