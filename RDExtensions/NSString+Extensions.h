//
//  NSString+Extensions.h
//  Test
//
//  Created by ChengYaojun on 2017/4/6.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extensions)

- (NSString *)append:(NSString *)string;
- (NSString *)appendDouble:(double)doubleValue;
- (NSString *)appendLongLong:(long long)value;
- (NSString *)appendChar:(char)value;
- (NSString *)appendFloat:(float)value;
- (NSString *)appendInt:(int)value;
- (NSString *)appendBool:(BOOL)value;
- (NSString *)repeat:(NSUInteger)count;
- (NSArray*)split:(NSString *)separator;
- (NSArray*)split:(NSString *)separator withCount:(NSUInteger)count;
- (NSString *)uppercaseStringWithCount:(NSUInteger)count;
- (NSString *)uppercaseStringWithRange:(NSRange)range;
- (NSString *)uppercaseStringFirst;
- (NSString *)uppercaseStringLast;
- (NSString *)lowercaseStringWithCount:(NSInteger)count;
- (NSString *)lowercaseStringWithRange:(NSRange)range;
- (NSString *)lowercaseStringFirst;
- (NSString *)lowercaseStringLast;
- (CGRect)contentTextSizeWithFont:(UIFont *)font;
- (BOOL)hasString:(NSString *)string;
- (NSMutableAttributedString *)highlightString:(NSString *)string withColor:(UIColor *)color;
- (NSMutableAttributedString *)underlineString:(NSString *)string withUnderlineColor:(UIColor *)underlineColor;
- (NSMutableAttributedString *)makeString:(NSString *)searchString withAttributed:(NSDictionary<NSString *, id> *)attrs;
- (NSMutableAttributedString *)makeStrings:(NSArray *)strings withAttributed:(NSDictionary<NSString *, id> *)attrs;
// Block
- (NSString *(^)(NSString *))append;
- (NSString *(^)(double))appendDouble;
- (NSString *(^)(float))appendFloat;
- (NSString *(^)(char))appendChar;
- (NSString *(^)(int))appendInt;
- (NSString *(^)(BOOL))appendBool;
- (NSString *(^)(NSUInteger))repeat;
- (NSArray *(^)(NSString *))split;
- (NSArray *(^)(NSString*, NSUInteger))splitWithCount;
- (NSString *(^)(NSUInteger))uppercaseStringWithCount;
- (NSString *(^)(NSRange))uppercaseStringWithRange;
- (NSString *(^)(NSUInteger))lowercaseStringWithCount;
- (NSString *(^)(NSRange))lowercaseStringWithRange;
- (NSMutableAttributedString *(^)(NSString*, UIColor*))highlightStringWithColor;
- (NSMutableAttributedString *(^)(NSString*, UIColor*))underlineStringWithUnderlineColor;
- (NSMutableAttributedString *(^)(NSString*, NSDictionary<NSString *, id>*))makeStringWithAttributed;
- (NSMutableAttributedString *(^)(NSArray*, NSDictionary<NSString *, id>*))makeStringArrayWithAttributed;
@end
