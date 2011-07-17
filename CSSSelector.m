//
//  CSSSelector.m
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "CSSSelector.h"
@interface CSSSelector ()
- (void)breakIntoSlugAndMain:(NSString*)selector;
@end

@implementation CSSSelector
@dynamic score, main, slug;

- (id)initWithSelector:(NSString *)selector {
    self = [super init];
    if (self) {
        [self breakIntoSlugAndMain:selector];
    }
    return self;
}
/** Breaks into main url and slug.*/
- (void)breakIntoSlugAndMain:(NSString*)selector {
    // find slug (start at the end of the string and stop when we find control character)
    unichar control_chars[5] = {'.', '#', ' ', '>', ':'};
    
    for (int i = [selector length]; i>=0; i--) {
        unichar cur_char = [selector characterAtIndex:i];
        
        for (int j = 0; j<5;i++) {
            if (cur_char == control_chars[j]) {
                NSRange range = NSMakeRange(i-1, i+j+1);
                self.slug = [selector substringWithRange:range];
                self.main = [selector substringToIndex:i];
                return;
            }
        }
    }
}
- (NSArray*)selectorComponents {
    // just split on spaces..
    return [[self description] componentsSeparatedByString:@" "];
}
- (BOOL)doesMatch:(CSSSelector *)selector {
    //TODO checks for id match, class type match, classes mawtch
}
- (NSString*)description {
    return [NSString stringWithFormat:@"%@%@", self.levels, self.slug];
}

/** calculates precedence score based on number of classes, ids, etc.
 The score is based on the following:
 ID are always worth 100
 Class are always worth 10
 HTML tags (class type tags) are always worth 1*/
- (NSInteger)score {
    
}

- (void)dealloc {
    [super dealloc];
    [main release], main = nil;
    [slug release], slug = nil;
}
@end
