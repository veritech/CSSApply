//
//  CSSParser.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSSParser : NSObject {
@private
    NSMutableDictionary*  _ruleSets;
    NSMutableArray*       _activeCssSelectors;
    NSMutableDictionary*  _activeRuleSet;
    NSString*             _activePropertyName;
    
    NSString*             _lastTokenText;
    int                   _lastToken;
    
    union {
        struct {
            int InsideDefinition : 1;
            int InsideProperty : 1;
            int InsideFunction : 1;
        } Flags;
        int _data;
    } _state;
}

- (NSDictionary*)parseFilename:(NSString*)filename;
@end
