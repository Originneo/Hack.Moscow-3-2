//
//  AOProductModel.h
//  AOCashBox
//
//  Created by Камила Валиева on 22/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@import CoreData;

@interface AOProductModel : NSManagedObject //Создаем управляем объект для корДаты

@property(nonatomic,copy)NSString *productName;
@property(nonatomic,assign)NSInteger cost;
@property(nonatomic,strong)UIImage *productImage;
@property(nonatomic,strong)NSString *date;

-(NSDictionary *)generateDictProducts;

@end

NS_ASSUME_NONNULL_END
