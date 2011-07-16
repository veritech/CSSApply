//
//  CSSResourceManager.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

/** Singleton instance which does caching and loading of resources.*/
#import <Foundation/Foundation.h>


@interface CSSResourceManager : NSObject {
    
}

- (UIImage*)loadImage:(NSString*)path;
- (NSString*)loadCSS:(NSString*)path;

+ (CSSResourceManager*)sharedResourceManager;
@end
