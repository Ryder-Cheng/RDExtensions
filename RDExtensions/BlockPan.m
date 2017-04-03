//
//  BlockPan.m
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/30.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "BlockPan.h"



@interface BlockPan ()

@property (nonatomic, strong) BlockPanAction panAction;

@end

@implementation BlockPan

- (instancetype)initWithTarget:(id)target action:(SEL)action {
    return [super initWithTarget:target action:action];
}

- (instancetype)init:(BlockPanAction)action
{
    self = [super init];
    if (self) {
        self.panAction = action;
        [self addTarget:self action:@selector(didPan:)];
    }
    return self;
}

- (void)didPan:(UIPanGestureRecognizer *)pan {
    self.panAction(pan);
}

@end
