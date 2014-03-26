//
//  JBSwipeableCollectionViewCell.h
//  JBSwipeableCollectionViewCell
//
//  Created by Jabari Bell on 3/26/14.
//  Copyright (c) 2014 Jabari Bell. All rights reserved.
//


@class JBSwipeableCollectionViewCell;

@protocol JBSwipeableCollectionViewCellDelegate <NSObject>


@end

/**
 *  Allows the direction of the swipe to be set.
 */
typedef NS_ENUM(NSInteger, JBSwipeDirection){
    /**
     *  Allows a swipe from the top of the cell to the bottom. (not yet implemented)
     */
    JBSwipeDirectionBottomToTop    = (1 << 0),
    /**
     *  Allows a swipe from the bottom of the cell to the top. (not yet implemented)
     */
    JBSwipeDirectionTopToBottom    = (1 << 1),
    /**
     *  Allows a swipe from the left of the cell to the right.
     */
    JBSwipeDirectionLeftToRight    = (1 << 2),
    /**
     *  Allows a swipe from the right of the cell to the left.
     */
    JBSwipeDirectionRightToLeft    = (1 << 3)
};

#import <UIKit/UIKit.h>

@interface JBSwipeableCollectionViewCell : UICollectionViewCell

/**
 *  Determines if cell can be swiped or not.
 */
@property (nonatomic, assign) BOOL isSwipeable;

/**
 *  The direction that the cell can be swiped in.
 */
@property (nonatomic, assign) JBSwipeDirection swipeDirection;

/**
 *  The view that is to be hidden by the scrollView on top. Views should be added to it.
 */
@property (nonatomic, strong, readonly) UIView *bottomView;

/**
 *  The scrollView that holds the cell's content and sits above the bottomView;
 */
@property (nonatomic, strong, readonly) UIScrollView *scrollView;

/**
 *  Cell's delegate. It handles...
 */
@property (nonatomic, weak, readwrite) id <JBSwipeableCollectionViewCellDelegate> delegate;

@end
