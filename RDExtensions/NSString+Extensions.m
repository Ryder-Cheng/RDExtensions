//
//  NSString+Extensions.m
//  Test
//
//  Created by ChengYaojun on 2017/4/6.
//  Copyright © 2017年 ChengYaojun. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)
- (NSString *)append:(NSString *)string {
    return [self stringByAppendingString:string];
}

- (NSString *)appendDouble:(double)value {
    return [self stringByAppendingFormat:@"%lf",value];
}

- (NSString *)appendFloat:(float)value {
    return [self stringByAppendingFormat:@"%f",value];
}

- (NSString *)appendChar:(char)value {
    return [self stringByAppendingFormat:@"%c", value];
}

- (NSString *)appendInt:(int)value {
    return [self stringByAppendingFormat:@"%d", value];
}

- (NSString *)appendInteger:(NSInteger)value {
    return [self stringByAppendingFormat:@"%td", value];
}

- (NSString *)appendBool:(BOOL)value {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    return [self append:[formatter stringFromNumber:[NSNumber numberWithBool:value]]];
}

- (NSString *)appendLongLong:(long long)value {
    return [self stringByAppendingFormat:@"%lld", value];
}

- (NSString *)repeat:(NSUInteger)count {
    NSString *result = @"";
    for (NSInteger i = 0; i < count; i++) {
       result =  [result append:self];
    }
    return result;
}

- (NSArray*)split:(NSString *)separator {
    NSMutableArray *array = [NSMutableArray array];
    if (!separator || [separator isEqualToString:@""]) {
        [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                                 options:NSStringEnumerationByComposedCharacterSequences
                              usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                                  [array addObject:substring];
                              }];
        return array;
    }
    return [self componentsSeparatedByString:separator];
}

- (NSArray*)split:(NSString *)separator withCount:(NSUInteger)count {
    NSArray *result = [self split:separator];
    NSUInteger repeatCount = count;
    if (repeatCount <= 0) {
        return @[];
    }
    
    if (repeatCount > result.count) {
        repeatCount = result.count;
    }
    
    return [result subarrayWithRange:NSMakeRange(0, repeatCount)];
}

- (NSString *)uppercaseStringWithCount:(NSUInteger)count {
    NSRange range = NSMakeRange(0, MIN(count, self.length));
    return [self uppercaseStringWithRange:range];
}

- (NSString *)uppercaseStringWithRange:(NSRange)range {
    NSUInteger location = MIN(range.location, self.length);
    NSUInteger length = MIN(range.length + location, self.length) - location;
    
    NSRange subrange = NSMakeRange(location, length);
    NSString *substring = [[self substringWithRange:subrange] uppercaseString];
    return [self stringByReplacingCharactersInRange:subrange withString:substring];
}

- (NSString *)uppercaseStringFirst {
    return [self uppercaseStringWithCount:1];
}

- (NSString *)uppercaseStringLast {
    return [self uppercaseStringWithRange:NSMakeRange(self.length - 1, self.length)];
}


- (NSString *)lowercaseStringWithCount:(NSInteger)count {
    NSRange range = NSMakeRange(0, MIN(count, self.length));
    return [self lowercaseStringWithRange:range];
}

- (NSString *)lowercaseStringWithRange:(NSRange)range {
    NSUInteger location = MIN(range.location, self.length);
    NSUInteger length = MIN(range.length + location, self.length) - location;
    
    NSRange subrange = NSMakeRange(location, length);
    NSString *substring = [[self substringWithRange:subrange] lowercaseString];
    return [self stringByReplacingCharactersInRange:subrange withString:substring];
}

- (NSString *)lowercaseStringFirst {
    return [self lowercaseStringWithCount:1];
}

- (NSString *)lowercaseStringLast {
    return [self lowercaseStringWithRange:NSMakeRange(self.length - 1, self.length)];
}

- (CGRect)contentTextSizeWithFont:(UIFont *)font {
    CGRect rect = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font} context:nil];
    return rect;
}

- (BOOL)hasString:(NSString *)string {
    if ([self rangeOfString:string].location == NSNotFound) {
        return NO;
    }
    return YES;
}

- (NSMutableAttributedString *)highlightString:(NSString *)string withColor:(UIColor *)color {
    NSRange range = [self rangeOfString:string];
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:self];
    [aString addAttributes:@{NSForegroundColorAttributeName:color} range:range];
//    [aString setAttributes:@{NSForegroundColorAttributeName:color} range:range];
    return aString;
}

- (NSMutableAttributedString *)underlineString:(NSString *)string withUnderlineColor:(UIColor *)underlineColor {
    NSRange range = [self rangeOfString:string];
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:self];
    [aString addAttributes:@{NSUnderlineStyleAttributeName:@1,
                             NSUnderlineColorAttributeName:underlineColor
                             } range:range];
//    [aString setAttributes:@{NSUnderlineStyleAttributeName:@1,
//                             NSUnderlineColorAttributeName:underlineColor
//                            } range:range];
    return aString;
}

- (NSMutableAttributedString *)makeString:(NSString *)searchString withAttributed:(NSDictionary<NSString *, id> *)attrs {
    NSRange range = [self rangeOfString:searchString];
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:self];
    [aString addAttributes:attrs range:range];
    return aString;
}

- (NSMutableAttributedString *)makeStrings:(NSArray *)strings withAttributed:(NSDictionary<NSString *, id> *)attrs {
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:self];
    for (NSString *string in strings) {
        NSRange range = [self rangeOfString:string];
        if (range.location != NSNotFound) {
            [aString addAttributes:attrs range:range];
        }
    }
    
    return aString;
}

#pragma mark - Block

- (NSString *(^)(NSString *))append {
    return ^NSString*(NSString* string) {
        return [self append:string];
    };
}

- (NSString *(^)(double))appendDouble {
    return ^NSString*(double doubleValue) {
        return [self appendDouble:doubleValue];
    };
}

- (NSString *(^)(float))appendFloat {
    return ^NSString*(float value) {
        return [self appendFloat:value];
    };
}

- (NSString *(^)(char))appendChar {
    return ^NSString*(char value){
        return [self appendChar:value];
    };
}

- (NSString *(^)(int))appendInt {
    return ^NSString*(int value) {
        return [self appendInt:value];
    };
}

- (NSString *(^)(NSInteger))appendInteger {
    return ^NSString*(NSInteger value) {
        return [self appendInteger:value];
    };
}

- (NSString *(^)(BOOL))appendBool {
    return ^NSString*(BOOL value) {
        return [self appendBool:value];
    };
}

- (NSString *(^)(long long))appendLongLong {
    return ^NSString*(long long value) {
        return [self appendLongLong:value];
    };
}

- (NSString *(^)(NSUInteger))repeat {
    return ^NSString*(NSUInteger count) {
        return [self repeat:count];
    };
}

- (NSArray *(^)(NSString *))split {
    return ^NSArray*(NSString *separator) {
        return [self split:separator];
    };
}

- (NSArray *(^)(NSString*, NSUInteger))splitWithCount {
    return ^NSArray*(NSString *separator, NSUInteger count) {
        return [self split:separator withCount:count];
    };
}

- (NSString *(^)(NSUInteger))uppercaseStringWithCount {
    return ^NSString*(NSUInteger count) {
        return [self uppercaseStringWithCount:count];
    };
}

- (NSString *(^)(NSRange))uppercaseStringWithRange {
    return ^NSString*(NSRange range) {
        return [self uppercaseStringWithRange:range];
    };
}

- (NSString *(^)(NSUInteger))lowercaseStringWithCount {
    return ^NSString*(NSUInteger count) {
        return [self lowercaseStringWithCount:count];
    };
}

- (NSString *(^)(NSRange))lowercaseStringWithRange {
    return ^NSString*(NSRange range) {
        return [self lowercaseStringWithRange:range];
    };
}

- (NSMutableAttributedString *(^)(NSString *, UIColor *))highlightStringWithColor {
    return ^NSMutableAttributedString*(NSString *string, UIColor* color) {
        return [self highlightString:string withColor:color];
    };
}
- (NSMutableAttributedString *(^)(NSString *, UIColor *))underlineStringWithUnderlineColor {
    return ^NSMutableAttributedString*(NSString *string, UIColor* color) {
        return [self underlineString:string withUnderlineColor:color];
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSDictionary<NSString *,id> *))makeStringWithAttributed {
    return ^NSMutableAttributedString*(NSString *string, NSDictionary<NSString *,id> *atts) {
        return [self makeString:string withAttributed:atts];
    };
}

- (NSMutableAttributedString *(^)(NSArray *, NSDictionary<NSString *,id> *))makeStringArrayWithAttributed {
    return ^NSMutableAttributedString*(NSArray *strings,  NSDictionary<NSString *,id> *atts) {
        return [self makeStrings:strings withAttributed:atts];
    };
}

@end
