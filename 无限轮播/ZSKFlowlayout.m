//
//  ZSKFlowlayout.m
//  无限轮播
//
//  Created by  庄少坤 on 2018/3/27.
//  Copyright © 2018年  庄少坤. All rights reserved.
//

#import "ZSKFlowlayout.h"

@implementation ZSKFlowlayout

-(void)prepareLayout {
    [super prepareLayout];

    self.itemSize = self.collectionView.bounds.size;
    self.collectionView.bounces = NO;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.collectionView.pagingEnabled = YES;
}

@end
