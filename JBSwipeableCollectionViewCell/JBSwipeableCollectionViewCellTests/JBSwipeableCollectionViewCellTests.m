//
//  JBSwipableCollectionViewCellTests.m
//  JBSwipableCollectionViewCellTests
//
//  Created by Jabari Bell on 3/26/14.
//  Copyright (c) 2014 Jabari Bell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JBSwipeableCollectionViewCell.h"
#import "JBViewController.h"

/**
 *  Data scource for our collection view.
 */
@interface CellDataSource : NSObject <UICollectionViewDataSource>

@end

@implementation CellDataSource

static NSInteger numCells = 50;
static NSString *CellIdentifier = @"CellIdentifier";

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return numCells;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JBSwipeableCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}

@end

/**
 *  Tests!
 */
@interface JBSwipableCollectionViewCellTests : XCTestCase

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CellDataSource *dataSource;

@end

@implementation JBSwipableCollectionViewCellTests

- (void)setUp
{
    [super setUp];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    JBViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"JBViewController"];
    [viewController view];
    
    self.dataSource = [CellDataSource new];
    self.collectionView = viewController.collectionView;
    self.collectionView.dataSource = self.dataSource;
}

- (void)tearDown
{
    self.dataSource = nil;
    self.collectionView.dataSource = nil;
    self.collectionView = nil;
    [super tearDown];
}

- (void)testThatCellIsNotNil
{
    JBSwipeableCollectionViewCell *cell = (JBSwipeableCollectionViewCell *)[self.dataSource collectionView:self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    //weird, test only passes if I make a call on the cell
    [cell layoutIfNeeded];
    XCTAssertNotNil(cell, @"Cell should not be nil.");
}


@end
