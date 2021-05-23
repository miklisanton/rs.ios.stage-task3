#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM";
    NSDate *date = [formatter dateFromString:[NSString stringWithFormat:@"%lu", monthNumber]];
    NSDateFormatter *formatterOut= [[NSDateFormatter alloc] init];
    formatterOut.dateFormat = @"MMMM";
    return [formatterOut stringFromDate:date];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDate *d = [formatter dateFromString:date];
    NSDateFormatter *formatterOut= [[NSDateFormatter alloc] init];
    formatterOut.dateFormat = @"dd";
    return [[formatterOut stringFromDate:d] integerValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *formatterOut= [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc]
                         initWithLocaleIdentifier:@"ru"];
    [formatterOut setLocale:locale];
    formatterOut.dateFormat = @"EE";
    return [formatterOut stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *weekdayComponents =
                        [gregorian components:(NSCalendarUnitDay |
                                               NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:date];
    if ([weekdayComponents day] <= 23 && [weekdayComponents day] >= 17 && [weekdayComponents year] == 2021 && [weekdayComponents month] == 5){
        return YES;
    }
    
    return NO;
}

@end
