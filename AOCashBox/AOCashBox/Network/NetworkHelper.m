//
//  NetworkHelper.m
//  AOCashBox
//
//  Created by Камила Валиева on 25/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "NetworkHelper.h"


@implementation NetworkHelper

+ (NSString *)URLForSearchString //Создаем ссылку для запроса
{
    NSString *projectName = @"selfypay-19b7e";
    return [NSString stringWithFormat:@"https://%@.firebaseio.com/.json", projectName];
}

@end
