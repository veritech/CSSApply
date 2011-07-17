//
//  CSSSelector.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//
/**
 This class represents a css selector. Each selector is a bit like a uri with the ending element called
 a "slug". For example, in the css selector "ul.red#hello" "#hello" would be the slug.
 
 You can get the entire selector by calling "description" on this.
 
 This is a simple wrapper class which allows us to manage selectors.*/
#import <Foundation/Foundation.h>


@interface CSSSelector : NSObject {
    // the ending component
    NSString *slug;
    // the main selector (without slug)
    NSString *main;
}
- (id)initWithSelector:(NSString*)selector;

/** Returns the components of the the selector (including the slug).
 The components which are separated by spaces (mainly descendant selectors).
 */
- (NSArray*)selectorComponents;

//not the best idea to update these directly.
@property (nonatomic, retain) NSString *main;
@property (nonatomic, retain) NSString *slug; 
@property (readonly) NSinteger score;
@end
