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
 *  Cell Delegate
 */

@interface CellDelegate : NSObject <JBSwipeableCollectionViewCellDelegate>

@end

@implementation CellDelegate

@end

/**
 *  Tests!
 */
@interface JBSwipeableCellTests : XCTestCase

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CellDataSource *dataSource;
@property (nonatomic, strong) JBSwipeableCollectionViewCell *cell;

@end

@implementation JBSwipeableCellTests

/**
 *  Setup
 */

- (void)setUp
{
    [super setUp];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    JBViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"JBViewController"];
    [viewController view];
    
    self.dataSource = [CellDataSource new];
    self.collectionView = viewController.collectionView;
    self.collectionView.dataSource = self.dataSource;
    
    CellDelegate *delegate = [CellDelegate new];
    
    self.cell = (JBSwipeableCollectionViewCell *)[self.dataSource collectionView:self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    self.cell.delegate = delegate;
    //need this call to the cell's delegate method for it to stick for some reason
    NSLog(@"delegatecell: %@", self.cell.delegate);
    //weird, test only passes if I make a call on the cell
    [self.cell layoutIfNeeded];
}

- (void)tearDown
{
    self.cell = nil;
    self.dataSource = nil;
    self.collectionView.dataSource = nil;
    self.collectionView = nil;
    [super tearDown];
}

/**
 *  Creation Tests
 */

- (void)testThatCellIsNotNil
{
    XCTAssertNotNil(self.cell, @"Cell should not be nil.");
}

- (void)testThatCellHasDefaultRightToLeftSwipeDirection
{
    XCTAssertEqual(self.cell.swipeDirection, JBSwipeDirectionRightToLeft, @"A cell should have a default swipe direction of right to left.");
}

- (void)testThatisSwipeableByDefault
{
    XCTAssertTrue(self.cell.isSwipeable, @"A cell should be swipeable until set otherwise.");
}

- (void)testThatABottomViewIsCreated
{
    XCTAssertNotNil(self.cell.bottomView, @"A cell should have a bottom view.");
}

- (void)testThatAScrollViewIsCreated
{
    XCTAssertNotNil(self.cell.scrollView, @"A cell should have a scrollview.");
}

- (void)testThatCellHasADelegate
{
    NSLog(@"cell delegate: %@", self.cell.delegate);
    XCTAssertNotNil(self.cell.delegate, @"A cell should have a delegate.");
}

/**
 *  Gesture Recognizer Tests
 */

@end