//
//  Card.m
//  cardGame
//
//  Created by Baixiao Huang on 9/22/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Card()

@end

@implementation Card

- (int) match:(NSArray*) otherCards
{
    int score = 0;
    
    for(Card* card in otherCards)
    {
        if([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    
    return score;
}

- (NSString*) contents
{
    if(!_contents) _contents = @"";
    return _contents;
}

@end