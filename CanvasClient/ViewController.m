//
//  ViewController.m
//  CanvasClient
//
//  Created by anjaneya kamat on 9/17/15.
//  Copyright (c) 2015 anjaneya kamat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIImageView *newlyCreatedFace;
@end


@implementation ViewController


static CGFloat const upPosition = 468.0;
static CGFloat const downPosition = 640.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onFacePanGesture:(UIPanGestureRecognizer*)sender {
         CGPoint point = [sender locationInView:self.trayView];
        if ([sender state] == UIGestureRecognizerStateBegan) {
            self.newlyCreatedFace = (UIImageView *)sender.view;

            self.newlyCreatedFace = [[UIImageView alloc] initWithImage:((UIImageView *) sender.view).image];
            
            [self.view addSubview:self.newlyCreatedFace];
            self.newlyCreatedFace.center = CGPointMake(self.newlyCreatedFace.center.x, self.newlyCreatedFace.center.y + self.trayView.frame.origin.y);

            
            NSLog(@"onFacePanGesture Began");
        }
        else if ([sender state] == UIGestureRecognizerStateChanged) {
            self.newlyCreatedFace.center = point;
            NSLog(@"onFacePanGesture Changed");
        }
        else if ([sender state] == UIGestureRecognizerStateEnded) {
             [UIView animateWithDuration:7.0 animations:^{
        self.newlyCreatedFace.transform = CGAffineTransformIdentity;
       }];
            
            NSLog(@"onFacePanGesture Ended");
      }

}

- (IBAction)onTray:(UIPanGestureRecognizer *)sender {
    if ([sender state] == UIGestureRecognizerStateBegan) {
        self.trayOriginalCenter = self.trayView.center;
        NSLog(@"Began");
    } else if ([sender state] == UIGestureRecognizerStateChanged) {
        self.trayView.center = CGPointMake(self.trayOriginalCenter.x, self.trayOriginalCenter.y + [sender translationInView:self.trayView].y);
         NSLog(@"Changed");
    } else if ([sender state] == UIGestureRecognizerStateEnded) {
        BOOL movingUp = [sender velocityInView:self.trayView].y < 0.0;
        CGPoint destination = CGPointMake(self.trayOriginalCenter.x, movingUp ? upPosition : downPosition);
        [UIView animateWithDuration:7.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:0 animations:^{
            self.trayView.center = destination;
            
        } completion:nil];
        
        NSLog(@"Ended");
    } else {
        NSLog(@"No state");
    }


}

@end
