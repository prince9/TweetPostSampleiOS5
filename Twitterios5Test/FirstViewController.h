//
//  FirstViewController.h
//  Twitterios5Test
//
//  Created by 真有 津坂 on 12/04/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//追加,add
#import <Twitter/Twitter.h>
#import <Accounts/ACAccount.h>
#import <Accounts/ACAccountStore.h>
#import <Accounts/ACAccountType.h>

@interface FirstViewController : UIViewController

//ツイート入力、input of Tweet 
@property (weak, nonatomic) IBOutlet UITextField *tweetField;
//ツイートが成功したか失敗したか、state of Tweet
@property (weak, nonatomic) IBOutlet UILabel *networkSt;

//入力後キーボードを隠す、keyboard is hidden.
- (IBAction)keyhide:(id)sender;

//ツイートボタン。これがないと始まらない、Tweet button.
- (IBAction)tweet:(id)sender;
@end
