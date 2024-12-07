//
//  ViewController.m
//  Objective-C-TextAnimation
//
//  Created by Angelos Staboulis on 7/12/24.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, height / 2.0, 350, 65)];
    label.text = @"Slide to power off";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:34];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [self shimmer:label];
}
- (void)shimmer:(UIView *)view {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, -0.02);
    gradient.frame = CGRectMake(0, 0, view.bounds.size.width * 3, view.bounds.size.height);
    
    CGFloat lowerAlpha = 0.7;
    CGColorRef solid = [[UIColor colorWithWhite:1 alpha:1] CGColor];
    CGColorRef clear = [[UIColor colorWithWhite:1 alpha:lowerAlpha] CGColor];
    gradient.colors = @[(__bridge id)solid, (__bridge id)solid, (__bridge id)clear, (__bridge id)clear, (__bridge id)solid, (__bridge id)solid];
    gradient.locations = @[@(0), @(0.3), @(0.45), @(0.55), @(0.7), @(1)];
    
    CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    theAnimation.duration = 2;
    theAnimation.repeatCount = HUGE_VALF;
    theAnimation.autoreverses = NO;
    theAnimation.removedOnCompletion = NO;
    theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.fromValue = @(-view.frame.size.width * 2);
    theAnimation.toValue = @(0);
    [gradient addAnimation:theAnimation forKey:@"animateLayer"];
    
    view.layer.mask = gradient;
}


@end
