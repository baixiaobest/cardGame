//
//  CardMatchingGame.h
//  cardGame
//
//  Created by Baixiao Huang on 9/24/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
#import "PlayingCard.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSUInteger) count
                         usingDeck:(Deck*) deck;

- (void) chooseCardAtIndex:(NSUInteger) index;
- (Card*) cardAtIndex:(NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) BOOL threeCardsMode;

@property (nonatomic, strong) NSString* message;

@end
