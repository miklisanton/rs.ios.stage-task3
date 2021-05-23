#import "PlayersSeparator.h"

@implementation PlayersSeparator
- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    int possibleTeams = 0;
    if ([ratingArray count] < 3) {
        return 0;
    }
    for (int i = 0; i < [ratingArray count] - 2; i++) {
        for (int j = i + 1; j < [ratingArray count] - 1; j++) {
            if ([ratingArray[i] intValue] > [ratingArray[j] intValue]) {
                for (int k = j + 1; k <[ratingArray count]; k++) {
                    if ([ratingArray[j] intValue] > [ratingArray[k] intValue]) {
                        possibleTeams++;
                    }
                }
            }
        }
    }
    ratingArray = [[ratingArray reverseObjectEnumerator] allObjects];
    for (int i = 0; i < [ratingArray count] - 2; i++) {
        for (int j = i + 1; j < [ratingArray count] - 1; j++) {
            if ([ratingArray[i] intValue] > [ratingArray[j] intValue]) {
                for (int k = j + 1; k <[ratingArray count]; k++) {
                    if ([ratingArray[j] intValue] > [ratingArray[k] intValue]) {
                        possibleTeams++;
                    }
                }
            }
        }
    }
    return possibleTeams;
}

@end
