//
//  CustomPresentAnimationController.m
//  CustomTransition
//
//  Created by 黄鹏飞 on 16/3/2.
//  Copyright © 2016年 黄鹏飞. All rights reserved.
//

#import "CustomPresentAnimationController.h"


@implementation CustomPresentAnimationController

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 2.0f;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 动画结束后终止frame
    CGRect finalFrameForVC = [transitionContext finalFrameForViewController:toVC];
    
    // 转场切换试图
    UIView *containerView = [transitionContext containerView];
//    CGRect mainBounds = [UIScreen mainScreen].bounds;
    toVC.view.frame = CGRectOffset(finalFrameForVC, 0, 0);
    [containerView addSubview:toVC.view];
    
   [UIView animateWithDuration:[self transitionDuration:transitionContext]  delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear  animations:^{
       
       fromVC.view.alpha = 0.5;
       toVC.view.frame = finalFrameForVC;
       
   } completion:^(BOOL finished) {
       
       [transitionContext completeTransition:YES];
       fromVC.view.alpha = 1.0f;
   }];
}

// This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
- (void)animationEnded:(BOOL) transitionCompleted{
    
}
@end
