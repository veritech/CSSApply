//
//  CALayer+CSS.m
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "CALayer+CSS.h"


@implementation CALayer (CSS)

-(id) CSSParent{
	return [self superlayer];
}

@end
