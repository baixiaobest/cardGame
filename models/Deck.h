//
//  Deck.h
//  cardGame
//
//  Created by Baixiao Huang on 9/22/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#ifndef cardGame_Deck_h
#define cardGame_Deck_h


#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void) addCard:(Card*) card
           atTop:(BOOL)atTop;

- (void) addCard:(Card*) card;

- (Card*) drawRandomCard;
@end


#endif
