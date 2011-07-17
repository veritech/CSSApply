//
//  CSSSelectorTree.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//
// sam red.green#hello
// red -> .green
//        #hello
// 
// stewart sam red.green#hello
// stew mark red.green#hello
// red.green#hello -> sam -> stewart
//                 -> sam.mark -> stew
// red.green#hello -> lisa -> stewart
// red.green#hello -> sam
// red.green#hello -> sam
// 

// red green blue 

/** 
 @class CSSSelectorTree
 This is a custom data structure which manages a css selector tree. It allows you to lookup views in the tree
 according to their selectors. Each level is caused by a space in a css selector (which represents a descendant relationship)
 at each level we have a CSSSelector which contains a variety of properties (like classes, id, tag type) and a list of child
 nodes.

 We also track our score for the current level (precendence) and a special subnode called "All" which represents the "base" ruleset
 for the current subnode.
 */
#import <Foundation/Foundation.h>
#import "CSSSelector.h"

@interface CSSSelectorTree : NSObject {
    //array of CSSSelectorTrees
    NSMutableArray *nodes;
    
    NSDictionary *rules;
    CSSSelector *selector;
}

@property (readonly, nonatomic) NSString *name;
@property (readonly, nonatomic) CSSSelector *selector;
@property (retain, nonatomic) NSDictionary *rules;
// array of CSSSelectoreTree subnodes
@property (readonly, nonatomic) NSMutableArray *nodes;
@property (readonly, nonatomic) NSInteger score;

- (void)sortNodes;

- (id)initWithSelector:(CSSSelector*)selector;

- (NSArray*)find:(CSSSelector*)selector_arg;

- (BOOL)isLeaf;
/** Utility method to wrap a list of CSS Selectors after parsing and breaking
 up this large multi level selector.
 Returns an array in reverse order of specificity.*/
+ (NSArray*)subtreesFromSelector:(NSString*)selector;

/** Links array of CSSTreeSelectors together by each other (like linked list).
 It's expected that they are sorted from most specific to least specific.
 Returns the root node of the new "subtree".*/
+ (CSSSelectorTree*)chainSubtrees:(NSArray*)subtrees;
@end
