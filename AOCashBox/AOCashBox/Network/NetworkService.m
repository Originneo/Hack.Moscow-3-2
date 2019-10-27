//
//  NetworkService.m
//  AOCashBox
//
//  Created by Камила Валиева on 25/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "NetworkService.h"
#import "AOShopModel.h"


@interface NetworkService ()

@property (nonatomic, strong) NSURLSession *urlSession;
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, strong) NSData *resumeData;

@end

@implementation NetworkService

- (void)configureUrlSessionWithParams:(NSDictionary *)params
{
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Настравиваем Session Configuration
    [sessionConfiguration setAllowsCellularAccess:YES];
    if (params)
    {
        [sessionConfiguration setHTTPAdditionalHeaders:params];
    }
    else
    {
        [sessionConfiguration setHTTPAdditionalHeaders:@{ @"Accept" : @"application/json" }];
    }
    
    // Создаем сессию
    self.urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
}


- (void)takeAllDataShops
{
    NSString *urlString = [NetworkHelper URLForSearchString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    
    NSURLSession *session;
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (temp[@"shop"])
        {
        NSDictionary *arrayOfShops = temp[@"shop"];
        
        for (NSDictionary *shop in arrayOfShops)
        {
            NSDictionary *dict = arrayOfShops[shop];
            for (NSDictionary *typeofshop in dict) {
            
                NSString *name = dict[typeofshop][@"name"];
                NSString *url = dict[typeofshop][@"url"];
                NSString *count = dict[typeofshop][@"count"];
                NSString *type = dict[typeofshop][@"type"];
                AOShopModel *shopModel = [[AOShopModel alloc]initWithShopName:name];
                shopModel.URLofImage = url;
                shopModel.count = count;
                shopModel.typeOfShop = type;
                
                NSURL *realUrl = [NSURL URLWithString:url];
                NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
                [[session dataTaskWithURL:realUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    shopModel.shopImage = data;
                    dispatch_async(dispatch_get_main_queue(), ^{
                            [self.output loadingIsDoneWithDataRecieved:shopModel];
                    });
                }] resume];
            }
        }
    }
    }];
    [sessionDataTask resume];
}

@end

