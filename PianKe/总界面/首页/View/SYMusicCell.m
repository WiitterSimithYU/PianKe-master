//
//  SYMusicCell.m
//  PianKe
//
//  Created by 胡明昊 on 16/3/2.
//  Copyright © 2016年 CMCC. All rights reserved.
//

#import "SYMusicCell.h"
#import "list.h"
#import "Masonry.h"
#import "MusicView.h"
@implementation SYMusicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}


#pragma mark -
#pragma mark - 自动适配
- (void)setup
{
    __weak typeof(self)vc = self;
    [vc.ennameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.mas_top).offset(Padding);
        make.left.equalTo(vc.mas_left).offset(Padding);
        make.right.equalTo(vc.mas_right).offset(-Padding);
        make.height.mas_equalTo(20);
    }];
    
    [vc.musicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.ennameLabel.mas_bottom).offset(Padding);
        make.left.equalTo(vc.mas_left).offset(Padding * 2);
        make.right.equalTo(vc.mas_right).offset(-Padding *2);
        make.bottom.equalTo(vc.contentLabel.mas_top).offset(-Padding);
    }];
    
    [vc.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(vc.likeButton.mas_top).offset(-Padding);
        make.left.equalTo(vc.ennameLabel.mas_left);
        make.right.equalTo(vc.ennameLabel.mas_right);
        make.height.mas_equalTo(60);
    }];
    
    [vc.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(vc.mas_right).offset(-Padding);
        make.height.equalTo(vc.ennameLabel.mas_height);
        make.width.mas_equalTo(60);
        make.bottom.equalTo(vc.mas_bottom).offset(-Padding);
    }];
    
    [vc.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.equalTo(vc);
        make.height.mas_equalTo(1);
    }];
}


- (void)setListModel:(list *)listModel
{
    self.ennameLabel.text = [NSString stringWithFormat:@"%@·%@",listModel.name,listModel.enname];
    self.contentLabel.text = listModel.content;
    [self.likeButton setTitle:[NSString stringWithFormat:@"💗%ld",listModel.like] forState:UIControlStateNormal];
    //换做本地音乐
//    self.musicView.songid = listModel.songid;
    self.musicView.songid = arc4random() % 2;
}

@end
