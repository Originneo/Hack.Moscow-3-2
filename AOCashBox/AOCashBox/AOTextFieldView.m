//
//  AOTextFieldView.m
//  AOCashBox
//
//  Created by Камила Валиева on 17/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOTextFieldView.h"
@interface AOTextFieldView()
@end

@implementation AOTextFieldView

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = UIColor.whiteColor;
        self.layer.borderColor = [UIColor colorWithRed:71/255. green:125/255. blue:112/255. alpha:1].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 5.f;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self endEditing:YES];

    }
    return self;
}


- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y + 5, bounds.size.width - 20, bounds.size.height - 10);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y + 5, bounds.size.width - 20, bounds.size.height - 10);
}

@end
