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

- (id)initWithSelectorStr:(NSString*)selector_arg {
    self = [super init];
    if (self) {
        selector = [selector_arg retain];
    }
    return self;
}


#pragma mark Accessors
- (void)sortNodes {
    [nodes sortUsingComparator:(NSComparator)^(CSSSelector *a_sel, CSSSelector *b_sel) {
        NSInteger a_score = [a_sel score];
        NSInteger b_score = [b_sel score];
        
        if (a_score < b_score)
            return NSOrderedAscending;
        else if(a_score > b_score)
            return NSOrderedDescending;
        else
            return NSOrderedSame;
    }];
}
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
- (NSMutableArray*)nodes {
    
    if (!nodes) {
        nodes = [[NSMutableDictionary dictionaryWithCapacity:20] retain];
    }
    return nodes;
}

- (void)dealloc {
    [nodes release], nodes = nil;
    [super dealloc];
}
@end
