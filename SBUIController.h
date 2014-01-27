@interface SBUIController : NSObject
+ (id)sharedInstanceIfExists;
+ (id)sharedInstance;
- (int)batteryCapacityAsPercentage;
- (_Bool)isOnAC;
@end
