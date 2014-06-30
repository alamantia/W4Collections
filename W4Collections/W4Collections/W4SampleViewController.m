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
    W4GridLayout *collectionViewLayout;
}
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
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
    collectionViewLayout = (W4GridLayout *)self.collectionView.collectionViewLayout;
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
    
    self.collectionView.pagingEnabled  = NO;
    self.collectionView.scrollEnabled  = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.collectionView setCollectionViewLayout:collectionViewLayout];
    [self.collectionView.collectionViewLayout invalidateLayout];
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

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selection");
    return;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)_collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    int cellType = (int)[collectionViewLayout cellTypeForIndexPath:indexPath];
    switch (cellType) {
        default: {
            cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
            CGFloat hue          = ( arc4random() % 256 / 256.0 );
            CGFloat saturation   = ( arc4random() % 128 / 256.0 ) + 0.5;
            CGFloat brightness   = ( arc4random() % 128 / 256.0 ) + 0.5;
            cell.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        }
    }
    return cell;
}

@end
