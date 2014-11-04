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

@property (nonatomic, readwrite) NSInteger score;
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
    self.threeCardsMode = NO;
    return self;
}

const int MISMATCH_PANELTY = 2;
const int MATCH_BONUS = 2;
const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card* card = [self cardAtIndex:index];
    self.message = [@"Select " stringByAppendingString:card.contents];
    if(!card.isMatched)
    {
        if(card.isChosen){
            self.message = [@"Deselect: " stringByAppendingString:card.contents];
            card.chosen = NO;
        }else{
            NSMutableArray* matches = [[NSMutableArray alloc] init];
            for(Card* otherCard in self.cards)
            {
                if(otherCard.isChosen && !otherCard.isMatched)
                {
                    [matches addObject:otherCard];
                    if((!self.threeCardsMode&&[matches count]==1)
                       || (self.threeCardsMode&&[matches count] ==2))
                        break;
                }
            }
            int matchScore = [card match:matches];
            if((!self.threeCardsMode&&[matches count]==1)
            || (self.threeCardsMode&&[matches count]==2))
            {
                if (matchScore) {
                    self.message = [@"Matching " stringByAppendingString:card.contents];
                    int modeBonus = (self.threeCardsMode)?2:1;
                    int score = matchScore*MATCH_BONUS*modeBonus;
                    self.score += score;
                    card.matched = YES;
                    for(Card* everyCard in matches)
                    {
                        everyCard.matched = YES;
                        self.message = [self.message stringByAppendingString:everyCard.contents];
                    }
                    self.message = [self.message stringByAppendingString:[NSString stringWithFormat:@" with %d points",score]];
                }else{
                    self.message = [@"No match " stringByAppendingString:card.contents];
                    self.score -= MISMATCH_PANELTY;
                    for(Card* everyCard in matches)
                    {
                        everyCard.chosen = NO;
                        self.message = [self.message stringByAppendingString:everyCard.contents];
                    }
                    self.message = [self.message stringByAppendingString:[NSString stringWithFormat:@" with %d panelty",MISMATCH_PANELTY]];
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

- (NSString*) message
{
    if(!_message) _message = @"";
    return _message;
}

@end