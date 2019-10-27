//
//  CoordinateViewController.h
//  AOCashBox
//
//  Created by Камила Валиева on 18/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AOCoordinateViewController : UIViewController

@property(nonatomic, strong,readonly) UITabBarController *tabBar;
@property(nonatomic,strong,readonly)UINavigationController *navcon;
-(UIViewController *)chooseRootController;

@end

NS_ASSUME_NONNULL_END
