//
//  NetworkService.h
//  AOCashBox
//
//  Created by Камила Валиева on 25/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkServiceProtocol.h"
#import "NetworkHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject<NetworkServiceInputProtocol, NSURLSessionDelegate>

@property (nonatomic, weak) id<NetworkServiceOutputProtocol> output; /**< Делегат внешних событий */

@end

NS_ASSUME_NONNULL_END
