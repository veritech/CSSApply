//
//  NSObject+CSS.m
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "NSObject+CSS.h"
#import <objc/runtime.h>

static const char *ClassNameKey = "CSSItemClassName___";
static const char *CssID = "CSSClassIDName_____";

@implementation NSObject (CSS)

@dynamic cssID, classNames;

#pragma mark - ID & Class names

/**
 *	Set class names
 *	@param a NSSet
 */
-(void) setClassNames:(NSSet*) aClassName{
	objc_setAssociatedObject(self, ClassNameKey, aClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 *	Class names
 *
 *	@return NSSet
 */
-(NSSet*) classNames{
	return objc_getAssociatedObject(self, ClassNameKey);
}


/**
 *	set the view's id
 *	@param an id name
 */
-(void) setIdName:(NSString*) anIDName{
	objc_setAssociatedObject(self, CssID, anIDName, OBJC_ASSOCIATION_COPY_NONATOMIC );
}

/**
 *	Get the view's id name
 *	@return an id name
 */
-(NSString*) idName{
	return (NSString*) objc_getAssociatedObject(self, CssID);
}

- (id)CSSParent {
    return nil;
}
@end
