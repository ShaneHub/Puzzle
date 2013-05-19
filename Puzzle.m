//
//  Board.m
//  Puzzle
//
//  Created by debugx on 5/7/13.
//  Copyright (c) 2013 Junior. All rights reserved.
//
//{ Tile *arrayTile[4][4];}

#import "Puzzle.h"
#import "Tile.h"
#include <stdlib.h>

@implementation Puzzle



-(id) init {
    self = [super init];

    NSLog(@"initialized puzzle");
    _matrix = [NSMutableArray new];
    [self initMatrix];
    for (int i = 0; i < 16; i++) {
        NSString *imageName = [NSString stringWithFormat:@"tile%i.jpg", i+1];
        Tile *newTile = [[Tile alloc]init];
        newTile.tileImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        [self.matrix insertObject:newTile atIndex:i];
        NSLog(@"created image %@", newTile.tileImage);
    }
    do{
        [self randomize];
    }while(![self verifyParity]);
    //I STOPPED HERE...
    return self;
}
-(void) initMatrix{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            Tile *t = [Tile new];
            t.currentX = i; t.currentY = j; t.position = (i*4) + j;
            [_matrix addObject: t];
        }
    }
    [self setEmpty: [_matrix objectAtIndex:15]];
}

-(void) randomize{
    [self sortMatrix];
    int remainingElements = [_matrix count];
    int num;
    
     while (remainingElements > 0){
         num = arc4random() % 16;
         Tile *tmp = [_matrix objectAtIndex:num];
         [_matrix replaceObjectAtIndex:num  withObject:[_matrix objectAtIndex:remainingElements-1]];
         [_matrix replaceObjectAtIndex:remainingElements-1 withObject: tmp];
         
         if ([[_matrix objectAtIndex:remainingElements-1] position] == 0) {
             [self setEmpty: [_matrix objectAtIndex:remainingElements-1]];
         }
         remainingElements--;
     }
}

-(void)sortMatrix{
    int j;
    for (j = 1; j < [_matrix count]; j++){
        int key = [[_matrix objectAtIndex:j] position];
        int i = j-1;
        while (i >= 0 && [[_matrix objectAtIndex:i] position] > key){
           [_matrix replaceObjectAtIndex:i+1 withObject:[_matrix objectAtIndex:i]];
            i--;
        }
        [[_matrix objectAtIndex:i+1] setPosition:key];
    }
}
-(BOOL) verifyParity{
    int i, j;
    BOOL ret = true;
    
    for (i = 0; i <[_matrix count] - 1; i++){
        for (j = i+1; j < [_matrix count] ; j++){
            if ([[_matrix objectAtIndex:i] position] > [[_matrix objectAtIndex:j] position]){
                ret = !ret;
            }
        }
    }
    return ret;
}

-(BOOL) isEmpty: (NSInteger) position{
    return ([[self empty] position] == position);
}
-(Tile*)getTileAtPosition: (NSInteger) position{
    return ([_matrix objectAtIndex:position]);
}

-( NSInteger)getPositionOfTile: (Tile*) tile;{
    return ([tile position]);
}

-(BOOL)validMove: (NSInteger) position{
    if ((abs(position - [_empty position]) ==1) || (abs(position - [_empty position]) ==4)){
          return TRUE;
    }
    return  FALSE;
}
                                                    
-( BOOL)moveTile: (NSInteger) position{
    if ([self validMove:position]){
        Tile *tmp = [_matrix objectAtIndex:position];
         [_matrix replaceObjectAtIndex:position  withObject:[self empty]];
         [_matrix replaceObjectAtIndex:[_empty position] withObject: tmp];
        return TRUE;
    }
    return  FALSE;
}

-(BOOL) gameOver{
    if([[self empty] position] == 15)
    {
        for(int i = 0; i < 15;  i++){
            if ([[_matrix objectAtIndex:i] position] != i )
            {
                return  FALSE;
            }
        }
        return TRUE;
    }
     return  FALSE;
}

- (Tile*) tileAtIndex: (NSInteger)index {
    id tile = [self.matrix objectAtIndex:index];
    NSLog(@"returned tile at %@", [tile tileImage]);
    return [self.matrix objectAtIndex:index];
}

@end















