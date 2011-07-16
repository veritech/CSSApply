//
//  CSSSampleViewController.h
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CSS.h"

@interface CSSSampleViewController : UIViewController {
    
	UILabel *sampleView;
}
@property (nonatomic, retain) IBOutlet UILabel *sampleView;

@end
