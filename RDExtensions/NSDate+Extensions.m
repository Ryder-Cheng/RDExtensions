//
//  NSDate+Extensions.m
//  RDExtensions
//
//  Created by ryder on 2017/4/27.
//  Copyright © 2017年 Ryder. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate (Extensions)

+ (instancetype)dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

- (NSString *)toStringWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter stringFromDate:self];
}

- (BOOL)inSameDayAsDate:(NSDate *)date {
    return [NSCalendar.currentCalendar isDate:self inSameDayAsDate:date];
}

- (BOOL)inSameMonthAsDate:(NSDate *)date {
    return [NSCalendar.currentCalendar isDate:self equalToDate:date toUnitGranularity:NSCalendarUnitMonth];
}

- (BOOL)inSameYearAsDate:(NSDate *)date {
    return [NSCalendar.currentCalendar isDate:self equalToDate:date toUnitGranularity:NSCalendarUnitYear];
}

- (BOOL)inSameHourAsDate:(NSDate *)date {
    return [NSCalendar.currentCalendar isDate:self equalToDate:date toUnitGranularity:NSCalendarUnitHour];
}

- (BOOL)inSameMinuteAsDate:(NSDate *)date {
    return [NSCalendar.currentCalendar isDate:self equalToDate:date toUnitGranularity:NSCalendarUnitMinute];
}

- (BOOL)inSameSecondAsDate:(NSDate *)date {
    return [NSCalendar.currentCalendar isDate:self equalToDate:date toUnitGranularity:NSCalendarUnitSecond];
}

- (BOOL)isDateInToday{
    return [NSCalendar.currentCalendar isDateInToday:self];
}

- (BOOL)sameDateAsDate:(NSDate *)date {
    NSCalendarUnit unit = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    return [NSCalendar.currentCalendar compareDate:self toDate:date toUnitGranularity:unit];
}

- (BOOL)isDateInYesterday {
    return [NSCalendar.currentCalendar isDateInYesterday:self];
}

- (BOOL)isDateInTomorrow{
    return [NSCalendar.currentCalendar isDateInTomorrow:self];
}


- (BOOL)isDateInWeekend{
    return [NSCalendar.currentCalendar isDateInWeekend:self];
}

- (NSTimeInterval)daysInBetweenDate:(NSDate *)date {
    NSTimeInterval diff = self.timeIntervalSince1970 - date.timeIntervalSince1970;
    diff = fabs(diff/(60 * 60 * 24));
    return diff;
}

- (NSTimeInterval)hoursInBetweenDate:(NSDate *)date {
    NSTimeInterval diff = self.timeIntervalSince1970 - date.timeIntervalSince1970;
    diff = fabs(diff/(60 * 60));
    return diff;
}

- (NSTimeInterval)minutesInBetweenDate:(NSDate *)date {
    NSTimeInterval diff = self.timeIntervalSince1970 - date.timeIntervalSince1970;
    diff = fabs(diff/60);
    return diff;
}

- (NSTimeInterval)secondsInBetweenDate:(NSDate *)date {
    NSTimeInterval diff = self.timeIntervalSince1970 - date.timeIntervalSince1970;
    diff = fabs(diff);
    return diff;
}

- (NSDate *)dateByAddingYear:(NSInteger)value {
    NSCalendarUnit unit = NSCalendarUnitYear;
    return [NSCalendar.currentCalendar dateByAddingUnit:unit value:value toDate:self options:NSCalendarWrapComponents];
}
- (NSDate *)dateByAddingMonth:(NSInteger)value{
    NSCalendarUnit unit = NSCalendarUnitMonth;
    return [NSCalendar.currentCalendar dateByAddingUnit:unit value:value toDate:self options:NSCalendarWrapComponents];
}
- (NSDate *)dateByAddingDay:(NSInteger)value {
    NSCalendarUnit unit = NSCalendarUnitDay;
    return [NSCalendar.currentCalendar dateByAddingUnit:unit value:value toDate:self options:NSCalendarWrapComponents];
}
- (NSDate *)dateByAddingHour:(NSInteger)value {
    NSCalendarUnit unit = NSCalendarUnitHour;
    return [NSCalendar.currentCalendar dateByAddingUnit:unit value:value toDate:self options:NSCalendarWrapComponents];
}
- (NSDate *)dateByAddingMinute:(NSInteger)value {
    NSCalendarUnit unit = NSCalendarUnitMinute;
    return [NSCalendar.currentCalendar dateByAddingUnit:unit value:value toDate:self options:NSCalendarWrapComponents];
}
- (NSDate *)dateByAddingSecond:(NSInteger)value {
    NSCalendarUnit unit = NSCalendarUnitSecond;
    return [NSCalendar.currentCalendar dateByAddingUnit:unit value:value toDate:self options:NSCalendarWrapComponents];
}

- (NSInteger)second {
    return [NSCalendar.currentCalendar component:NSCalendarUnitSecond fromDate:self];
}

- (NSInteger)minute {
    return [NSCalendar.currentCalendar component:NSCalendarUnitMinute fromDate:self];
}

- (NSInteger)hour {
    return [NSCalendar.currentCalendar component:NSCalendarUnitHour fromDate:self];
}

- (NSInteger)day {
    return [NSCalendar.currentCalendar component:NSCalendarUnitDay fromDate:self];
}

- (NSInteger)month {
    return [NSCalendar.currentCalendar component:NSCalendarUnitMonth fromDate:self];
}

- (NSInteger)year {
    return [NSCalendar.currentCalendar component:NSCalendarUnitYear fromDate:self];
}

- (NSString *)monthString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MMMM";
    return [dateFormatter stringFromDate:self];
}

- (NSString *)weekdayString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEEE";
    return [dateFormatter stringFromDate:self];
}

//- (BOOL)isThisWeek {
//    
//}
@end
