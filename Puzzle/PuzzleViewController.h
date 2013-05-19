//
//  ViewController.h
//  Puzzle
//
//  Created by debugx on 5/7/13.
//  Copyright (c) 2013 Junior. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Puzzle.h"

@interface PuzzleViewController : UICollectionViewController

@property (weak, nonatomic) NSMutableArray* tiles;

@property (strong, nonatomic) Puzzle* puzzle;


@end
