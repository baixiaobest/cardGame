//
//  PlayingCard.h
//  cardGame
//
//  Created by Baixiao Huang on 9/22/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#ifndef cardGame_PlayingCard_h
#define cardGame_PlayingCard_h

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString * suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray*) validSuits;
+ (NSArray*) rankString;
+ (NSInteger) maxRank;

@end


#endif
