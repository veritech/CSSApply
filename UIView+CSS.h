//
//  UIVIew+CSS.h
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView (CSS)

@property (nonatomic,copy) NSString *idName;
@property (nonatomic,copy) NSString *className;
//@property (nonatomic,copy) NSString *style;

//CSS properties
-(void) setStyle:(NSString*) aString;

-(void) setStyleWithPath:(NSString*) aFilePath;

-(void) setStyleWithURL:(NSURL*) aURL;


@end
