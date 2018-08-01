//
//  NSBundle+FYStyle.m
//  FangyouModulized
//
//  Created by 陈震 on 2018/8/1.
//

#import "NSBundle+FYStyle.h"
#import "FYRouter.h"

@implementation NSBundle (FYStyle)

+ (NSBundle *)fy_resourceBundle{
    static NSBundle *resourceBundle = nil;
    if(!resourceBundle){
        NSBundle *rootBundle = [NSBundle bundleForClass:[FYRouter class]];
        NSURL *resourceBundlePath = [rootBundle URLForResource:@"FangyouModulized"
                                                 withExtension:@"bundle"];
        resourceBundle = [NSBundle bundleWithURL:resourceBundlePath];
    }
    return resourceBundle;
}

@end
