//
//  FYRouter.h
//  FangyouModulized
//
//  Created by 陈震 on 2018/7/25.
//

#import <Foundation/Foundation.h>

@interface FYRouter : NSObject

+ (instancetype _Nullable )sharedRouter;
- (void)pushViewController:(nullable UIViewController *) viewController;

/**
 push route对应的view controller
 
 @param route vc的路径。如果有必填参数，route中必须显示
 */
- (void)openRoute:(nullable NSString *)route;

/**
 push route对应的view controller
 
 @param route vc的路径。如果有必填参数，route中必须显示
 @param parameters 附加参数，例如对象类型，就必须用parameters 传递
 */
- (void)openRoute:(nullable NSString *)route
   withParameters:(nullable NSDictionary<NSString *, id> *)parameters;

@end
