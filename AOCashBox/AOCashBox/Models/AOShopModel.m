//
//  AOShopModel.m
//  AOCashBox
//
//  Created by Камила Валиева on 22/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOShopModel.h"

@implementation AOShopModel
- (instancetype)initWithShopName:(NSString*)shopName
{
    self = [super init];
    if (self) {
        _shopName = shopName;
    }
    return self;
}
@end
