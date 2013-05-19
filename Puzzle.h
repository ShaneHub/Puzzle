//
//  Puzzle.h
//  Puzzle
//
//  Created by debugx on 5/7/13.
//  Copyright (c) 2013 Junior. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"

@interface Puzzle : NSObject

@property (nonatomic, strong) NSMutableArray *matrix;
@property (nonatomic, strong) Tile *empty;


-(void) initMatrix;
-(void) randomize;
-(void) sortMatrix;
-(BOOL) verifyParity;
-(BOOL) isEmpty: (NSInteger) position;
-(Tile*)getTileAtPosition: (NSInteger) position;
-( NSInteger)getPositionOfTile: (Tile*) tile;
- (Tile*) tileAtIndex: (NSInteger)index;


////continue here..
-(BOOL)validMove: (NSInteger) position;
-( BOOL)moveTile: (NSInteger) position;
-(BOOL) gameOver;


@end
