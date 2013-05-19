//
//  Tile.h
//  Puzzle
//
//  Created by debugx on 5/7/13.
//  Copyright (c) 2013 Junior. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tile : NSObject

@property NSInteger position;
@property NSInteger currentX;
@property NSInteger currentY;
@property NSInteger correctX;
@property NSInteger correctY;
@property (strong, nonatomic) UIImageView* tileImage;
@end
