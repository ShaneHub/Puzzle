//
//  Tile.h
//  SliderPuzzle
//
//  Created by Shane Germann on 5/7/13.
//  Copyright (c) 2013 Shane Germann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tile : NSObject

@property (nonatomic) NSInteger correctX;
@property (nonatomic) NSInteger correctY;

@property (nonatomic) NSInteger x;
@property (nonatomic) NSInteger y;

@property (strong, nonatomic) UIImageView* tileImage;

@property (nonatomic) BOOL isBlank;

@end
