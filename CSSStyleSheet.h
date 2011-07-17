//
//  CSSStyleSheet.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//
/**
 Represents css style sheet which has been parsed and loaded into our custom format.

 Each rule is represented backwards. For example you might have div.red#hello which would turn into
 #hello -> .red -> div
 
 Most specific to least specific. This setup allows us to ensure the correct properties take precendence.
 
 Thus, each entry (like #hello) has is a dictionary with a a few built in keys. We always have:
 1. score
 2. All (is a default ruleset in case we don't have any parent selectors). For example, #hello would have an "All" key.
 All is usually an instance of CSSRuleset since it's a toplevel namespace.
 3. any other selectors that are up a level. (for example, we'd have .red)
 
 This structure continues all the way up the tree.
 */
#import <Foundation/Foundation.h>


@class CSSParser;
@class CSSSelector;
@interface CSSStyleSheet : NSObject {
    // main css style tree. Custom format.
    NSMutableDictionary *mainTree;
    
    CSSParser *parser;
}
- (NSDictionary*)lookup:(CSSSelector*)selector;

- (void)loadFromURL:(NSURL*)url;
- (void)loadFromString:(NSString*)css_code;

+ (CSSStyleSheet*)styleSheetFromURL:(NSURL*)url;
+ (CSSStyleSheet*)styleSheetFromString:(NSString*)css_code;
@end
