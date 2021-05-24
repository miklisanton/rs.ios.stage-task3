#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *mutableString1 = [string1 mutableCopy];
    NSMutableString *mutableString2 = [string2 mutableCopy];
    NSMutableString *output = [NSMutableString new];
    NSRange range = NSMakeRange(0, 1);
    while ((mutableString1.length) && (mutableString2.length)) {
        if ([mutableString1 characterAtIndex:0] <= [mutableString2 characterAtIndex:0]) {
            [output appendString:[mutableString1 substringWithRange:range]];
            [mutableString1 deleteCharactersInRange:range];
        }else{
            [output appendString:[mutableString2 substringWithRange:range]];
            [mutableString2 deleteCharactersInRange:range];
        }
    }
    mutableString1.length == 0 ? [output appendString:mutableString2] : [output appendString:mutableString1];
    return output;
}

@end
