//
//  CSSParser.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CSSParser;


@class CSSParser;
@interface CSSParser : NSObject {
    
}

- (NSDictionary*)parseURL:(NSURL*)url;

//make sure this is a week property.
@property (assign, nonatomic) id <CSSParserDelegate> delegate;
@end
