//
//  W4GridTypes.h
//  W4Collections
//
//  Created by waffles on 3/12/14.
//  Copyright (c) 2014 w4ffles. All rights reserved.
//

#import <Foundation/Foundation.h>

enum CELL_TYPES {
    CELL_TYPE_LARGE,
    CELL_TYPE_MEDIUM,
    CELL_TYPE_SMALL,
};

@interface W4LayoutTemplate : NSObject {
}
@property (nonatomic, assign) BOOL cycle;
@property (nonatomic, strong) NSMutableArray *layoutObjects;
@end

@interface W4LayoutObject : NSObject {
}
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) CGSize    size;
@property (nonatomic, assign) CGPoint   position;
- (id) initWithSize : (CGSize) __size andPosition:(CGPoint) __position andCellType: (NSInteger) type;
@end
