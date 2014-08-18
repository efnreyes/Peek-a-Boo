//
//  UsersViewController.m
//  Peek-a-Boo
//
//  Created by Efrén Reyes Torres on 8/17/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import "UsersViewController.h"
#import "DetailViewController.h"
#import "PhotoViewController.h"
#import "User.h"

@interface UsersViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation UsersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.fetchedResultsController.delegate = self;
    [self.fetchedResultsController performFetch:nil];
}

-(IBAction)unwindFromDetailViewController:(UIStoryboardSegue *)segue {

}

#pragma mark - UICollectionViewController delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.fetchedResultsController.sections objectAtIndex:section] numberOfObjects];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    User *user = [self.fetchedResultsController objectAtIndexPath:indexPath];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"userCellID" forIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:user.photo]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showUserImageSegue" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"newUserSegue"]) {
        DetailViewController *dvc = segue.destinationViewController;
        dvc.managedObjectContext = self.managedObjectContext;
    } else {
        PhotoViewController *pvc = segue.destinationViewController;
        pvc.user = [self.fetchedResultsController objectAtIndexPath:[self.collectionView indexPathsForSelectedItems].firstObject];
    }
}


@end
