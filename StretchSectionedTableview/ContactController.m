//
//  ContactController.m
//  addressbook
//
//  Created by Dev Mountain on 6/2/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "ContactController.h"
#import "Contact.h"

@implementation ContactController

+ (NSArray *)contacts
{
    NSMutableArray *array = [NSMutableArray new];
    
    Contact *contact1 = [Contact new];
    contact1.firstName = @"Jordan";
    contact1.lastName = @"Nelson";
    [array addObject:contact1];
    
    Contact *contact2 = [Contact new];
    contact2.firstName = @"Jake";
    contact2.lastName = @"Herrmann";
    [array addObject:contact2];
    
    Contact *contact5 = [Contact new];
    contact5.firstName = @"Danny";
    contact5.lastName = @"Curvelo";
    [array addObject:contact2];
    
    
    Contact *contact3 = [Contact new];
    contact3.firstName = @"Taylor";
    contact3.lastName = @"Mott";
    [array addObject:contact3];
    
    
    Contact *contact4 = [Contact new];
    contact4.firstName = @"Caleb";
    contact4.lastName = @"Hicks";
    [array addObject:contact4];
    
    
    return [array copy];
}

+ (NSDictionary *)sortedContacts
{
    NSArray *contactArr = [self contacts];
    NSMutableDictionary *mutDict = [NSMutableDictionary new];
    
    for (Contact *contact in contactArr)
    {
        NSString *firstLetterStr = [contact.firstName substringToIndex:1];
        NSMutableArray *mutArr = [mutDict objectForKey:firstLetterStr];
        if (mutArr == nil) {
            mutArr = [NSMutableArray new];
        }
        [mutArr addObject:contact];
        [mutDict setObject:mutArr forKey:firstLetterStr];
    }
    
    return [mutDict copy];
}

@end
