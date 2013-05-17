//
//  Board.h
//  Puzzle
//
//  Created by debugx on 5/7/13.
//  Copyright (c) 2013 Junior. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"

@interface Board : NSObject

@property (nonatomic, strong) NSMutableArray *matrix;
@property (nonatomic, strong) Tile *empty;


-(void) initBoard;
-(void) initMatrix;
-(void) randomize;
-(void) sortMatrix;
-(BOOL) verifyParity;
-(BOOL) isEmpty: (NSInteger) position;
-(Tile*)getTileAtPosition: (NSInteger) position;
-( NSInteger)getPositionOfTile: (Tile*) tile;


////continue here..
-(BOOL)validMove: (NSInteger) position;
-( BOOL)moveTile: (NSInteger) position;
-(BOOL) gameOver;


@end
