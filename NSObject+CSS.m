//
//  NSObject+CSS.m
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "NSObject+CSS.h"
#import <objc/runtime.h>

#define kUIViewIDNameKey "UIViewCSSIDNameKey" 
#define kUIViewClassNameKey "UIViewCSSClassNameKey"

@implementation NSObject (CSS)

@dynamic idName;
@dynamic classNames;

#pragma mark - ID & Class names

/**
 *	Set class names
 *	@param a NSSet
 */
-(void) setClassNames:(NSSet*) aClassName{
	objc_setAssociatedObject(self, kUIViewClassNameKey, aClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 *	Class names
 *
 *	@return NSSet
 */
-(NSSet*) classNames{
	return objc_getAssociatedObject(self, kUIViewClassNameKey);
}

/**
 *	Add a class name
 *
 *	@param a class name to add
 */
-(void) addClassName:(NSString*) aName{
	
	NSSet *temp;
	
	temp  = [[NSSet setWithObject:aName] setByAddingObjectsFromSet:[self classNames]];
	
	[self setClassNames:temp];
}

/**
 *	Remove class name
 *	@param a Class name to remove
 */
-(void) removeClassName:(NSString*) aName{
	
	NSMutableSet *temp;
	
	temp = [[self classNames] mutableCopy];
	
	[temp removeObject:aName];
	
	[self setClassNames:[[temp copy] autorelease]];
	
	[temp release];
	
}

/**
 *	set the view's id
 *	@param an id name
 */
-(void) setIdName:(NSString*) anIDName{
	objc_setAssociatedObject(self, kUIViewIDNameKey, anIDName, OBJC_ASSOCIATION_COPY_NONATOMIC );
}

/**
 *	Get the view's id name
 *	@return an id name
 */
-(NSString*) idName{
	return (NSString*) objc_getAssociatedObject(self,kUIViewIDNameKey);
}

#pragma mark - Style loading
/**
 *	Set a style
 *	
 *	@param aStyle string
 */
-(void) setStyle:(NSString*) aStyle{
	NSLog(@"Style \r\n%@",aStyle);
}

/**
 *	Load a style from a file
 *	@param The path to a CSS file
 */
-(void) setStyleWithPath:(NSString*) aFilePath{
	
	NSError		*error = nil;
	NSString	*str;
	
	str = [NSString stringWithContentsOfFile:aFilePath
									encoding:NSUTF8StringEncoding
									   error:&error];
	
	if( str && !error ){
		[self setStyle:str];
	}
	else{
		NSLog(@"setStyleWithPath %@", error);
	}
	
}

/**
 *	Set a style from a URL
 *	@param a URL to load a style from
 */
-(void) setStyleWithURL:(NSURL*) aURL{
	
	[NSException raise:@"Missing implementation" format:@"setStyleWithURL"];
	
}

@end
