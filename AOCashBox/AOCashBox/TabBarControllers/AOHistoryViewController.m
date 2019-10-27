//
//  AOHistoryViewController.m
//  AOCashBox
//
//  Created by Камила Валиева on 18/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOHistoryViewController.h"
#import "AOCustomHistoryTableViewCell.h"
#import "AOProductModel.h"
#import "CoreDataStack.h"
static NSString const *TableViewReuseIdentifier = @"AOHistoryTableViewReuseIdentifier";
@import CoreData;
@interface AOHistoryViewController ()
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) NSManagedObjectContext *context;
@property (nonatomic,strong)NSArray<NSString *> *historyData;
@property(nonatomic,strong)NSFetchedResultsController *resultController;
@property (nonatomic, strong) CAGradientLayer *backgroundView;

@end

@implementation AOHistoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.clearColor;
    self.backgroundView = [CAGradientLayer layer];
    self.backgroundView.frame = self.view.bounds;
    self.backgroundView.colors = @[(id)[UIColor colorWithRed:205./255 green:166./255 blue:253./255 alpha:1].CGColor,(id)[UIColor colorWithRed:255./255 green:222./255 blue:166./255 alpha:1].CGColor];
    [self.view.layer insertSublayer:self.backgroundView atIndex:0];
    self.context = [CoreDataStack shared].container.newBackgroundContext;
    
    self.historyData = @[@"10-07-2019",@"11-07-2019",@"12-07-2019",@"13-07-2019",@"14-07-2019",@"15-07-2019",@"16-07-2019",@"17-07-2019"];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"dataIsWriten"];
   
    if (data == nil)
    {
        [self write];
        [[NSUserDefaults standardUserDefaults] setObject:@(1) forKey:@"dataIsWriten"];
    }
    [self read];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = UIColor.clearColor;
    [self.tableView registerClass:[AOCustomHistoryTableViewCell class] forCellReuseIdentifier:@"id"];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self makeConstraints];
}

- (void) write //Обрабатываем запись в контекст
{
    [self.context performBlock:^{

        for (NSInteger index = 0; index < 100; index ++)
        {
            AOProductModel *object = [[AOProductModel alloc] initWithContext:self.context];
            NSDictionary *dictionary = [object generateDictProducts];
            object.cost = arc4random() % 999 + 150;
            object.date = self.historyData[arc4random() % 8];
            object.productName = dictionary.allKeys[arc4random() % dictionary.count];
            object.productImage = dictionary[object.productName];
            
        }
        [self.context save:nil];
        NSLog(@"Done!");
    }];
}

- (void) read //Читаем из контекста
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"ProductModel"];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    self.resultController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.context sectionNameKeyPath:@"date" cacheName:nil];
    [self.resultController performFetch:nil];

    
    
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { //Записываем информацию из resultController в ячейки
    AOCustomHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    AOProductModel *model = [self.resultController objectAtIndexPath:indexPath];
    cell.price.text = [[NSString alloc] initWithFormat:@"%li рублей",model.cost];
    cell.label.text = model.productName;
    cell.customImageView.image = model.productImage;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.resultController sections][section].numberOfObjects;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.resultController sections].count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section //Обрабатываем вид хэдера таблица
{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor =  UIColor.whiteColor;
    headerView.tintColor = UIColor.blackColor;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:17]];
    [label setText:[self.resultController sections][section].name];
    [headerView addSubview:label];
    return headerView;
}



#pragma mark - makeConstraints
-(void)makeConstraints
{
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

    cell.transform = CGAffineTransformMakeTranslation(0.f, 50);
    cell.layer.shadowColor = [[UIColor greenColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 50);
    cell.alpha = 0;
    
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:1.5];
    cell.transform = CGAffineTransformMakeTranslation(0.f, 0);
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0,0);
    [UIView commitAnimations];
}
@end
