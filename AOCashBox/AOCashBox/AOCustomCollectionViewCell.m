//
//  AOCustomCollectionViewCell.m
//  AOCashBox
//
//  Created by Камила Валиева on 25/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOCustomCollectionViewCell.h"

@implementation AOCustomCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [UIImageView new];
        [self.contentView addSubview:_imageView];
        
        _title = [UILabel new];
        _title.backgroundColor = UIColor.whiteColor;
        _title.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_title];
        
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _spinner = [[UIActivityIndicatorView alloc] init];
        [self.contentView addSubview:_spinner];
        _spinner.color = UIColor.blueColor;
        [_spinner setCenter:self.contentView.center];
        
        self.contentView.layer.cornerRadius = 20;
        self.contentView.layer.cornerRadius = 20.0f;
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = [UIColor clearColor].CGColor;
        self.contentView.layer.masksToBounds = YES;
        
        self.layer.shadowColor = UIColor.blackColor.CGColor;
        self.layer.shadowOffset = CGSizeMake(1.f, 4.f);
        self.layer.shadowRadius = 2.5f;
        self.layer.shadowOpacity = .4f;
        self.layer.masksToBounds = NO;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.contentView.layer.cornerRadius].CGPath;
        
        [self makeConstraints];
    }
    
    return self;
}


- (void)prepareForReuse //Подготавливаем ячейки для переиспользования
{
    self.imageView.image = nil;
    self.title.text = nil;
    
    [super prepareForReuse];
}

- (void)makeConstraints
{
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    _title.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [_imageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [_imageView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [_imageView.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor multiplier:0.71].active = YES;
    [_title.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [_title.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [_title.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [_title.topAnchor constraintEqualToAnchor:_imageView.bottomAnchor].active = YES;
}

@end
