//
//  AOCircleView.m
//  AOCashBox
//
//  Created by Антон Огурцов on 27.10.2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOCircleView.h"

@implementation AOCircleView


- (instancetype)initWithImage:(UIImage *)image description:(NSString *)description
{
    self = [super init];
    if (self) {
        _imageView = [UIImageView new];
        _name = [UILabel new];
        

        _imageView.image = image;
        
        _imageView.layer.borderWidth = 1.f;
        _imageView.layer.borderWidth = 0.9f;
        
        _name.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;

        [_name setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:18]];
        NSString *string = description;
        [_name setText:string];
        _name.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_imageView];
        [self addSubview:_name];
        [self makeConstraints];
        _imageView.layer.cornerRadius = 90/2;
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;

    }
    return self;
}

- (void)makeConstraints
{
    [_name.centerXAnchor constraintEqualToAnchor:self.centerXAnchor ].active = YES;
    [_name.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:50].active = YES;
    [_name.widthAnchor constraintGreaterThanOrEqualToConstant:90].active = YES;
    [_name.heightAnchor constraintEqualToAnchor:_name.widthAnchor].active = YES;
    
    [_imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [_imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:-25].active = YES;
    [_imageView.widthAnchor constraintEqualToConstant:90].active = YES;
    [_imageView.heightAnchor constraintEqualToAnchor:_imageView.widthAnchor].active = YES;
}

@end
