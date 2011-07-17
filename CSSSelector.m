//
//  CSSSelector.m
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "CSSSelector.h"
@interface CSSSelector ()
- (void)parseSelector;
@end

@implementation CSSSelector
@synthesize cssID, classes, className, selector;
@dynamic score;
- (id)initWithSelectorStr:(NSString *)selector_arg {
    self = [super init];
    if (self) {
        selector = [selector_arg retain];
        [self parseSelector];
    }
    return self;
}
- (id)initWithSelector:(NSString *)selector_arg {
    self = [super init];
    if (self) {
        selector = [selector_arg retain];
        [self parseSelector];
    }
    return self;
}
#pragma mark accessor methods

/** Parses selector string into levels, classes, etc.*/
- (void)parseSelector {
    for (int i=0;i<[selector count]; i++) {
        unichar current_char = [selector characterAtIndex:i];
        
    }
}
- (NSArray*)selectorComponents {
    // just split on spaces..
    return [[self description] componentsSeparatedByString:@" "];
}
- (BOOL)doesMatch:(CSSSelector *)selector {
    NSArray *other_classes = selector.classes;
    
    // see if any of the classes DON'T match
    BOOL doesMatch = NO;
    for (NSString *class in classes) {
        if ([other_classes containsObject:class])
            doesMatch = YES;
        else
            doesMatch = NO;
    }
    // see if the class name doens't match
    doesMatch &= [self.className isEqualToString:selector.className];
    
    // finally see if the id matches (might not...)
    doesMatch &= [self.cssID isEqualToString:selector.cssID];
    
    return doesMatch;
}

- (NSString*)description {
    return selector;
}

/** calculates precedence score based on number of classes, ids, etc.
 The score is based on the following:
 ID are always worth 100
 Class are always worth 10
 HTML tags (class type tags) are always worth 1*/
- (NSInteger)score {
    NSInteger score = 0;
    score += (cssID ? 100 : 0);
    score += ([classes count] ? [classes count] * 10 : 0);
    score += (className ? 1 : 0);
    return score;
}

- (void)dealloc {
    [super dealloc];
    [classes release], classes = nil;
    [cssID release], cssID = nil;
    
    [className release], className = nil;
    [selector release], selector = nil;
}
@end
