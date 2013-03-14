/*
 Copyright (c) 2013年 Deng Chaofan. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "NSDate+D2Helper.h"

@implementation NSDate (D2Helper)
+ (NSTimeInterval)timeIntervalSinceReferenceDateForNow {
    return [[NSDate date] timeIntervalSinceReferenceDate];
}
- (NSDate *)onlyDate {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit ) fromDate:self];
	return [calendar dateFromComponents:components];
}
- (NSDate *)onlyTime {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:self];
	return [calendar dateFromComponents:components];
}
- (NSDate *)notSecond {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit  ) fromDate:self];
    return [calendar dateFromComponents:components];
}
- (NSDate *)startOfUnit:(NSCalendarUnit)unit {
    NSDate *result = nil;
	[[NSCalendar currentCalendar] rangeOfUnit:unit startDate:&result interval:NULL forDate:self];
	return result;
}
- (NSDate *)startOfWeek {
    return [self startOfUnit:NSWeekCalendarUnit];
}
- (NSDate *)startOfMonth {
    return [self startOfUnit:NSMonthCalendarUnit];
}
- (NSDate *)startOfYear {
    return [self startOfUnit:NSYearCalendarUnit];
}
- (NSUInteger)numberOfDaysInMonth {
    return [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length;
}

- (NSUInteger)weekday {
    return [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:self] weekday];
}

- (NSString *)stringWithFormatter:(NSDateFormatter *)formatter {
    if ( formatter == nil ) {
        return self.description;
    }
	return [formatter stringFromDate:self];
}
- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
	return [formatter stringFromDate:self];
}

- (NSDate *)dateByAddingDays:(NSInteger)days {
    return [self dateByAddingYears:0 months:0 days:days];
}
- (NSDate *)dateByAddingMonths:(NSInteger)months {
    return [self dateByAddingYears:0 months:months days:0];
}
- (NSDate *)dateByAddingYears:(NSInteger)years {
    return [self dateByAddingYears:years months:0 days:0];
}
- (NSDate *)dateByAddingYears:(NSInteger)years months:(NSInteger)months days:(NSInteger)days {
	NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
	dateComponents.year = years;
	dateComponents.month = months;
	dateComponents.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}
- (NSUInteger)numberOf:(NSCalendarUnit)unit toDate:(NSDate *)date {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:unit fromDate:self toDate:date options:0];
    switch ( unit ) {
        case NSDayCalendarUnit:
            return [components day];
        case NSHourCalendarUnit:
            return [components hour];
        case NSMinuteCalendarUnit:
            return [components minute];
        case NSSecondCalendarUnit:
            return [components second];
        case NSMonthCalendarUnit:
            return [components month];
        case NSYearCalendarUnit:
            return [components year];
        default:
            return [components day];
    }
}
@end
