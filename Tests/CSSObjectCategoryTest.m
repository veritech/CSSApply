//
//  CSSViewTests.m
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "CSSObjectCategoryTest.h"
#import "UIView+CSS.h"

@implementation CSSObjectCategoryTest

-(void) setUp{
	_testView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 320.f)];
}

-(void) tearDown{
	[_testView release];
	_testView = nil;
}

-(void) testView{
	GHAssertNotNil(_testView, @"Test view is nil");
}

-(void) testSetClassName{

	int count = 0;
	
	//Initial
	[_testView addCSSClassName:@"foo"];
	
	count = [[_testView CSSClassNames] count];
	
	GHAssertTrue( count == 1, @"Count = %d instead of 1",count);
	
	//Duplicates
	[_testView addCSSClassName:@"foo"];
	
	count = [[_testView CSSClassNames] count];
	
	GHAssertTrue( count == 1, @"Count = %d instead of 1",count);
	
	//+1
	[_testView addCSSClassName:@"bar"];
	
	count = [[_testView CSSClassNames] count];
	
	GHAssertTrue( count == 2, @"Count = %d instead of 1",count);
}

-(void) testRemoveClassName{
	
	int count = INT16_MAX;
	
	//add
	[_testView addCSSClassName:@"foo"];
	
	count = [[_testView CSSClassNames] count];
	
	GHAssertTrue( count == 1, @"Count = %d instead of 1",count);
	
	//remove
	[_testView removeCSSClassName:@"foo"];
	
	count = [[_testView CSSClassNames] count];
	
	GHAssertTrue( count == 0, @"Count = %d instead of 1",count);
}

-(void) testBasicSelector{
	
}

-(void) testSelector{
	
}

@end
