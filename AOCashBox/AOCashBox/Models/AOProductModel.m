//
//  AOProductModel.m
//  AOCashBox
//
//  Created by Камила Валиева on 22/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOProductModel.h"

@implementation AOProductModel

@dynamic cost;
@dynamic productName;
@dynamic productImage;
@dynamic date;

-(NSDictionary *)generateDictProducts
{
    NSDictionary *dictionary = @{
                                 @"Колбаса" : [UIImage imageNamed:@"колбаса"],
                                 @"Мороженое" : [UIImage imageNamed:@"мороженое"],
                                 @"Конфеты" : [UIImage imageNamed:@"конфеты"],
                                 @"Шоколад" : [UIImage imageNamed:@"шоколад"],
                                 @"Помидоры" : [UIImage imageNamed:@"помидоры"],
                                 @"Огурцы" : [UIImage imageNamed:@"огурцы"],
                                 @"Кетчуп" : [UIImage imageNamed:@"кетчуп"],
                                 @"Майонез" : [UIImage imageNamed:@"майонез"],
                                 };
    return dictionary;
}
@end
