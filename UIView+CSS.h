//
//  UIVIew+CSS.h
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView (CSS)

@property (nonatomic,copy) NSString *CSSIdName;
@property (nonatomic,copy) NSSet *CSSClassNames;
//@property (nonatomic,copy) NSString *style;

-(void) addCSSClassName:(NSString*) aName;
-(void) removeCSSClassName:(NSString*) aName;

//CSS properties
-(void) setCSSStyle:(NSString*) aString;

-(void) setCSSStyleWithPath:(NSString*) aFilePath;

-(void) setCSSStyleWithURL:(NSURL*) aURL;


@end
