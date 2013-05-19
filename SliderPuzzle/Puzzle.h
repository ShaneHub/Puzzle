//
//  Puzzle.h
//  SliderPuzzle
//
//  Created by Shane Germann on 5/7/13.
//  Copyright (c) 2013 Shane Germann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"


@interface Puzzle : NSObject

@property (strong, nonatomic) NSMutableArray *tilesArray;



- (Tile*) tileAtIndex: (NSInteger)index;
- (void) moveTile: id;
- (BOOL) gameIsOver;
- (NSMutableArray*) randomlyAssignTiles;
- (BOOL) hasParity;



@end
