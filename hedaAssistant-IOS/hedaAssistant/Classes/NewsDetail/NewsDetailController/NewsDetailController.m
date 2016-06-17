//
//  NewsDetailController.m
//  hedaAssistant
//
//  Created by bear on 16/3/24.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "NewsDetailController.h"
#import <UIKit+AFNetworking.h>

@interface NewsDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *titleV;
@property (weak, nonatomic) IBOutlet UILabel *timeV;
@property (weak, nonatomic) IBOutlet UIImageView *picV;
@property (weak, nonatomic) IBOutlet UILabel *textV;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation NewsDetailController


-(void)viewDidLoad{


    [super viewDidLoad];

    self.scrollView.contentSize=CGSizeMake(SCREEN_WIDTH, self.timeV.y+self.timeV.height+20);



    self.scrollView.directionalLockEnabled=YES;
    self.scrollView.contentSize=CGSizeMake(0, self.view.hidden);
    _titleV.text=_news.news_title;
    _timeV.text=_news.news_time;

    NSURL *url=[NSURL URLWithString:_news.news_pic];
    [_picV setImageWithURL:url placeholderImage:[UIImage imageNamed:@"headImg"]];
    _textV.text=_news.news_content;
    self.title=_news.news_title;
}




@end
