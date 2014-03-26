//
//  JBSwipeableCollectionViewCell.m
//  JBSwipeableCollectionViewCell
//
//  Created by Jabari Bell on 3/26/14.
//  Copyright (c) 2014 Jabari Bell. All rights reserved.
//

#import "JBSwipeableCollectionViewCell.h"

@interface JBSwipeableCollectionViewCell ()

@property (nonatomic, strong, readwrite) UIView *bottomView;
@property (nonatomic, strong, readwrite) UIScrollView *scrollView;

@end

@implementation JBSwipeableCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isSwipeable = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    self.swipeDirection = JBSwipeDirectionRightToLeft;
    //i'm not sure what we want the bottom view's frame to be exactly.... i'm thinking the content view's makes sense
    self.bottomView.frame = self.contentView.bounds;
    self.scrollView.frame = self.contentView.bounds;
}

#pragma mark - Lazy Loaders

- (UIView *)bottomView
{
    if (_bottomView) { return _bottomView; }
    
    _bottomView = [[UIView alloc] init];
    [self.scrollView addSubview:_bottomView];
    return _bottomView;
}

- (UIScrollView *)scrollView
{
    if (_scrollView) { return _scrollView; }
    
    _scrollView = [[UIScrollView alloc] init];
    [self.contentView addSubview:_scrollView];
    return _scrollView;
}

@end
