//
//  CSSSelector.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//
/**
 This class represents a CSS selector and all of it's components. It represents an entire selector but usually only the last
 part or "slug" is used. For example, in "ul ul li div.red#sam" the "div.red#sam" would be used the most. Why? The CSSSelectorTree
 
 is the one who handles descendants.*/
#import <Foundation/Foundation.h>


@interface CSSSelector : NSObject {
    NSString *selector;
    NSString *cssID;
    
    // css class name (like div, ul, li, etc)
    NSString *className;
    // custom classes we defined (.ourclass,.customclass, ect)
    NSArray *classes;
}
- (id)initWithSelectorStr:(NSString*)selector;
/** Returns the components of the the selector (including the slug).
 * The components which are separated by spaces (mainly descendant selectors).
 */
- (NSArray*)selectorComponents;
/** Checks to see if we partially match the specified selector.*/
- (BOOL)doesMatch:(CSSSelector*)selector;

/** The classes which are applied to use.*/
@property (nonatomic, readonly) NSArray *classes;
@property (nonatomic, readonly) NSString *cssID;
@property (nonatomic, readonly) NSString *className;
@property (nonatomic, readonly) NSString *selector;
//@property (nonatomic, readonly) NSString *
@property (readonly) NSInteger score;
@end
