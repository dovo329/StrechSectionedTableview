//
//  Contact.h
//  StretchSectionedTableview
//
//  Created by Douglas Voss on 6/2/15.
//  Copyright (c) 2015 DougsApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

- (NSString *)description;

@end
