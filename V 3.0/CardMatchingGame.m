//
//  CardMatchingGame.m
//  cardGame
//
//  Created by Baixiao Huang on 9/24/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of card

@end

@implementation CardMatchingGame

- (NSMutableArray*) cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(id)deck
{
    self = [super init];
    if(self)
    {
        for(int i=0; i<count; i++)
        {
            Card* card = [deck drawRandomCard];
            if(card)
            {
                [self.cards addObject:card];
            }else{
                self=nil;
                break;
            }
        }
    }
    return self;
}

const int MISMATCH_PANELTY = 2;
const int MATCH_BONUS = 4;
const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card* card = [self cardAtIndex:index];
    if(!card.isMatched)
    {
        if(card.isChosen){
            card.chosen = NO;
        }else{
            for(Card* otherCard in self.cards)
            {
                if(otherCard.isChosen && !otherCard.isMatched)
                {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore*MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }else{
                        self.score -= MISMATCH_PANELTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card*) cardAtIndex:(NSUInteger)index
{
    return index < [self.cards count] ? self.cards[index]:nil;
}

@end