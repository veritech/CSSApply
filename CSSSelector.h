//
//  CSSSelector.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//
/**
 This class represents a CSS selector but only the last component or "slug". We discard all the levels (e.g. "ul ul li")
 and just use the ending selector. This allows us to parse more appropriate information such as css class name, css id tag, etc.
 
 */
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

/** Checks to see if we partially/fully match the specified selector.*/
- (BOOL)doesMatch:(CSSSelector*)selector;

/** Convenience method to break long string (with mul sub selectors) into multiple small sub selectors.*/
+ (NSArray*)subSelectorsFromString:(NSString*)main_selector;

/** The classes which are applied to use.*/
@property (nonatomic, readonly) NSArray *classes;
@property (nonatomic, readonly) NSString *cssID;
@property (nonatomic, readonly) NSString *className;
@property (nonatomic, readonly) NSString *selector;
//@property (nonatomic, readonly) NSString *
@property (readonly) NSInteger score;
@end
