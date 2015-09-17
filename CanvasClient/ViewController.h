//
//  ViewController.h
//  CanvasClient
//
//  Created by anjaneya kamat on 9/17/15.
//  Copyright (c) 2015 anjaneya kamat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *happyGesture;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *excitedGesture;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *tongueGesture;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *deadGesture;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *sadGesture;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *winkGesture;

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *onTrayPanGesture;
@property CGPoint trayOriginalCenter;
@property (weak, nonatomic) IBOutlet UIView *trayView;
@end

