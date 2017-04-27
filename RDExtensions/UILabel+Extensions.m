//
//  UILabel+Extensions.m
//  RuntimeDemo
//
//  Created by ryder on 2017/4/27.
//  Copyright © 2017年 Ryder. All rights reserved.
//

#import "UILabel+Extensions.h"

@implementation UILabel (Extensions)

- (CGSize)contentSize {
    return [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
}

- (CGFloat)contentHeight {
    return [self sizeThatFits:CGSizeMake(CGRectGetWidth(self.frame), CGFLOAT_MAX)].height;
}

- (CGFloat)contentWidth {
    return [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGRectGetHeight(self.frame))].width;
}


@end
