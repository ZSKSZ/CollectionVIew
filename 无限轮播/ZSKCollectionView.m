//
//  ZSKCollectionView.m
//  无限轮播
//
//  Created by  庄少坤 on 2018/3/27.
//  Copyright © 2018年  庄少坤. All rights reserved.
//

#import "ZSKCollectionView.h"
#import "ZSKFlowlayout.h"
#import "ZSKCell.h"

static NSString *cellId = @"cellId";

@interface ZSKCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ZSKCollectionView {
    NSArray<NSURL *> *_urls;
}

-(instancetype)initWithURLS:(NSArray<NSURL *> *)urls {
    if (self = [super initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width - 40, 200) collectionViewLayout:[ZSKFlowlayout new]]) {
        _urls = urls;
//        NSLog(@"%ld",_urls.count);
        
        [self registerClass:[ZSKCell class] forCellWithReuseIdentifier:cellId];
        
        self.dataSource = self;
        self.delegate = self;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //滚动到第二组
            NSIndexPath *index = [NSIndexPath indexPathForItem:_urls.count inSection:0];
            
            [self scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        });
        
        
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _urls.count * 2;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZSKCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];

    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];


    cell.url = _urls[indexPath.item % _urls.count];
    
    
    
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //currentPage
    NSInteger offset = scrollView.contentOffset.x / self.bounds.size.width;
    if (offset == 0 || offset == [self numberOfItemsInSection:0] - 1) {
        NSLog(@"%ld",offset);
        offset = offset == 0? _urls.count : _urls.count - 1;
    }
    scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
}



@end
