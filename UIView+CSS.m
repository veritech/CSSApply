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

@dynamic idName;
@dynamic className;

#pragma mark - ID & Class names
-(void) setIdName:(NSString*) anIDName{
	objc_setAssociatedObject(self, kUIViewIDNameKey, anIDName, OBJC_ASSOCIATION_COPY_NONATOMIC );
}

-(NSString*) idName{
	return (NSString*) objc_getAssociatedObject(self,kUIViewIDNameKey);
}

-(void) setClassName:(NSString*) aClassName{
	objc_setAssociatedObject(self, kUIViewClassNameKey, aClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString*) className{
	return objc_getAssociatedObject(self, kUIViewClassNameKey);
}

#pragma mark - Style loading
/**
 *	Set a style
 *	
 *	@param aStyle string
 */
-(void) setStyle:(NSString*) aStyle{
	NSLog(@"Style %@",aStyle);
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
	
	//NSURL *
	
	
}


@end
