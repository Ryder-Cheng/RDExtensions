//
//  BlockLongPress.h
//  RDExtensions
//
//  Created by ChengYaojun on 2017/3/30.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BlockLongPress : UITapGestureRecognizer

- (instancetype)init:(void (^)(UILongPressGestureRecognizer *))action;

@end
