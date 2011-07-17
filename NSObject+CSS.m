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

@dynamic cssID, classNames;

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
@end
