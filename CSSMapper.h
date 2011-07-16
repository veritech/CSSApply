//
//  CSSMapper.h
//  CSSSample
//
//  Created by Sam Stewart on 7/16/11.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

/** Simple interface thath all mappers must implement.
 
 Each mapper must return a list of mappers (flat namespace though that may change in the future).*/
@protocol CSSMapper <NSObject>
@required
- (NSDictionary*)loadMappings;
@end