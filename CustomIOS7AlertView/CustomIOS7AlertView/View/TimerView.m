//
//  TimerView.m
//  CustomIOS7AlertView
//
//  Created by Daniel Warrington on 24/10/13.
//  Copyright (c) 2013 Wimagguc. All rights reserved.
//

#import "TimerView.h"

@implementation TimerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupAppearance];
        [self startTimer];
    }
    return self;
}

- (void)setupAppearance
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor whiteColor] CGColor],
                       (id)[[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0f] CGColor],
                       (id)[[UIColor whiteColor] CGColor],
                       nil];
    
    CGFloat cornerRadius = 5.0f;
    gradient.cornerRadius = cornerRadius;
    [self.layer insertSublayer:gradient atIndex:0];
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderColor = [[UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0f] CGColor];
    self.layer.borderWidth = 0.5f;
    self.layer.shadowRadius = cornerRadius + 5;
    self.layer.shadowOpacity = 0.1f;
    self.layer.shadowOffset = CGSizeMake(0 - (cornerRadius+5)/2, 0 - (cornerRadius+5)/2);
    
    _timerLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _timerLabel.text = @"10";
    _timerLabel.textColor = [UIColor redColor];
    _timerLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_timerLabel];
}

- (void)startTimer
{
    NSLog(@"timer");
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateTimerLabel)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)updateTimerLabel
{
    if (_timerLabel.text.intValue <= 1) {
        [UIView animateWithDuration:1.0 animations:^{
            self.alpha = 0.0;
        }completion:^(BOOL finished){
            [self.superview removeFromSuperview];
            [_timer invalidate];
            _timer = nil;
        }];
        
        
    }
    _timerLabel.text = [NSString stringWithFormat:@"%d", [_timerLabel.text intValue] - 1];
    
    [self animateView];
}

- (void)animateView
{
    [UIView animateWithDuration:0.2 delay:0 options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.transform = CGAffineTransformScale(self.transform, 1.1, 1.1);
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.2 delay:0 options: UIViewAnimationOptionCurveLinear
                                          animations:^{
                                              self.transform = CGAffineTransformScale(self.transform, 1/1.1, 1/1.1);
                                          }
                                          completion:^(BOOL finished){
                                        
                                          }];
                     }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


 
@end
