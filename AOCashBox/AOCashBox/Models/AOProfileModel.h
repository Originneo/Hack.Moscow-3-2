//
//  AOProfileModel.h
//  AOCashBox
//
//  Created by Антон Огурцов on 27.10.2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AOProfileModel : NSObject

@property(nonatomic,strong)NSData *profileImage;
@property(nonatomic,copy)NSString *profileName;


@end

NS_ASSUME_NONNULL_END
