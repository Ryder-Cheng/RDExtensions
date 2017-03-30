//
//  BlockLongPress.m
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/30.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "BlockLongPress.h"

typedef void (^BlockLongPressAction)(UILongPressGestureRecognizer *) ;

@interface BlockLongPress()

@property (nonatomic, strong) BlockLongPressAction action;

@end

@implementation BlockLongPress


- (instancetype)initWithTarget:(id)target action:(SEL)action {
    return [super initWithTarget:target action:action];
}

- (instancetype)init:(void (^)(UILongPressGestureRecognizer *))action
{
    self = [super init];
    if (self) {
        self.action = action;
        [self addTarget:self action:@selector(didLongPressed:)];

    }
    return self;
}

- (void)didLongPressed:(UILongPressGestureRecognizer *)longPress {
    self.action(longPress);
}
@end
