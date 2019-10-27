//
//  AOCircleView.h
//  AOCashBox
//
//  Created by Антон Огурцов on 27.10.2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AOCircleView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *name;

- (instancetype)initWithImage:(UIImage *)image description:(NSString *)description;

@end

NS_ASSUME_NONNULL_END
