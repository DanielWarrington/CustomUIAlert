//
//  TimerView.h
//  CustomIOS7AlertView
//
//  Created by Daniel Warrington on 24/10/13.
//  Copyright (c) 2013 Wimagguc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerView : UIView

@property (nonatomic) UILabel *timerLabel;
@property (nonatomic, strong) NSTimer *timer;

@end
