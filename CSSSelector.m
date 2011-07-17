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
+ (NSArray*)subSelectorsFromString:(NSString *)main_selector {
    NSArray *sels = [main_selector componentsSeparatedByString:@" "];
    
    NSMutableArray *parsed_sels = [NSMutableArray arrayWithCapacity:30];
    for (NSString *sel in sels) {
        CSSSelector *parsed_sel = [[CSSSelector alloc] initWithSelectorStr:sel];
        [parsed_sels addObject:parsed_sel];
    }
    return parsed_sels;
}
#pragma mark accessor methods
/** Parses selector string into levels, classes, etc.*/
- (void)parseSelector {
    NSArray *levels = [selector componentsSeparatedByString:@" "];
    
    if ([levels count]) {
        NSString *slug = [levels lastObject];
    }
}

- (NSArray*)selectorComponents {
    // just split on spaces..
    return [[self description] componentsSeparatedByString:@" "];
}
- (BOOL)doesMatch:(CSSSelector *)other_selector {
    NSArray *other_classes = other_selector.classes;
    
    // see if any of the classes DON'T match
    BOOL doesMatch = NO;
    for (NSString *class in classes) {
        if ([other_classes containsObject:class])
            doesMatch = YES;
        else
            doesMatch = NO;
    }
    // see if the class name doens't match
    doesMatch &= [self.className isEqualToString:other_selector.className];
    
    // finally see if the id matches (might not...)
    doesMatch &= [self.cssID isEqualToString:other_selector.cssID];
    
    return doesMatch;
}

- (NSString*)description {
    return selector;
}

/** calculates precedence score based on number of classes, ids, etc.
 The score is based on the following:
 ID are always worth 100
 Class are always worth 10
 HTML tags (class type tags) are always worth 1.
 
 Since the score is so simple to calculate, we simply re-run everytime and don't
 cache.*/
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
