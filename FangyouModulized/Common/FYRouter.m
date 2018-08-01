//
//  FYRouter.m
//  FangyouModulized
//
//  Created by 陈震 on 2018/7/25.
//

#import "FYRouter.h"
#import "UIViewController+FYCategory.h"
#import "MJExtension/MJExtension.H"
#import "NSBundle+FYStyle.h"

static FYRouter *instance = nil;

@interface FYRouter()

@property(nonatomic ,strong) NSDictionary *routeAndVC;

@end

@implementation FYRouter

- (NSDictionary *)routeAndVC{
    if (nil == _routeAndVC) {
        NSString *plistPath = [[NSBundle fy_resourceBundle] pathForResource:@"Router"
                                                                     ofType:@"plist"];
        _routeAndVC = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    }
    return _routeAndVC;
}

+ (instancetype)sharedRouter{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self class] new];
    });
    return instance;
}

#pragma mark public
- (void)pushViewController:(UIViewController *)viewController{
    UINavigationController *nav = [UIViewController currentViewController].navigationController;
    if ((nav==nil) || (![nav isKindOfClass:[UINavigationController class]])) {
        nav = (UINavigationController *)[[UIApplication sharedApplication].delegate window].rootViewController;
    }
    
    //err tip
    NSString *title = @"";
    if (nav == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络开小差:lack of nav" message:title delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    if(viewController == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络开小差:lack of viewConroller" message:title delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    if (![nav isKindOfClass:[UINavigationController class]]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络开小差:lack of nav(type error）" message:title delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    
    if ([nav isKindOfClass:[UINavigationController class]]) {
        [nav pushViewController:viewController animated:YES];
    }
}

- (void)replaceLastViewControllerWithVC:(nullable UIViewController *) viewController{
    if (nil == viewController) {
        return;
    }
    UIViewController *curtrentVC = [UIViewController currentViewController];
    UINavigationController *nav = curtrentVC.navigationController;
    NSMutableArray *vcs = [[NSMutableArray alloc] initWithArray:nav.viewControllers];
    [vcs replaceObjectAtIndex:vcs.count - 1 withObject:viewController];
    [nav setViewControllers:vcs animated:YES];
}

- (void)openRoute:(NSString *)route{
    [self openRoute:route withParameters:nil];
}

- (void)openRoute:(NSString *)route withParameters:(NSDictionary<NSString *,id> *)parameters{
    NSString *vcName = self.routeAndVC[route];
    UIViewController *vc = [NSClassFromString(vcName) new];
    if (parameters) {
        [self _fulfillParameters:parameters toObj:vc];
    }
    [self pushViewController:vc];
}

#pragma mark private

- (void)_fulfillParameters:(NSDictionary *)parameters toObj:(id) obj{
    for (NSString *key  in parameters.allKeys) {
        NSString *selectorName = [NSString stringWithFormat:@"set%@:",key.mj_firstCharUpper];
        SEL setSelecter = NSSelectorFromString(selectorName);
        if ([obj respondsToSelector:setSelecter]) {
            id value = [parameters objectForKey:key];
            [obj setValue:value forKey:key];
        }
    }
}

@end
