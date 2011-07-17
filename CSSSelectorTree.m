//
//  CSSSelectorTree.m
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//
/**
 @class CSSSelectorTree 
 This custom data structure represents our css tree we inflate after parsing. In fact, it's not really a tree but more of a list of matching "paths".
 
 An example will hopefully clarify this:
 */
#import "CSSSelectorTree.h"
#import "CSSSelector.h"


@implementation CSSSelectorTree
@dynamic score;
@synthesize nodes;
@synthesize rules;

#pragma mark Accessors
/** Takes the biggest child score to ensure we reflect the child nodes accurately.
 Note: this may not be quite right. How do we know we "own" the biggest node?*/
- (NSInteger)score {
    NSInteger max_score = 0;
    for (CSSSelectorTree *node in nodes) {
        NSInteger score = [node score];
        max_score = (score > max_score ? score : max_score);
    }
    return max_score;
}
@end
