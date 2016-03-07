//
//  ItemTableViewController.m
//  CustomTransition
//
//  Created by 黄鹏飞 on 16/3/2.
//  Copyright © 2016年 黄鹏飞. All rights reserved.
//

#import "ItemTableViewController.h"

@interface ItemTableViewController () 
@property (strong,nonatomic) UIImageView *imageView;
@end

@implementation ItemTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    UIImage *image = [UIImage imageNamed:@"haha.jpg"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = image;
    imageView.center = self.view.center;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureClick:)];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:gesture];
    self.imageView = imageView;
    [self.view addSubview:imageView];  
}

- (void)gestureClick:(UITapGestureRecognizer *)gesture{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
