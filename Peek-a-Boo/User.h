//
//  User.h
//  Peek-a-Boo
//
//  Created by Efrén Reyes Torres on 8/17/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSNumber * telephone;

@end
