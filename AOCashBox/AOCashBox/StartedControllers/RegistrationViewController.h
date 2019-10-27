//
//  RegistrationViewController.h
//  AOCashBox
//
//  Created by Камила Валиева on 17/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOTextFieldView.h"
NS_ASSUME_NONNULL_BEGIN

@interface RegistrationViewController : UIViewController
@property(nonatomic,strong) AOTextFieldView *textFieldPassword;
@property(nonatomic,strong) AOTextFieldView *textFieldRepeatPassword;
@end

NS_ASSUME_NONNULL_END
