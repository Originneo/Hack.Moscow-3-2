//
//  CoreDataStack.m
//  AOCashBox
//
//  Created by Камила Валиева on 23/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "CoreDataStack.h"

@implementation CoreDataStack

+ (instancetype)shared
{
    static dispatch_once_t once;
    static CoreDataStack *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [CoreDataStack new];
    });
    return sharedInstance;
}

-(NSPersistentContainer *)container
{
    @synchronized (self) {
        if (_container)
        {
            return _container;
        }
        _container = [NSPersistentContainer persistentContainerWithName:@"AOProductData"];
        [_container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * _Nonnull desc, NSError * _Nullable error) {
            if (error)
            {
                NSLog(@"Error: %@",error.localizedDescription);
                abort();
            }
        }];
        return _container;
    }
}
@end
