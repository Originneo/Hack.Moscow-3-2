//
//  AOButtonView.h
//  AOCashBox
//
//  Created by Камила Валиева on 17/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AOButtonView : UIButton

@property(nonatomic,strong,readonly)NSString *title;

- (instancetype)initWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
