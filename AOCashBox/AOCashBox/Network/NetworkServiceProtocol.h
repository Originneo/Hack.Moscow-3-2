//
//  NetworkServiceProtocol.h
//  AOCashBox
//
//  Created by Камила Валиева on 23/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOShopModel.h"

@protocol NetworkServiceOutputProtocol <NSObject>
@optional

- (void)loadingIsDoneWithDataRecieved:(AOShopModel *)dataRecieved;

@end

@protocol NetworkServiceInputProtocol <NSObject>
@optional

- (void)configureUrlSessionWithParams:(NSDictionary *)params;
- (void)takeAllDataShops;

@end
