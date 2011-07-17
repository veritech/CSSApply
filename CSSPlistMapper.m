//
//  CSSPlistMapper.m
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "CSSPlistMapper.h"


@implementation CSSPlistMapper

#pragma mark Required Mapper Methods
- (NSDictionary*)loadMappings {
    return [NSDictionary dictionaryWithObjectsAndKeys:@"backgroundImage",
                                                        @"background-image", nil];
}
@end
