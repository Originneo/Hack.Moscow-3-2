//
//  AOChangeModeViewController.h
//  AOCashBox
//
//  Created by Антон Огурцов on 27.10.2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    AOModeCurier = 0,
    AOModeShop = 1,
    AOModeCustomer = 2,
} AOMode;
@interface AOChangeModeViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
