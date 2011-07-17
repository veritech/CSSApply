//
//  UIVIew+CSS.h
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CSSStyleSheet;
@interface UIView (CSS)

-(void) addClassName:(NSString*) aName;
-(void) removeClassName:(NSString*) aName;

- (void)applyAll:(CSSStyleSheet*)sheet;
- (void)apply:(CSSStyleSheet*)sheet;


- (NSArray*)find:(NSString*)selector;
- (NSArray*)findAll:(NSString*)selector;

-(id) CSSParent;

@property (nonatomic,copy) NSString *cssID;
@property (nonatomic,copy) NSSet *classNames;
@end
