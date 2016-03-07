//
//  CustomDismissTransitionController.m
//  CustomTransition
//
//  Created by 黄鹏飞 on 16/3/2.
//  Copyright © 2016年 黄鹏飞. All rights reserved.
//

#import "CustomDismissTransitionController.h"

@implementation CustomDismissTransitionController

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 2.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 动画结束后终止frame
    CGRect finalFrameForVC = [transitionContext finalFrameForViewController:toVC];
    
    // 转场切换试图
    UIView *containerView = [transitionContext containerView];
    
    toVC.view.frame = finalFrameForVC;
    toVC.view.alpha = 0.5;
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    // 生成快照 并添加到容器试图
    UIView *snapShotView = [fromVC.view snapshotViewAfterScreenUpdates:false];
    snapShotView.frame = fromVC.view.frame;
    [containerView addSubview:snapShotView];
    [fromVC.view removeFromSuperview];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        snapShotView.frame = CGRectInset(fromVC.view.frame, fromVC.view.frame.size.width * 0.5, fromVC.view.frame.size.height * 0.5);
        toVC.view.alpha = 1;
        
    } completion:^(BOOL finished) {
        [snapShotView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

- (void)animationEnded:(BOOL) transitionCompleted{
    
}
@end
