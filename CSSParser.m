//
//  CSSParser.m
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "CSSTokens.h"
#import "css.h"
#import "CSSParser.h"

typedef enum {
    None,
    
} ParserStates;


// Damn you, flex. Due to the nature of the global methods and whatnot, we can only have one
// parser at any given time.
CSSParser* gActiveParser = nil;

@interface CSSParser()

- (void)consumeToken:(int)token text:(char*)text;

@end


int cssConsume(char* text, int token) {
    [gActiveParser consumeToken:token text:text];
    
    return 0;
}


@implementation CSSParser


- (id)init {
	self = [super init];
    if (self) {
        _ruleSets           = [[NSMutableDictionary alloc] init];
        _activeCssSelectors = [[NSMutableArray alloc] init];
    }
    
    return self;
}


- (void)dealloc {
    [_ruleSets release],_ruleSets=nil;
    [_activeCssSelectors release],_activeCssSelectors=nil;
    [_activeRuleSet release],_activeRuleSet=nil;
    [_activePropertyName release],_activePropertyName=nil;
    [_lastTokenText release],_lastTokenText=nil;
    
    [super dealloc];
}


- (void)consumeToken:(int)token text:(char*)text {
    NSString* string = [[NSString stringWithCString: text
                                           encoding: NSUTF8StringEncoding] lowercaseString];
    NSLog(@" %x : %@",token,string);
    
    switch (token) {
        case CSSHASH:
        case CSSIDENT: {
            if (_state.Flags.InsideDefinition) {
                
                // If we're inside a definition then we ignore hashes.
                if (CSSHASH != token && !_state.Flags.InsideProperty) {
                    [_activePropertyName release],_activePropertyName=nil;
                    _activePropertyName = [string retain];
                    
                    NSMutableArray* values = [[NSMutableArray alloc] init];
                    [_activeRuleSet setObject:values forKey:_activePropertyName];
                    [values release];
                    
                } else {
                    // This is a value, so add it to the active property.
                    //TTDASSERT(nil != _activePropertyName);
                    
                    if (nil != _activePropertyName) {
                        NSMutableArray* values = [_activeRuleSet objectForKey:_activePropertyName];
                        [values addObject:string];
                    }
                }
                
            } else {
                if (_lastToken == CSSUNKNOWN && [_lastTokenText isEqualToString:@"."]) {
                    string = [_lastTokenText stringByAppendingString:string];
                }
                [_activeCssSelectors addObject:string];
                [_activePropertyName release],_activePropertyName=nil;
            }
            break;
        }
            
        case CSSFUNCTION: {
            if (_state.Flags.InsideProperty) {
                _state.Flags.InsideFunction = YES;
                
                if (nil != _activePropertyName) {
                    NSMutableArray* values = [_activeRuleSet objectForKey:_activePropertyName];
                    [values addObject:string];
                }
            }
            break;
        }
            
        case CSSSTRING:
        case CSSEMS:
        case CSSEXS:
        case CSSLENGTH:
        case CSSANGLE:
        case CSSTIME:
        case CSSFREQ:
        case CSSDIMEN:
        case CSSPERCENTAGE:
        case CSSNUMBER:
        case CSSURI: {
            // (nil != _activePropertyName);
            
            if (nil != _activePropertyName) {
                NSMutableArray* values = [_activeRuleSet objectForKey:_activePropertyName];
                [values addObject:string];
            }
            break;
        }
            
        case CSSUNKNOWN: {
            switch (text[0]) {
                case '{': {
                    _state.Flags.InsideDefinition = YES;
                    _state.Flags.InsideFunction = NO;
                    [_activeRuleSet release],_activeRuleSet=nil;
                    _activeRuleSet = [[NSMutableDictionary alloc] init];
                    break;
                }
                    
                case '}': {
                    for (NSString* name in _activeCssSelectors) {
                        NSMutableDictionary* existingProperties = [_ruleSets objectForKey:name];
                        if (nil != existingProperties) {
                            // Overwrite the properties, instead!
                            
                            NSDictionary* iteratorProperties = [_activeRuleSet copy];
                            for (NSString* key in iteratorProperties) {
                                [existingProperties setObject:[_activeRuleSet objectForKey:key] forKey:key];
                            }
                            [iteratorProperties release];
                            
                        } else {
                            NSMutableDictionary* ruleSet = [_activeRuleSet mutableCopy];
                            [_ruleSets setObject:ruleSet forKey:name];
                            [ruleSet release];
                        }
                    }
                    [_activeRuleSet release],_activeRuleSet=nil;
                    [_activeCssSelectors removeAllObjects];
                    _state.Flags.InsideDefinition = NO;
                    _state.Flags.InsideProperty = NO;
                    _state.Flags.InsideFunction = NO;
                    break;
                }
                    
                case ':': {
                    if (_state.Flags.InsideDefinition) {
                        _state.Flags.InsideProperty = YES;
                    }
                    break;
                }
                    
                case ')': {
                    if (_state.Flags.InsideFunction && nil != _activePropertyName) {
                        NSMutableArray* values = [_activeRuleSet objectForKey:_activePropertyName];
                        [values addObject:string];
                    }
                    _state.Flags.InsideFunction = NO;
                    break;
                }
                    
                case ';': {
                    if (_state.Flags.InsideDefinition) {
                        _state.Flags.InsideProperty = NO;
                    }
                    break;
                }
                    
            }
            break;
        }
    }
    
    [_lastTokenText release];
    _lastTokenText = [string retain];
    _lastToken = token;
}

#pragma mark -
#pragma mark Public



- (NSDictionary*)parseFilename:(NSString*)filename {
    gActiveParser = self;
    
    [_ruleSets removeAllObjects];
    [_activeCssSelectors removeAllObjects];
    [_activeRuleSet release],_activeRuleSet=nil;
    [_activePropertyName release],_activePropertyName=nil;
    [_lastTokenText release],_lastTokenText=nil;
    
    cssin = fopen([filename UTF8String], "r");
    
    csslex();
    
    fclose(cssin);
    
    NSDictionary* result = [[_ruleSets copy] autorelease];
    [_ruleSets release],_ruleSets=nil;
    return result;
}

@end
