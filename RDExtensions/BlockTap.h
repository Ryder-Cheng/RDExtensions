//
//  BlockTap.h
//  Demo
//
//  Created by ryder on 2017/3/28.
//  Copyright © 2017年 ryder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockTap : UITapGestureRecognizer

- (instancetype)init:(NSInteger)tapCount fingerCount:(NSInteger)fingerCount action:(void (^)(UITapGestureRecognizer *))action;

@end
