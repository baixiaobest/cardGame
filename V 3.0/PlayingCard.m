//
//  PlayingCard.m
//  cardGame
//
//  Created by Baixiao Huang on 9/22/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray*) validSuits
{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+ (NSArray*) rankString
{
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K",];
}

+ (NSInteger) maxRank
{
    return [[PlayingCard rankString] count] - 1;
}

- (NSString*) contents
{
    NSArray* rankString = [PlayingCard rankString];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}

- (NSString*) suit
{
    return _suit ? _suit : @"?";
}

- (void) setSuit:(NSString*) suit
{
    if([ [PlayingCard validSuits] containsObject: suit])
    {
        _suit = suit;
    }
}

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    if([otherCards count]==1)
    {
        PlayingCard* otherCard = [otherCards firstObject];
        if([self.suit isEqualToString:otherCard.suit])
        {
            score = 1;
        }else if(self.rank == otherCard.rank)
        {
            score = 4;
        }
    }
    return score;
}

@end