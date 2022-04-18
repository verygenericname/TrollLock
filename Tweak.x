#import <Foundation/Foundation.h>

%hook BSUICAPackageView
- (id)initWithPackageName:(NSString *)arg1 inBundle:(id)arg2 {
if(![arg1 containsString:@"lock"]) {
    return %orig;
  }


NSBundle *trollBundle = [[NSBundle alloc] initWithPath:[NSString stringWithFormat:@"%@/%@", @"/Library/Application Support/TrollLock/" , @"trollformation.bundle"]];
	return %orig(@"trollformation",trollBundle);
}
%end
