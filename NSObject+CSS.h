//
//  NSObject+CSS.h
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSSSelector.h"

@interface NSObject (CSS)

@property (nonatomic,copy) NSString *CSSID;
@property (nonatomic,copy) NSSet *CSSClassNames;
@property (nonatomic,readonly) CSSSelector *CSSSelector;


@end
