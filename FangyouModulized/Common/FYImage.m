//
//  FYImage.m
//  FangyouModulized
//
//  Created by 陈震 on 2018/8/1.
//

#import "FYImage.h"
#import "NSBundle+FYStyle.h"

@implementation FYImage

+ (UIImage *)imageNamed:(NSString *)name{
//    NSBundle *rootBundle = [NSBundle bundleForClass:self.class];
//    NSURL *resourceBundlePath = [rootBundle URLForResource:@"FangyouModulized"
//                                             withExtension:@"bundle"];
//    NSBundle *resourceBundle = [NSBundle bundleWithURL:resourceBundlePath];
    UIImage *image = [UIImage imageNamed:name
                                inBundle:[NSBundle fy_resourceBundle]
           compatibleWithTraitCollection:nil];
    return image;
}

@end
