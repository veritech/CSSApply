//
//  NSObject+CSS.m
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "NSObject+CSS.h"
#import <objc/runtime.h>

static const char* kUIViewIDNameKey = "UIViewCSSIDNameKey"; 
static const char* kUIViewClassNameKey = "UIViewCSSClassNameKey";
static const char* kUIViewCSSSelectorKey = "UIViewCSSSelectorKey";

@implementation NSObject (CSS)

@dynamic CSSID, CSSClassNames, CSSSelector;

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
 *	set the view's id
 *	@param an id name
 */
-(void) setCSSID:(NSString*) anIDName{
	objc_setAssociatedObject(self, kUIViewIDNameKey, anIDName, OBJC_ASSOCIATION_COPY_NONATOMIC );
}

/**
 *	Get the view's id name
 *	@return an id name
 */
-(NSString*) CSSID{
	return (NSString*) objc_getAssociatedObject(self, kUIViewIDNameKey);
}


-(CSSSelector*)CSSSelector {
    CSSSelector *selector = (CSSSelector*) objc_getAssociatedObject(self, kUIViewCSSSelectorKey);
    
    if (!selector)
    {
        selector = [[CSSSelector alloc] initWithClassName:NSStringFromClass([self class]) 
											   classNames:[self CSSClassNames] 
												  classID:[self CSSID]
					];
		
        objc_setAssociatedObject(self, kUIViewCSSSelectorKey, selector, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return selector;
}

@end
