//
//  DetailViewController.m
//  Peek-a-Boo
//
//  Created by Efrén Reyes Torres on 8/15/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *telephoneTextField;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"unwindSegue"]) {
        NSLog(@"Unwinding");
        User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
//        for (UIView *view in self.view.subviews) {
//            if ([view isKindOfClass:[UILabel class]]) {
//                UILabel *label = (UILabel*) view;
//                if ([allTrim(label.text) length] == 0) {
//                    //
//                }
//            }
//        }
        user.name = self.nameTextField.text;
        user.address = self.addressTextField.text;
        user.email = self.emailTextField.text;
        user.telephone = [NSNumber numberWithInt:[self.telephoneTextField.text integerValue]];
        user.photo = UIImageJPEGRepresentation(self.photoImageView.image, 0.8);
        [user.managedObjectContext save:nil];
    }
    return YES;
}

- (IBAction)onAddImage:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.photoImageView.image = chosenImage;

    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
