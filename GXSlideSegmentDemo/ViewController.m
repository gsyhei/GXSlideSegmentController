//
//  ViewController.m
//  GXSlideSegmentDemo
//
//  Created by  GuoShengyong on 16/4/5.
//  Copyright © 2016年 bql. All rights reserved.
//

#import "ViewController.h"
#import "GXSlideSegmentController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    // add viewControllers
    NSMutableArray *vcs = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = [NSString stringWithFormat:@"%d", i];
        vc.view.backgroundColor = [UIColor colorWithRed:((255.0 * (i%2)) / 255) green:((255.0 * ((i+1)%2)) / 255) blue:((255.0 * ((i+2)%2)) / 255) alpha:1];
        
        UILabel *label = [[UILabel alloc] initWithFrame:vc.view.bounds];
        label.text = [NSString stringWithFormat:@"%d", i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:100];
        label.textColor = [UIColor purpleColor];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        [vc.view addSubview:label];
        
        [vcs addObject:vc];
    }
    
    GXSlideSegmentController *slideSegmentController = [[GXSlideSegmentController alloc] initWithViewControllers:vcs];
    slideSegmentController.title = @"GXSlideSegmentController";
    slideSegmentController.segmentBarHeight = 20;
    slideSegmentController.indicatorInsets = UIEdgeInsetsMake(0, 8, 0, 8);
    slideSegmentController.indicator.backgroundColor = [UIColor redColor];
    slideSegmentController.indicator.layer.cornerRadius = slideSegmentController.indicator.frame.size.height/2;
    [self.navigationController pushViewController:slideSegmentController animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
