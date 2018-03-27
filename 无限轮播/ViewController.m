//
//  ViewController.m
//  无限轮播
//
//  Created by  庄少坤 on 2018/3/27.
//  Copyright © 2018年  庄少坤. All rights reserved.
//

#import "ViewController.h"
#import "ZSKCollectionView.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSArray<NSURL *> *_urls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
    
    ZSKCollectionView *collectionView = [[ZSKCollectionView alloc] initWithURLS:_urls];
    
//    NSLog(@"--%@",_urls);
    
    [self.view addSubview:collectionView];
    
    
    
//    NSLog(@"%@",_urls);
}


- (void)loadData {
    NSMutableArray *arrays = [NSMutableArray arrayWithCapacity:4];
    
    for (NSInteger i = 0; i <= 3; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%02zd.jpg",i];
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        [arrays addObject:url];
    }
    _urls = arrays.copy;
}


@end
