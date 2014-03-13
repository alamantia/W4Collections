//
//  W4SampleViewController.m
//  W4Collections
//
//  Created by waffles on 3/13/14.
//  Copyright (c) 2014 w4ffles. All rights reserved.
//

#import "W4SampleViewController.h"
#import "W4GridLayout.h"
#import "W4GridTypes.h"

@interface W4SampleViewController () {
    UICollectionView *collectionView;
    W4GridLayout *collectionViewLayout;
}

@end

@implementation W4SampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void) setupCollectionView
{
    collectionViewLayout = [[W4GridLayout alloc] init];
    collectionViewLayout.sectionInset            = UIEdgeInsetsMake(0, 0, 0, 0);
    collectionViewLayout.minimumLineSpacing      = 0.0;
    collectionViewLayout.minimumInteritemSpacing = 0.0;
    collectionViewLayout.currentLayout           = 0;

    W4LayoutTemplate *layout = [[W4LayoutTemplate alloc] init];
    [layout.layoutObjects addObject:
     [[W4LayoutObject alloc] initWithSize: CGSizeMake( (float) 1/2 , (float)  1/2)
                               andPosition: CGPointMake((float)   0,  (float)  0)
                               andCellType:0]];
    
    [layout.layoutObjects addObject:
     [[W4LayoutObject alloc] initWithSize: CGSizeMake( (float) 1/2, (float) 1/2)
                               andPosition: CGPointMake((float) 1/2, (float) 0)
                               andCellType:0]];
     [collectionViewLayout.layouts addObject:layout];
    
    [layout.layoutObjects addObject:
     [[W4LayoutObject alloc] initWithSize: CGSizeMake( (float) 1, (float) 1/2)
                              andPosition: CGPointMake((float) 0, (float) 1/2)
                              andCellType:0]];
    [collectionViewLayout.layouts addObject:layout];

    
    
    collectionView = [[UICollectionView alloc] initWithFrame:
                                        CGRectMake(self.view.bounds.origin.x,self.view.bounds.origin.y,self.view.bounds.size.width - (collectionViewLayout.cellMargin/2),self.view.bounds.size.height-(collectionViewLayout.cellMargin/2))
                                        collectionViewLayout:collectionViewLayout];
    collectionView.pagingEnabled  = NO;
    collectionView.scrollEnabled  = NO;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.view addSubview:collectionView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [collectionViewLayout maxCellsForLayout];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)_collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    int cellType = [collectionViewLayout cellTypeForIndexPath:indexPath];
    switch (cellType) {
        default: {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
            CGFloat hue          = ( arc4random() % 256 / 256.0 );
            CGFloat saturation   = ( arc4random() % 128 / 256.0 ) + 0.5;
            CGFloat brightness   = ( arc4random() % 128 / 256.0 ) + 0.5;
            
            cell.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        }
    }
    return cell;
}

@end
