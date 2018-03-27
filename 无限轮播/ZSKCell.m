//
//  ZSKCell.m
//  无限轮播
//
//  Created by  庄少坤 on 2018/3/27.
//  Copyright © 2018年  庄少坤. All rights reserved.
//

#import "ZSKCell.h"

@implementation ZSKCell {
    UIImageView *_imageView;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
//        NSLog(@"%@",NSStringFromCGRect(self.bounds));
        [self.contentView addSubview:_imageView];
        _imageView.backgroundColor = [UIColor blueColor];
    }
    return self;
}

-(void)setUrl:(NSURL *)url {
    _url = url;
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    _imageView.image = image;
}

@end
