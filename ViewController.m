//
//  ViewController.m
//  CustomTransition
//
//  Created by 黄鹏飞 on 16/3/2.
//  Copyright © 2016年 黄鹏飞. All rights reserved.
//

#import "ViewController.h"
#import "CustomPresentAnimationController.h"
#import "ItemTableViewController.h"
#import "CustomDismissTransitionController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>
@property (strong,nonatomic) CustomPresentAnimationController *customPresentAnimationController ;
@property (strong,nonatomic) CustomDismissTransitionController *customDismissTRansitionController;
@property (strong,nonatomic) UIImageView *imageView;
@property (assign,nonatomic) CGRect imageViewFrame;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"haha.jpg"];
    CGSize size = image.size;
    CGFloat width = 0;
    CGFloat height = 0;
    if(size.width > size.height){
        height = 100;
        width = height * size.width / size.height;
    }else{
        width = 100;
        height = width * size.height / size.width;
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    imageView.image = image;
    imageView.center = self.view.center;
    self.imageViewFrame = imageView.frame;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureClick:)];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:gesture];
    self.imageView = imageView;
    [self.view addSubview:imageView];
}

- (void)gestureClick:(UITapGestureRecognizer *)gesture{
    
    __block CGRect rect = self.imageView.frame;
    [UIView animateWithDuration:2.0f animations:^{
        rect.size = self.view.bounds.size;
        rect.origin.x = 0;
        rect.origin.y = 0;
        self.imageView.frame = rect;
    } completion:^(BOOL finished) {
        self.imageView.alpha = 0.0f;
        ItemTableViewController *itemVC = [[ItemTableViewController alloc]init];
        itemVC.transitioningDelegate= self;
        [self presentViewController:itemVC animated:YES completion:^{
            self.imageView.alpha = 1.0f;
            self.imageView.frame = self.imageViewFrame;
        }];
    }];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    
//    if([segue.identifier isEqualToString:@"showDetail"]){
//        
//        ItemTableViewController *viewController = segue.destinationViewController;
//        viewController.transitioningDelegate = self;
//    }
//}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    return self.customPresentAnimationController;
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return  self.customDismissTRansitionController;
}

- (CustomPresentAnimationController *)customPresentAnimationController{
    if(!_customPresentAnimationController){
        _customPresentAnimationController = [[CustomPresentAnimationController alloc]init];
    }
    return _customPresentAnimationController;
}

- (CustomDismissTransitionController *)customDismissTRansitionController{
    if(!_customDismissTRansitionController){
        _customDismissTRansitionController = [[CustomDismissTransitionController alloc]init];
    }
    return _customDismissTRansitionController;
}

@end
