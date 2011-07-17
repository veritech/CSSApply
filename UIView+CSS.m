//
//  UIVIew+CSS.m
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.

#import "UIView+CSS.h"

static const char *ClassNameKey = "CSSItemClassName___";
static const char *CssID = "CSSClassIDName_____";

@implementation UIView (CSS)
@dynamic cssID;
@dynamic classNames;

#pragma mark - ID & Class names
-(void) setClassNames: (NSSet *)aClassName {
	objc_setAssociatedObject(self, ClassNameKey, aClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(NSSet*) classNames{
	return objc_getAssociatedObject(self, ClassNameKey);
}

-(void) addClassName:(NSString*) aName{
	
	NSSet *temp;
	
	temp  = [[NSSet setWithObject:aName] setByAddingObjectsFromSet:[self classNames]];
	
	[self setClassNames:temp];
}

-(void) removeClassName:(NSString*) aName{
	
	NSMutableSet *temp;
	
	temp = [[self classNames] mutableCopy];
	[temp removeObject:aName];
	
	[self setClassNames:[[temp copy] autorelease]];
	
	[temp release];
}

-(void) setCssID:(NSString *)cssID {
	objc_setAssociatedObject(self, &CssID, cssID, OBJC_ASSOCIATION_COPY_NONATOMIC );
}

-(NSString*) cssID{
	return (NSString*) objc_getAssociatedObject(self,&CssID);
}


#pragma mark Actual application methods
- (void)applyAll:(CSSStyleSheet *)sheet {
    
}

- (void)apply:(CSSStyleSheet *)sheet {
    
}

#pragma mark Searching though the "DOM"
/** Searches through the "DOM" for a specific set of subviews specified
 by the selector.*/
- (NSArray*)find:(NSString *)selector {
    return nil;
}
- (NSArray*)findAll:(NSString *)selector {
    return nil;
}

-(id) CSSParent{
	return [self superview];
}
@end
