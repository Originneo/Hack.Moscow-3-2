//
//  AOShopModel.h
//  AOCashBox
//
//  Created by Камила Валиева on 22/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AOShopModel : NSObject

@property(nonatomic,strong)NSData *shopImage;
@property(nonatomic,copy)NSString *shopName;
@property(nonatomic,copy)NSString *count;
@property(nonatomic,copy)NSString *URLofImage;
@property(nonatomic,copy)NSString *typeOfShop;

- (instancetype)initWithShopName:(NSString *)shopName; 

@end

NS_ASSUME_NONNULL_END
