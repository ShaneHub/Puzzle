//
//  Puzzle.m
//  SliderPuzzle
//
//  Created by Shane Germann on 5/7/13.
//  Copyright (c) 2013 Shane Germann. All rights reserved.
//

#import "Puzzle.h"

@implementation Puzzle

- (id) init {
    self = [super init];
    
    if (self) {
        self.tilesArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < 16; i++) {
            NSString *imageName = [NSString stringWithFormat:@"tile%i.jpg", i+1];
            Tile *newTile = [[Tile alloc]init];
            newTile.tileImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
            [self.tilesArray insertObject:newTile atIndex:i];
            NSLog(@"created image %@", newTile.tileImage);
        }
    }
    return self;
}

- (Tile*) tileAtIndex: (NSInteger)index {
    id tile = [self.tilesArray objectAtIndex:index];
    NSLog(@"returned tile at %@", [tile tileImage]);
    return [self.tilesArray objectAtIndex:index];
}

@end
