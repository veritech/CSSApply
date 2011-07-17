//
//  CSSRuleset.m
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "CSSRuleset.h"
@interface CSSRuleset()
- (NSObject*)loadResource:(NSString*)resource_uri;
@end

@implementation CSSRuleset

- (id)initWithDict:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        parsedRuleset = [dictionary retain];
    }
    return self;
}
- (NSObject*)getRuleValue:(NSString *)key {
    NSObject *value = [loadedRuleset objectForKey:key];
    if (!value) {
        // since not in cache grab string uri and load
        value = [self loadResource:[parsedRuleset objectForKey:key]];
        [loadedRuleset setValue:value forKey:key]; // save for next time.
    }
    return value;
}
- (void)setRuleValue:(NSObject *)value forKey:(NSString *)key {
    [parsedRuleset setValue:value forKey:key];
}


- (void)dealloc {
    [super dealloc];
    [parsedRuleset release], parsedRuleset = nil;
    [loadedRuleset release], loadedRuleset = nil;
}
@end
