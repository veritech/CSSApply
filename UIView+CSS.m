//
//  UIVIew+CSS.m
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "UIVIew+CSS.h"
#import <objc/runtime.h>

#define kUIViewIDNameKey "UIViewCSSIDNameKey" 
#define kUIViewClassNameKey "UIViewCSSClassNameKey"

@implementation UIView (CSS)

@dynamic cssID;
@dynamic classNames;

#pragma mark - ID & Class names


-(void) setClassNames:(NSSet*) aClassName{
	objc_setAssociatedObject(self, kUIViewClassNameKey, aClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(NSSet*) classNames{
	return objc_getAssociatedObject(self, kUIViewClassNameKey);
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
	objc_setAssociatedObject(self, kUIViewIDNameKey, cssID, OBJC_ASSOCIATION_COPY_NONATOMIC );
}

-(NSString*) cssID{
	return (NSString*) objc_getAssociatedObject(self,kUIViewIDNameKey);
}


#pragma mark Actual application methods
- (void)applyAll:(CSSStyleSheet *)sheet {
    
}
#pragma mark Searching though the "DOM"
/** Searches through the "DOM" for a specific set of subviews specified
 by the selector.*/
- (NSArray*)find:(NSString *)selector {
    
}
- (NSArray*)findAll:(NSString *)selector {
    
}


@end
