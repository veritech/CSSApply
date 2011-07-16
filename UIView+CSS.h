//
//  UIVIew+CSS.h
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView (CSS)

//CSS properties
-(void) setIdName:(NSString*) anIdName;
-(NSString*) idName;

-(void) setClassName:(NSString*) aClassName;
-(NSString*) className;

//Style loading
-(void) setStyle:(NSString*) aStyle;

-(void) setStyleWithPath:(NSString*) aFilePath;

-(void) setStyleWithURL:(NSURL*) aURL;


@end
