//
//  UIVIew+CSS.h
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSSStyleSheet.h"
#import "CSSSelectorTree.h"

@interface UIView (CSS)

- (void)applyAll:(CSSStyleSheet*)sheet;
- (void)apply:(CSSStyleSheet*)sheet;

- (NSArray*)find:(CSSSelector*)selector;
- (NSArray*)findAll:(CSSSelector*)selector;

-(id) CSSParent;

@end
