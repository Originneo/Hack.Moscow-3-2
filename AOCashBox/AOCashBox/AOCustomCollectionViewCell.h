//
//  AOCustomCollectionViewCell.h
//  AOCashBox
//
//  Created by Камила Валиева on 25/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AOCustomCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIActivityIndicatorView *spinner;
@property (nonatomic, strong) UILabel *title;

- (instancetype) initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
