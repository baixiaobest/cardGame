//
//  PlayingCardDeck.m
//  cardGame
//
//  Created by Baixiao Huang on 9/22/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id) init
{
    self = [super init];
    if(self!=nil)
    {
        for(NSString* suit in [PlayingCard validSuits])
        {
            for(NSInteger rank=1; rank < [PlayingCard rankString].count; rank++)
            {
                PlayingCard* card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end