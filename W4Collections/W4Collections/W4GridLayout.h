//
//  W4GridLayout.h
//  W4Collections
//
//  Created by waffles on 3/12/14.
//  Copyright (c) 2014 w4ffles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface W4GridLayout : UICollectionViewFlowLayout {
    
}

- (NSInteger) maxCellsForLayout;
- (NSInteger) cellTypeForIndexPath : (NSIndexPath *) indexPath;

@property (nonatomic, retain) NSMutableArray *layouts;
@property (nonatomic, assign) NSInteger       currentLayout;
@property (nonatomic, assign) float           cellMargin;
@end

