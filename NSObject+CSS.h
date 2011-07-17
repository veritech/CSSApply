//
//  NSObject+CSS.h
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (CSS)

@property (nonatomic,copy) NSString *idName;
@property (nonatomic,copy) NSSet *classNames;
//@property (nonatomic,copy) NSString *style;

-(void) addClassName:(NSString*) aName;
-(void) removeClassName:(NSString*) aName;

//CSS properties
-(void) setStyle:(NSString*) aString;

-(void) setStyleWithPath:(NSString*) aFilePath;

-(void) setStyleWithURL:(NSURL*) aURL;

- (id)CSSParent;
@end
