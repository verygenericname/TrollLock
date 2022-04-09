#import "Tweak.h"
#import <Foundation/Foundation.h>

%hook BSUICAPackageView
- (id)initWithPackageName:(NSString *)arg1 inBundle:(id)arg2 {
if(![arg1 containsString:@"lock"]) {
    return %orig;
  }


NSString *currentThemeName = @"trollformation";
NSString *currentTheme = @"trollformation.bundle";
NSBundle *themeBundle = [[NSBundle alloc] initWithPath:[NSString stringWithFormat:@"%@/%@", themepath , currentTheme]];
	return %orig(currentThemeName,themeBundle);
}
%end
