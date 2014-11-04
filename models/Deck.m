//
//  Deck.m
//  cardGame
//
//  Created by Baixiao Huang on 9/22/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray * cards;

@end

@implementation Deck

- (NSMutableArray *) cards
{
    if(_cards==nil)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void) addCard:(Card*) card atTop:(BOOL) atTop
{
    if(atTop)
    {
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

- (void) addCard:(Card*) card
{
    [self addCard: card atTop:NO];
}

- (Card*) drawRandomCard
{
    Card* randomCard;
    
    if (self.cards.count != 0) {
        int randomIndex = arc4random() % self.cards.count;
        randomCard = self.cards[randomIndex];
        [self.cards removeObjectAtIndex:randomIndex];
    }
    return randomCard;
}

@end