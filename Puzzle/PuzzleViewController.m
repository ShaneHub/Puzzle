//
//  ViewController.m
//  Puzzle
//
//  Created by debugx on 5/7/13.
//  Copyright (c) 2013 Junior. All rights reserved.
//

#import "PuzzleViewController.h"

@interface PuzzleViewController ()

@end

@implementation PuzzleViewController

- (void)viewDidLoad {
    
    NSLog(@"view loaded");
    self.puzzle = [[Puzzle alloc]init];
    
}

#pragma mark - Collection View Delegate

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    NSIndexPath *emptyPath = [[NSIndexPath alloc]initWithIndex:[self.puzzle.matrix indexOfObject:self.puzzle.empty]];
    UICollectionViewCell *cell2 = [collectionView cellForItemAtIndexPath:emptyPath];
    cell.alpha = 0.75;
    
    if ([self.puzzle moveTile:indexPath.row]) {
        cell.backgroundView = [self.puzzle tileAtIndex: indexPath.row].tileImage;
        cell2.backgroundView = [self.puzzle tileAtIndex: emptyPath.row].tileImage;
    }
}





#pragma mark - Collection View Data Source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //cell.imageView.image = [self.animalList thumbnailImageForIndex: indexPath.row];
    cell.backgroundView = [self.puzzle tileAtIndex: indexPath.row].tileImage;
    
    NSLog(@"tried to set cell %@", cell.backgroundView);
    
    return cell;
}

#pragma mark - Collection View Flow Layout Delagate


- (CGSize)collectionView: (UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(80, 80);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}


@end

