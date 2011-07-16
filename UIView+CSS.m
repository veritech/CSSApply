//
//  UIVIew+CSS.m
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "UIVIew+CSS.h"


@implementation UIView (CSS)

#pragma mark - ID & Class names
-(void) setIDName:(NSString*) anIDName{
	
}

-(NSString*) idName{
	return nil;
}

-(void) setClassName:(NSString*) aClassName{
	
}

-(NSString*) className{
	return nil;
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
