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
            t.position = (i*4) + j;
            NSString *imageName = [NSString stringWithFormat:@"tile%i.jpg", t.position +1];
            t.tileImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
            NSLog(@"set image %i", t.position);
            [_matrix insertObject:t atIndex:t.position];
            
        }
    }
    [self setEmpty: [_matrix objectAtIndex:15]];
}

-(void) randomize{
    //[self sortMatrix];
    int remainingElements = [_matrix count];
    int num;
    
     while (remainingElements > 0){
         num = arc4random() % 16;
         Tile *tmp = [_matrix objectAtIndex:num];
         [_matrix replaceObjectAtIndex:num  withObject:[_matrix objectAtIndex:remainingElements-1]];
         [_matrix replaceObjectAtIndex:remainingElements-1 withObject: tmp];
         
         /*if ([[_matrix objectAtIndex:remainingElements-1] position] == 0) {
             [self setEmpty: [_matrix objectAtIndex:remainingElements-1]];
         }*/
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
    if ((abs(position - [self.matrix indexOfObject:self.empty]) ==1) || (abs(position - [self.matrix indexOfObject:self.empty]) ==4)){
          return YES;
    }
    return  NO;
}
                                                    
-( BOOL)moveTile: (NSInteger) position{
    if ([self validMove:position]){
        NSLog(@"tried to move tile %i", position);
        
        NSInteger position2 = [self.matrix indexOfObject:self.empty];
        [self.matrix exchangeObjectAtIndex:position withObjectAtIndex:position2];

        return YES;
    }
    return  NO;
}

-(BOOL) gameOver{
    if([[self empty] position] == 15)
    {
        for(int i = 0; i < 15;  i++){
            if ([[_matrix objectAtIndex:i] position] != i )
            {
                return  NO;
            }
        }
        return YES;
    }
     return  NO;
}

- (Tile*) tileAtIndex: (NSInteger)index {
    id tile = [self.matrix objectAtIndex:index];
    NSLog(@"returned tile at %@", [tile tileImage]);
    return [self.matrix objectAtIndex:index];
}

@end















