//
//  AOCustomHistoryTableViewCell.m
//  AOCashBox
//
//  Created by Камила Валиева on 22/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOCustomHistoryTableViewCell.h"
@interface AOCustomHistoryTableViewCell()
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIImageView *customImageView;
@property (nonatomic,strong) UILabel *price;
@end
@implementation AOCustomHistoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = UIColor.whiteColor;
        
        _customImageView = [[UIImageView alloc] init];
        _label = [[UILabel alloc] init];
        _price = [[UILabel alloc]init];
        [self.contentView addSubview:_label];
        [self.contentView addSubview:_customImageView];
        [self.contentView addSubview:_price];
        [self makeConstraints];
    }
    return self;
}

- (void)prepareForReuse
{
    self.label.text = nil;
    self.customImageView.image = nil;
    self.price.text = nil;
    [super prepareForReuse];
}
-(void)makeConstraints
{
    _customImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    _price.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_customImageView.leadingAnchor constraintEqualToSystemSpacingAfterAnchor:self.leadingAnchor multiplier:1].active = YES;
    [_customImageView.widthAnchor constraintEqualToConstant:50].active = YES;
    [_customImageView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_customImageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:1].active = YES;
    
    [_label.leadingAnchor constraintLessThanOrEqualToSystemSpacingAfterAnchor:_customImageView.trailingAnchor multiplier:9].active = YES;
    [_label.trailingAnchor constraintEqualToSystemSpacingAfterAnchor:_price.leadingAnchor multiplier:5].active = YES;
    [_label.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_label.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:1].active = YES;
    
    [_price.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-15].active = YES;
    [_price.widthAnchor constraintEqualToConstant:140].active = YES;
    [_price.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_price.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:1].active = YES;
}


@end
