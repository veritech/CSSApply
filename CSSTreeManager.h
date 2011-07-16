//
//  CSSTreeManager.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSSMapper.h"

@interface CSSTreeManager : NSObject {
    id <CSSMapper> mapper;
    
    
}

/** Grabs entire tree for a given key. Tree is represented by NSDictionary.*/
- (NSDictionary*)lookup:(NSString*)key;

- (void)loadCSSFromFile:(NSString*)path;
- (void)loadCSSFromString:(NSString*)css_code;
@end
