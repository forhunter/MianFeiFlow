//
//  AboutUs.m
//  TJiphone
//
//  Created by keyrun on 13-10-8.
//  Copyright (c) 2013年 keyrun. All rights reserved.
//

#import "AboutUs.h"
#import "MScrollVIew.h"
#import "StatusBar.h"
#import "HeadToolBar.h"
#import "NewUserTableCell.h"

@interface AboutUs ()
{
    MScrollVIew* ms;
}
@end

@implementation AboutUs

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

    
    array=[[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"官网:  www.mianfei6.cn"],[NSString stringWithFormat:@"联系QQ:  2316740036"] ,nil];
    
    
    HeadToolBar *headBar =[[HeadToolBar alloc] initWithTitle:@"关于我们" leftBtnTitle:@"返回" leftBtnImg:GetImage(@"back") leftBtnHighlightedImg:GetImage(@"") rightLabTitle:nil backgroundColor:kBlueTextColor];
    headBar.leftBtn.tag =1;
    [headBar.leftBtn addTarget:self action:@selector(onClickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headBar];
 
    
    ms=[[MScrollVIew alloc]initWithFrame:CGRectMake(0, headBar.frame.origin.y+headBar.frame.size.height, kmainScreenWidth, kmainScreenHeigh) andWithPageCount:1 backgroundImg:nil];
    [ms setContentSize:CGSizeMake(kmainScreenWidth, ms.frame.size.height+1) ];
    ms.bounces =YES;
    self.view.backgroundColor = ColorRGB(239.0, 244.0, 244.0, 1.0);
    [self.view addSubview:ms];
    [self initViewContent];
}
/*
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
-(void)viewDidDisappear:(BOOL)animated{
    if (IOS_Version >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.delegate =nil;
    }
}
 */
-(void)initViewContent{
    UIImageView* gameIco=[[UIImageView alloc]init];
    gameIco.image=[UIImage imageNamed:@"applogo"];

    gameIco.frame =CGRectMake((kmainScreenWidth -gameIco.image.size.width)/2, 33, gameIco.image.size.width, gameIco.image.size.height);
    [ms addSubview:gameIco];
   
    UILabel* gameVersion=[[UILabel alloc]initWithFrame:CGRectMake(0, gameIco.frame.origin.y +gameIco.frame.size.height +kOffX_2_0, kmainScreenWidth, 14)];
    NSString* version = [[[NSBundle mainBundle]infoDictionary]objectForKey:(NSString* )kCFBundleVersionKey];
    gameVersion.text=[NSString stringWithFormat:@"版本号：%@",version];
    gameVersion.backgroundColor=[UIColor clearColor];
    gameVersion.textAlignment =NSTextAlignmentCenter;
    gameVersion.font=[UIFont systemFontOfSize:11.0];
    gameVersion.textColor=KGrayColor2_0;
    [ms addSubview:gameVersion];
    
    UITableView *aboutTab =[[UITableView alloc] initWithFrame:CGRectMake(0, gameVersion.frame.origin.y +gameVersion.frame.size.height + 3*kOffX_2_0, kmainScreenWidth, ms.frame.size.height)];
    aboutTab.dataSource =self;
    aboutTab.delegate =self;
    aboutTab.backgroundColor =[UIColor clearColor];
    aboutTab.separatorStyle =UITableViewCellSeparatorStyleNone;
//    aboutTab.sectionIndexBackgroundColor =kBlockBackground2_0;
    [ms addSubview:aboutTab];

    [self loadSperateLineWithFrame:CGRectMake(0, aboutTab.frame.origin.y -LineWidth, kmainScreenWidth , LineWidth)];
    
/*
    CellView* topview=[[CellView alloc]initWithFrame:CGRectMake(0,206, 320, kCellHeight)];
    [topview setCellViewByType:1 andWithImage:nil andCellTitle:[NSString stringWithFormat:@"官网:  www.91taojin.com.cn"]];
    [topview setImageFrame:CGRectMake(0, 0, 0, 0) andTitleFrame:CGRectMake(13, kCellHeight/2 -8.0f, 240, 15)];
    [topview setButtonFrame:CGRectMake(0, -1, topview.frame.size.width, topview.frame.size.height+1)];
    [topview setTitleLabFont:14.0 andTitleColor:KBlockColor2_0];
    UIButton* topBtn=[topview.subviews objectAtIndex:0];
    topBtn.backgroundColor =[UIColor clearColor];
    topBtn.tag=2;
    [topBtn addTarget:self action:@selector(onClickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [ms addSubview:topview];
    
 
    
    CellView* bottomview=[[CellView alloc]initWithFrame:CGRectMake(0,topview.frame.origin.y+topview.frame.size.height , 320, kCellHeight)];
    [bottomview setCellViewByType:3 andWithImage:nil andCellTitle:[NSString stringWithFormat:@"商务联系QQ:  1799466715"]];
    [bottomview setImageFrame:CGRectMake(0, 0, 0, 0) andTitleFrame:CGRectMake(13, kCellHeight/2 -8.0f, 240, 15)];
    [bottomview setButtonFrame:CGRectMake(0, -1, topview.frame.size.width, topview.frame.size.height+1)];
    [bottomview setTitleLabFont:14.0 andTitleColor:KBlockColor2_0];
    UIButton* bottomBtn=[bottomview.subviews objectAtIndex:0];
    bottomBtn.tag=3;
    [bottomBtn addTarget:self action:@selector(onClickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [ms addSubview:bottomview];
*/
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID =@"settingCell";
    NewUserTableCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell =[[NewUserTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if ( indexPath.row == array.count -1) {
        cell.isBottom = YES;
    }
    cell.backgroundColor =kWitheColor;
    [cell setCellViewByType:1 andWithImage:nil andCellTitle:[array objectAtIndex:indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 52.5f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
           
            NSURL* url=[NSURL URLWithString:@"http://www.mianfei6.cn"];
            [[UIApplication sharedApplication] openURL:url];
        }
            break;
            
        case 1:
        {
            UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.persistent =YES;
            NSString* string =@"2316740036";
            if (string) {
                [pasteboard setValue:string forPasteboardType:[UIPasteboardTypeListString objectAtIndex:0]];
                [StatusBar showTipMessageWithStatus:@"QQ号复制成功" andImage:[UIImage imageNamed:@"icon_yes.png"]andTipIsBottom:YES];
            }

        }
            break;
    }
}

-(void)loadSperateLineWithFrame:(CGRect)frame{
    UIView *line =[[UIView alloc] initWithFrame:frame];
    line.backgroundColor =kLineColor2_0;
    [ms addSubview:line];
}
-(void)onClickBackBtn:(UIButton*)btn{
    switch (btn.tag) {
        case 1:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
         //访问官网
        case 2:
        {

           

        }
            break;
            //商务联系
        case 3:
        {
           

        }
            break;
    }
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end