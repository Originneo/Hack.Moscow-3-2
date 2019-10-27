//
//  AOButtonView.m
//  AOCashBox
//
//  Created by Камила Валиева on 17/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOButtonView.h"
@interface AOButtonView()

@property(nonatomic,strong,readwrite)NSString *title;

@end

@implementation AOButtonView

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        
        self.tintColor = UIColor.whiteColor;

        self.layer.cornerRadius = 5.f;
        self.backgroundColor = [UIColor colorWithRed:71/255. green:125/255. blue:112/255. alpha:1];
        self.layer.borderWidth=1.0f;
        self.layer.borderColor = [UIColor colorWithRed:71/255. green:125/255. blue:112/255. alpha:1].CGColor;
        self.translatesAutoresizingMaskIntoConstraints = NO;
//        self.showsTouchWhenHighlighted = YES;

    }
    return self;
}

@end
