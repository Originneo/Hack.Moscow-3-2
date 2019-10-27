//
//  AOCustomHistoryTableViewCell.h
//  AOCashBox
//
//  Created by Камила Валиева on 22/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AOCustomHistoryTableViewCell : UITableViewCell

@property (nonatomic,readonly) UILabel *label;
@property (nonatomic,readonly) UIImageView *customImageView;
@property(nonatomic,readonly) UILabel *price;

@end

NS_ASSUME_NONNULL_END
