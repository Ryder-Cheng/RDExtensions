//
//  NSDate+Extensions.h
//  RDExtensions
//
//  Created by ryder on 2017/4/27.
//  Copyright © 2017年 Ryder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extensions)

- (NSInteger)second;
- (NSInteger)minute;
- (NSInteger)hour;
- (NSInteger)day;
- (NSInteger)month;
- (NSInteger)year;
- (NSString *)monthString;
- (NSString *)weekdayString;
+ (instancetype)dateWithString:(NSString *)string format:(NSString *)format;
- (NSString *)toStringWithFormat:(NSString *)format;
- (BOOL)inSameDayAsDate:(NSDate *)date;
- (BOOL)inSameMonthAsDate:(NSDate *)date;
- (BOOL)inSameHourAsDate:(NSDate *)date;
- (BOOL)inSameMinuteAsDate:(NSDate *)date;
- (BOOL)inSameSecondAsDate:(NSDate *)date;
- (BOOL)inSameYearAsDate:(NSDate *)date;
- (BOOL)isDateInToday;
- (BOOL)isDateInYesterday;
- (BOOL)isDateInTomorrow;
- (BOOL)isDateInWeekend;
- (BOOL)sameDateAsDate:(NSDate *)date;
- (NSDate *)dateByAddingYear:(NSInteger)value;
- (NSDate *)dateByAddingMonth:(NSInteger)value;
- (NSDate *)dateByAddingDay:(NSInteger)value;
- (NSDate *)dateByAddingHour:(NSInteger)value;
- (NSDate *)dateByAddingMinute:(NSInteger)value;
- (NSDate *)dateByAddingSecond:(NSInteger)value;

- (NSTimeInterval)daysInBetweenDate:(NSDate *)date;
- (NSTimeInterval)hoursInBetweenDate:(NSDate *)date;
- (NSTimeInterval)minutesInBetweenDate:(NSDate *)date;
- (NSTimeInterval)secondsInBetweenDate:(NSDate *)date;

@end
