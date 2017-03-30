//
//  BlockSwipe.m
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/30.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "BlockSwipe.h"

typedef void (^BlockSwipeAction)(UISwipeGestureRecognizer *) ;

@interface BlockSwipe ()

@property (nonatomic, strong) BlockSwipeAction swipeAction;

@end

@implementation BlockSwipe

- (instancetype)initWithTarget:(id)target action:(SEL)action {
    return [super initWithTarget:target action:action];
}

- (instancetype)init:(void (^)(UISwipeGestureRecognizer *))action {
    if (self = [super init]) {
        self.swipeAction = action;
        
        [self addTarget:self action:@selector(didSwiped:)];
    }
    return self;
}

- (void)didSwiped:(UISwipeGestureRecognizer *)swiped {
    self.swipeAction(swiped);
}
@end
