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
 
 The tree is maintained via the {@link CSSSelectorTree} data structure.
 
 <b>Searching</b>
 ---------
 When we search, we do a special type of fuzzy compare. Remember that a css selector can match just a few of the css classes you conform to.
 For example, a selector could be red.green and you have the classes "red", "green", and "blue" so the original selector would still match you.
 
 .red#hello -> ul
 
 The actual "apply" method on the UIView does the comparison but CSSSelectors know how to compare to each other.
 */
#import <Foundation/Foundation.h>
#import "CSSParser.h"
#import "CSSSelector.h"
#import "CSSSelectorTree.h"

@interface CSSStyleSheet : NSObject {
    
    CSSParser *parser;
    
    CSSSelectorTree *_root;
}

- (void)loadFromURL:(NSURL*)url;
- (void)loadFromString:(NSString*)css_code;


//convenience methods
+ (CSSStyleSheet*)styleSheetFromURL:(NSURL*)url;
+ (CSSStyleSheet*)styleSheetFromString:(NSString*)css_code;

@property (nonatomic, readonly) CSSSelectorTree *root;
@end
