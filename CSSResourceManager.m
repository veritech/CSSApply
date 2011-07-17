//
//  CSSResourceManager.m
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "CSSResourceManager.h"


@implementation CSSResourceManager

+ (CSSResourceManager*)sharedResourceManager {
    static dispatch_once_t onceToken;
    static CSSResourceManager *_sharedManager;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[CSSResourceManager alloc] init];
    });
    return _sharedManager;
}
@end
