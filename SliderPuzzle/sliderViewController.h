//
//  ViewController.h
//  SliderPuzzle
//
//  Created by Shane Germann on 5/7/13.
//  Copyright (c) 2013 Shane Germann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Puzzle.h"
#import "Tile.h"

@interface sliderViewController : UICollectionViewController

@property (weak, nonatomic) NSMutableArray* tiles;

@property (strong, nonatomic) Puzzle* puzzle;

@end
