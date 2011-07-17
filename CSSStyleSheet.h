//
//  CSSStyleSheet.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//
/**
 Represents css style sheet which has been parsed and loaded into our custom format.

 Each rule is represented backwards and we only split on descendants (not on class). For example you might have ul div.red#hello which would turn into 
 div.red#hello -> ul
 
 Most specific to least specific. This setup allows us to ensure the correct properties take precendence and generally makes everything simpler.
 
 Thus, each entry (like #hello) has is a dictionary with a a few built in keys. We always have:
 1. score
 2. All (is a default ruleset in case we don't have any parent selectors). For example, #hello would have an "All" key.
 "All" is usually a ruleset which is "the most generic" or a base class.
 3. Any other selectors that are up a level. (for example, we'd have .red)
 
 This structure continues all the way up the tree.
 
 <b>Searching</b>
 ---------
 When we search, we do a special type of fuzzy compare. Remember that a css selector can match just a few of the css classes you conform to.
 For example, a selector could be red.green and you have the classes "red", "green", and "blue" so the original selector would still match you.
 
 .red#hello -> ul
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
