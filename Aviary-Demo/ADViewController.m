//
//  ADViewController.m
//  Aviary-Demo
//
//  Created by Lacy Rhoades on 4/4/12.
//  Copyright (c) 2012 colordeaf ltd. All rights reserved.
//

#import "ADViewController.h"


@implementation ADViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[self view] setBackgroundColor:[UIColor blackColor]];
    
    UIImage *image = [UIImage imageNamed:@"cabin.jpg"];
    
    currentImage = image;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    CGRect imageFrame = [[self view] frame];
    
    [imageView setFrame: imageFrame];
    
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    [[self view] addSubview:imageView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
            
    [self displayEditorForImage:currentImage];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Aviary-related methods

- (void)displayEditorForImage:(UIImage *)imageToEdit
{
    AFPhotoEditorController *editorController = [[AFPhotoEditorController alloc] initWithImage:imageToEdit];
    [editorController setDelegate:(id)self];
    [self presentModalViewController:editorController animated:YES];
}

- (void)photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image
{
    currentImage = image;
    
    [[[[self view] subviews] objectAtIndex:0] setImage:currentImage];
    
    [[self modalViewController] dismissModalViewControllerAnimated:YES];
}

- (void)photoEditorCanceled:(AFPhotoEditorController *)editor
{
    [[self modalViewController] dismissModalViewControllerAnimated:YES];
}

@end
