//
//  UIVIew+CSS.m
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.

#import "UIView+CSS.h"
#import "NSObject+CSS.h"

@implementation UIView (CSS)


- (void)computeIntoMutableDictionary:(NSMutableDictionary *)dict withNode:(CSSSelectorTree *)node
{
    
}

- (void)applyStylesToChildren:(CSSSelectorTree *)treeNode withInheirtedStyleDict:(NSDictionary *)mdict {
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:mdict];
    
    for (CSSSelectorTree *node in treeNode.nodes) {
        //first level is always most specific, do we match?
        if ([node.selector doesMatchIntoSelector:self.CSSSelector]) {
            
            if (node.rules) {
                [dict addEntriesFromDictionary:node.rules];
            }
            if (node.nodes) {
                // we need to check if we match all the way up the tree
                // we always go all the way to the root bc we do descendant matching not just child matching but descendant
                UIView *parent = [self CSSParent];
                BOOL doesMatch = NO;
                //move through nodes as we move up
                NSEnumerator *node_iter = [node.nodes objectEnumerator];
                CSSSelectorTree *subtree = [node_iter nextObject];
                
                while (parent && !doesMatch) {
                    CSSSelectorTree *subtree = [node_iter nextObject];
                    // still have nodes left
                    if (subtree) {
                        
                    }
                }
                
                
            } else {
                // apply the actual styles
            }
            
        }
    }
    
    //[self computeIntoMutipleDictionary:dict withNode:node];
    
}



#pragma mark Actual application methods
- (void)apply:(CSSStyleSheet *)sheet {
    // start at root..
    [self applyStylesToChildren:sheet.root withInheirtedStyleDict:[NSDictionary dictionary]];
    
}




#pragma mark Searching though the "DOM"
/** Searches through the "DOM" for a specific set of subviews specified
 by the selector.*/
- (NSArray*)find:(CSSSelector*)selector {
    return nil;
}
- (NSArray*)findAll:(CSSSelector*)selector {
    return nil;
}

-(id) CSSParent{
	return [self superview];
}
@end
