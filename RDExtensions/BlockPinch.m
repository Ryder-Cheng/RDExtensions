//
//  BlockPinch.m
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/30.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "BlockPinch.h"

typedef void (^BlockPinchAction)(UIPinchGestureRecognizer *);

@interface BlockPinch ()

@property (nonatomic, strong) BlockPinchAction pinchAction;

@end

@implementation BlockPinch

- (instancetype)initWithTarget:(id)target action:(SEL)action {
    return [super initWithTarget:target action:action];
}

- (instancetype)init:(void (^)(UIPinchGestureRecognizer *))action {
    if (self = [super init]) {
        self.pinchAction = action;
        [self addTarget:self action:@selector(didPinch:)];
    }
    
    return self;
}

- (void)didPinch:(UIPinchGestureRecognizer *)pinch {
    self.pinchAction(pinch);
}

@end
