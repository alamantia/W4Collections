//
//  W4GridTypes.m
//  W4Collections
//
//  Created by waffles on 3/12/14.
//  Copyright (c) 2014 w4ffles. All rights reserved.
//

#import "W4GridTypes.h"

@implementation W4LayoutTemplate

- (id) init {
    self = [super init];
    self.cycle        = YES;
    self.layoutObjects = [[NSMutableArray alloc] init];
    return self;
}
@end

@implementation W4LayoutObject

- (id) initWithSize : (CGSize) __size andPosition:(CGPoint) __position andCellType: (NSInteger) __type {
    self = [super init];
    self.size     = __size;
    self.position = __position;
    self.type     = __type;
    return self;
}

@end
