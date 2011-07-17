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
    
    for (CSSSelectorTree *node in treeNode.nodes)
    {
        //does the lowest level match me?
        
        if ([node.selector doesMatchIntoSelector:self.CSSSelector])
        {
            if (node.rules)
            {
                [dict addEntriesFromDictionary:node.rules];
            }
            
            if (node.nodes)
            {
                for (CSSSelectorTree *subnodes in self.nodes)
                {
                    //[self applyStylesToChildren:node withInheirtedStyleDict:mdict];
                }
                
            }
            
        }
    }
    
    
    //direct matches
    
    
    
    //[self computeIntoMutipleDictionary:dict withNode:node];
    
}



#pragma mark Actual application methods
- (void)apply:(CSSStyleSheet *)sheet {
    [self applyStylesToChildren:sheet.root withInheirtedStyleDict:[NSDictionary dictionary]];
    
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
