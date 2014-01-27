#define BATTERY_PERCENTAGE_TYPE 8
#import "SBUIController.h"

// TODO Make this a preference
static BOOL showOnlyWhenLessThan100 = NO;

%hook SBStatusBarStateAggregator
- (_Bool)_setItem:(int)arg1 enabled:(_Bool)arg2 {
    SBUIController *c = [%c(SBUIController) sharedInstanceIfExists];

    if (!c) {
        return %orig;
    }

    if (arg1 == BATTERY_PERCENTAGE_TYPE && [c isOnAC]) {
        if (showOnlyWhenLessThan100 && [c batteryCapacityAsPercentage] < 100) {
            return %orig;
        }
        else {
            return %orig(arg1, YES);
        }
    }

    return %orig;
}
%end
