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

#pragma mark Actual application methods
- (void)applyAll:(CSSStyleSheet *)sheet {
    
}

- (void)apply:(CSSSelectorTree *)treeNode {
    
    
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (CSSSelectorTree *node in treeNode.nodes)
    {
        BOOL matches = NO;
        if ([node.selector isMatching:self.CSSSelector])
        {
           
            matches = YES;
        }
    }
    
    [self computeIntoMutipleDictionary:dict withNode:node];

}




#pragma mark Searching though the "DOM"
/** Searches through the "DOM" for a specific set of subviews specified
 by the selector.*/
- (NSArray*)find:(NSString *)selector {
    return nil;
}
- (NSArray*)findAll:(NSString *)selector {
    return nil;
}

-(id) CSSParent{
	return [self superview];
}
@end
