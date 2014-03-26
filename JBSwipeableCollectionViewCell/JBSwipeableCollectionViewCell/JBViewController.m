//
//  JBViewController.m
//  JBSwipableCollectionViewCell
//
//  Created by Jabari Bell on 3/26/14.
//  Copyright (c) 2014 Jabari Bell. All rights reserved.
//

#import "JBViewController.h"
#import "JBSwipeableCollectionViewCell.h"

@interface JBViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *items;

@end

@implementation JBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set up items
    NSInteger numItems = 20;
    NSMutableArray *tempItems = [NSMutableArray array];
    
    for (NSInteger i = 0; i < numItems; i++) {
        [tempItems addObject:@"lolz"];
    }
    
    self.items = [tempItems copy];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[JBSwipeableCollectionViewCell class] forCellWithReuseIdentifier:@"CellIdentifier"];
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource methods
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JBSwipeableCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

#pragma mark - UICollectionViewDelegate methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UICollectionViewFlowLayoutDelegate methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.bounds.size.width - 10, 85);
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
