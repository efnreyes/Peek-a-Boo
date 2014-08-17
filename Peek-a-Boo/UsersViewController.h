//
//  UsersViewController.h
//  Peek-a-Boo
//
//  Created by Efrén Reyes Torres on 8/17/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface UsersViewController : UICollectionViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
