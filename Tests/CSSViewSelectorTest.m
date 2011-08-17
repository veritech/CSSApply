//
//  CSSViewSelectorTest.m
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import "CSSViewSelectorTest.h"
#import "NSObject+CSS.h"
#import "UIView+CSS.h"

@implementation CSSViewSelectorTest




-(void) setUp{
	
	//Build a view tree
	_testView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 500.0f, 500.0f)];

	//Create a bunch of the class ids
	NSArray	*classIDs = [NSArray arrayWithObjects:@"foo",@"bar",@"foobar", nil];
	
	[classIDs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {

		UIView *child = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 200.f)];
		
		[child setCSSID:obj];
		
		[_testView addSubview:child];
		
		[child release];
		
	}];

}

-(void) tearDown{
	[_testView release];
	_testView = nil;
}

-(void) testSubviews{
	
	int count;
	
	count = [[_testView subviews] count];
	
	GHAssertTrue( count == 3, @"Subview count %d", count);
}

-(void) testSelector{

	NSSet	*results;
	int		count = 0;
	
	[_testView apply:[CSSStyleSheet styleSheetFromString:@"*{background-color:black}"]];
	
	results = [[_testView subviews] valueForKeyPath:@"backgroundColor"];
	
	NSLog(@"%@",results);
	
	count = [results count];
	
	//GHAssertTrue( count == 1, @"Invalid count %d",count);
	
	//GHAssertEqualObjects([results anyObject], [UIColor blackColor], @"Not the same color");
	
}

@end
