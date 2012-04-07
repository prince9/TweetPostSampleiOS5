//
//  FirstViewController.m
//  Twitterios5Test
//
//  Created by 真有 津坂 on 12/04/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController
@synthesize tweetField;
@synthesize networkSt;

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
    [self setTweetField:nil];
    [self setNetworkSt:nil];
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

//入力後キーボードを隠す、keyboard is hidden.
- (IBAction)keyhide:(id)sender {
    [tweetField resignFirstResponder];
}

//ツイートボタン。これがないと始まらない、Tweet button.
- (IBAction)tweet:(id)sender {
    /*
     {}内、NSString *tweetText、*hashTag、*sendTweet以外はすべてtwitterアカウントを使用して自動でポストするために必要。
     決まった文を入れたい場合はdictionaryWithObject:tweetTextのところをdictionaryWithObject:@"ほげほげ"にすればOK。
     When pushing a button and carrying out Tweet, it is all necessity except NSString *tweetText、*hashTag、*sendTweet. 
     */
	ACAccountStore *accountStore = [[ACAccountStore alloc] init];
	
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [accountStore requestAccessToAccountsWithType:accountType withCompletionHandler:^(BOOL granted, NSError *error) {
        if(granted) {
            NSArray *accountsArray = [accountStore accountsWithAccountType:accountType];
            
			if ([accountsArray count] > 0) {
                
				ACAccount *twitterAccount = [accountsArray objectAtIndex:0];
				
                
                //UITextFieldに入力するテキスト、The text inputted into UITextField. 
                NSString *tweetText = tweetField.text;
                
                //ハッシュタグ、hashTag
                NSString *hashTag = @" #tweetTest";
                //最終的にツイートされるテキスト、ハッシュタグがいらない場合は上の1行を削除してdictionaryWithObject:tweetTextにすればOK
                //The text finally contributed.
                NSString *sendTweet = [tweetText stringByAppendingString:hashTag];
                
				TWRequest *postRequest = [[TWRequest alloc] initWithURL:[NSURL URLWithString:@"http://api.twitter.com/1/statuses/update.json"] parameters:[NSDictionary dictionaryWithObject:sendTweet forKey:@"status"] requestMethod:TWRequestMethodPOST];
                
				[postRequest setAccount:twitterAccount];
                
				[postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
					NSString *output = [NSString stringWithFormat:@"HTTP response status: %i", [urlResponse statusCode]];
                    if ([urlResponse statusCode] == 200) {
                        networkSt.text = @"Tweet Success";
                    } else {
                        networkSt.text = @"Tweet NG";
                    }
                    
                    NSLog(@"%@",output);
                    
                }];
			}
        }
	}];

}
@end
