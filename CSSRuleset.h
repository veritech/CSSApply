//
//  CSSRuleset.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//
/** This class represents a single CSS ruleset. It allows us to load
 resources and provids a storage container for a given ruleset.
 
 For example, this class represents the rule section of a selector group.
 {
    background-image: url('test.jpg');
    color: #FFFFFF
 }
 
 This class does lazy loading of resources so it only loads when you call getRuleValue. If it doesn't have the resource
 cached it will load and cache it.
 
 */
#import <Foundation/Foundation.h>


@interface CSSRuleset : NSObject {
    // string rep of the ruleset
    NSDictionary *parsedRuleset;
    
    // dictionary with actual loaded resources (like UIImage)
    // this thing acts as a cache.
    NSDictionary *loadedRuleset;
}
- (id)initWithDict:(NSDictionary*)dictionary;
/** Grabs the rule value for the specified key. It'll load the resource if it doesn't 
 already exist.*/
- (NSObject*)getRuleValue:(NSString*)key;
/** Sets the resource uri (like background-image for css) for the specified ruleset key.*/
- (void)setRuleValue:(NSString*)value forKey:(NSString*)key;
@end
