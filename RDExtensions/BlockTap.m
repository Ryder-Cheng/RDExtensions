//
//  BlockTap.m
//  Demo
//
//  Created by ryder on 2017/3/28.
//  Copyright © 2017年 ryder. All rights reserved.
//

#import "BlockTap.h"

typedef void (^BlockTapAction)(UITapGestureRecognizer *);

@interface BlockTap()

@property (nonatomic, strong) BlockTapAction action;

@end


@implementation BlockTap

- (instancetype)initWithTarget:(id)target action:(SEL)action {
    return [super initWithTarget:target action:action];
}

- (instancetype)init:(NSInteger)tapCount fingerCount:(NSInteger)fingerCount action:(void (^)(UITapGestureRecognizer *))action
{
    self = [super init];
    if (self) {
        self.numberOfTapsRequired = tapCount;
        self.numberOfTouchesRequired = fingerCount;
        self.action = action;
        [self addTarget:self action:@selector(didTap:)];
    }
    return self;
}

- (void)didTap:(UITapGestureRecognizer *)tap {
    self.action(tap);
}
@end
