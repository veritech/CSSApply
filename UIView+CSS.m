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

@dynamic CSSIdName;
@dynamic CSSClassNames;

#pragma mark - ID & Class names

/**
 *	Set class names
 *	@param a NSSet
 */
-(void) setCSSClassNames:(NSSet*) aClassName{
	objc_setAssociatedObject(self, kUIViewClassNameKey, aClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 *	Class names
 *
 *	@return NSSet
 */
-(NSSet*) CSSClassNames{
	return objc_getAssociatedObject(self, kUIViewClassNameKey);
}

/**
 *	Add a class name
 *
 *	@param a class name to add
 */
-(void) addCSSClassName:(NSString*) aName{
	
	NSSet *temp;
	
	temp  = [[NSSet setWithObject:aName] setByAddingObjectsFromSet:[self CSSClassNames]];
	
	[self setCSSClassNames:temp];
}

/**
 *	Remove class name
 *	@param a Class name to remove
 */
-(void) removeCSSClassName:(NSString*) aName{
	
	NSMutableSet *temp;
	
	temp = [[self CSSClassNames] mutableCopy];
	
	[temp removeObject:aName];
	
	[self setCSSClassNames:[[temp copy] autorelease]];
	
	[temp release];
	
}

/**
 *	set the view's id
 *	@param an id name
 */
-(void) setCSSIdName:(NSString*) anIDName{
	objc_setAssociatedObject(self, kUIViewIDNameKey, anIDName, OBJC_ASSOCIATION_COPY_NONATOMIC );
}

/**
 *	Get the view's id name
 *	@return an id name
 */
-(NSString*) CSSIdName{
	return (NSString*) objc_getAssociatedObject(self,kUIViewIDNameKey);
}

#pragma mark - Style loading
/**
 *	Set a style
 *	
 *	@param aStyle string
 */
-(void) setCSSStyle:(NSString*) aStyle{
	NSLog(@"Style \r\n%@",aStyle);
}

/**
 *	Load a style from a file
 *	@param The path to a CSS file
 */
-(void) setCSSStyleWithPath:(NSString*) aFilePath{
	
	NSError		*error = nil;
	NSString	*str;
	
	str = [NSString stringWithContentsOfFile:aFilePath
									encoding:NSUTF8StringEncoding
									   error:&error];
	
	if( str && !error ){
		[self setCSSStyle:str];
	}
	else{
		NSLog(@"setStyleWithPath %@", error);
	}
	
}

/**
 *	Set a style from a URL
 *	@param a URL to load a style from
 */
-(void) setCSSStyleWithURL:(NSURL*) aURL{
	
	//NSURL *
	
	
}


@end
