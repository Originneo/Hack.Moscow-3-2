//
//  AutorizationViewController.h
//  AOCashBox
//
//  Created by Камила Валиева on 05/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "RegistrationViewController.h"
#import "AOButtonView.h"
NS_ASSUME_NONNULL_BEGIN

@protocol AOAutorizationViewControllerOutput;


@interface AutorizationViewController : UIViewController

@property (nonatomic, weak) id<AOAutorizationViewControllerOutput> output;
@property(nonatomic,strong)UIButton *loginButton;
@property(nonatomic,strong)UIButton *registerButton;

@end


@protocol AOAutorizationViewControllerOutput

- (void)userSelectTransitionToRegistrationController;

@end

NS_ASSUME_NONNULL_END
