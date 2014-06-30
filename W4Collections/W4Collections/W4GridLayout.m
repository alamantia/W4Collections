//
//  W4GridLayout.m
//  W4Collections
//
//  Created by waffles on 3/12/14.
//  Copyright (c) 2014 w4ffles. All rights reserved.
//

#import "W4GridLayout.h"
#import "W4GridTypes.h"


@implementation W4GridLayout

- (id)init {
    self = [super init];
    if (self) {
        self.layouts = [[NSMutableArray alloc] init];
        self.currentLayout = 0;
        self.cellMargin    = 12.0;
    }
    return self;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray* attributesToReturn = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes* attributes in attributesToReturn) {
        if (nil == attributes.representedElementKind) {
            NSIndexPath* indexPath = attributes.indexPath;
            attributes.frame = [self layoutAttributesForItemAtIndexPath:indexPath].frame;
        }
    }
    return attributesToReturn;
}

- (NSInteger) maxCellsForLayout {
    W4LayoutTemplate *template = [self.layouts objectAtIndex:self.currentLayout];
    return [[template layoutObjects] count];
}

- (CGSize)collectionViewContentSize {
    return self.collectionView.frame.size;
}

- (void)prepareLayout {
    [super prepareLayout];
}

/* adjust to take pages into account for scrolling .. */

- (UICollectionViewLayoutAttributes *) layoutUsingTemplateAtIndexPath : (NSIndexPath *)indexPath {
    W4LayoutTemplate *template = [self.layouts objectAtIndex:self.currentLayout];
    W4LayoutObject   *lo       = [template.layoutObjects objectAtIndex:indexPath.row];
    UICollectionViewLayoutAttributes* currentItemAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    if (!currentItemAttributes) {
        currentItemAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    }
    float height = self.collectionView.frame.size.height;
    float width  = self.collectionView.frame.size.width;
    CGRect frame = CGRectZero;
    
    frame.size   = CGSizeMake( (width * lo.size.width)  - (self.cellMargin/2),
                              (height * lo.size.height) - (self.cellMargin/2));
    
    frame.origin = CGPointMake((lo.position.x * width)  + (self.cellMargin/2),
                               (lo.position.y * height) + (self.cellMargin/2));
    
    currentItemAttributes.frame = frame;
    currentItemAttributes.size  = frame.size;
    return currentItemAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self layoutUsingTemplateAtIndexPath:indexPath];
}

- (NSInteger) cellTypeForIndexPath : (NSIndexPath *) indexPath {
    W4LayoutTemplate *template = [self.layouts objectAtIndex:self.currentLayout];
    W4LayoutObject   *lo       = [template.layoutObjects objectAtIndex:indexPath.row];
    return  lo.type;
}

@end
