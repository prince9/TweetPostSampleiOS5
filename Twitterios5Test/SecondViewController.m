//
//  SecondViewController.m
//  Twitterios5Test
//
//  Created by 真有 津坂 on 12/04/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//「設定」を呼び出すダイアログ、The dialog which calls "Settings".
- (IBAction)acountSet:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"「設定」を開く" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"open setting", nil];
    [alert show];
}

//「設定」を呼び出す、Settings is called. 
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1){
        NSURL *twSettingURL = [NSURL URLWithString:@"prefs:root=TWITTER"];
        [[UIApplication sharedApplication] openURL:twSettingURL];
    }
}

@end
