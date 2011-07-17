//
//  CSSStyleSheet.m
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "CSSStyleSheet.h"
#import "CSSParser.h"

@interface CSSStyleSheet ()
- (void)buildTree:(NSDictionary*)rules;
@end

@implementation CSSStyleSheet
@synthesize root = _root;
#pragma mark Loader Methods

+ (CSSStyleSheet*)styleSheetFromURL:(NSURL *)url {
    CSSStyleSheet *sheet = [[[CSSStyleSheet alloc] init] autorelease];
    [sheet loadFromURL:url];
    return sheet;
}

+ (CSSStyleSheet*)styleSheetFromString:(NSString *)css_code {
    //TODO: load and parse from string
    return nil;
}

- (void)loadFromURL:(NSURL*)url {
    if (parser)
        [parser release], parser = nil;
    parser = [[CSSParser alloc] init];
    
    // grab the entire file and load the rule dictionary.
    NSDictionary *rules = [parser parseFilename:[url path]];
    
    //build the tree from the parsed rules
    [self buildTree:rules];
}

- (void)loadFromString:(NSString *)css_code {
    //TODO: load from string (need it in the parser class.)
}

#pragma mark Tree Parsing methods
/** Builds the giant {@link CSSSelectorTree} from Lex parser data.*/
- (NSArray*)parseSelector:(NSString*)selector {
    // split on spaces only (though more css may be supported in the future)
    return [selector componentsSeparatedByString:@" "];
}

- (void)buildTree:(NSDictionary *)rules {
    mainTree = [[NSMutableDictionary dictionaryWithCapacity:30] retain];
    
    // create the root node for the selector tree
    _root = [[CSSSelectorTree alloc] init];
    
    NSArray *selectors = [rules allKeys];
    
    for (NSString *selector in selectors) {
        // entry which includes score, "All" namespace, and 
        NSMutableDictionary *element_entry = [NSMutableDictionary dictionaryWithCapacity:20];
        
        NSDictionary *ruleset = [rules objectForKey:selector];
        
        //[element_entry setValue:[NSNumber numberWithInt:score] forKey:@"score"];
        
        CSSSelector *parsed_selector = [[CSSSelector alloc] initWithSelectorStr:selector];
        CSSSelectorTree *sub_tree = [[CSSSelectorTree alloc] initWithSelector:parsed_selector];
        
        //NSArray *components = [self parseSelector:parse];
        NSArray *components = nil;
        if ([components count]) {
            
            if ([components count] > 1) {
                //loop through components and insert into sub elements
                for (NSString *component in components) {
                    // try to find ourselves in the tree
                }
            } else {
                // we create an "All" namespace
                //[element_entry setValue:parsed_ruleset forKey:@"All"];
            }

            // remember, we ensure that the selector is reversed. 
            [mainTree setValue:element_entry forKey:[components lastObject]];
        }
        
        
    }
}

- (void)dealloc {
    [super dealloc];
    [mainTree release], mainTree = nil;
}
@end
