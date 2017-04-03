//
//  BlockPan.h
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/30.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BlockPanAction)(UIPanGestureRecognizer *);

@interface BlockPan : UITapGestureRecognizer

- (instancetype)init:(BlockPanAction)action;

@end
