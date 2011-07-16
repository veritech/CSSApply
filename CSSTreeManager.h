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

- (NSDictionary*)lookup:(NSString*)key;
@end
