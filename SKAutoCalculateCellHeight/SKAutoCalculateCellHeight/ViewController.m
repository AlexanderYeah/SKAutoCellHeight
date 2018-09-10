//
//  ViewController.m
//  SKAutoCalculateCellHeight
//
//  Created by Alexander on 2018/9/10.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "ViewController.h"

#import "UITableView+FDTemplateLayoutCell.h"

#import "SKAutoCell.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong,nonatomic)NSMutableArray *modelArr;

@end

@implementation ViewController


- (NSMutableArray *)modelArr
{
	
	if (!_modelArr) {
		NSArray *contentArr = @[@"The aim of education should be to convert the mind into living fountain, and not a reservoir",@"若无亏欠，怎会相见。我宁愿把我们相遇都看成一种缘，也感谢我们能有所亏欠，很奇妙的一种感觉是：曾经的陌生人，突然之间成为了你的整个世界。It's an amazing feeling to realize how one person who was once just a strange..",@"每一个我，走在人生的路上，你被嘲笑的时候，其实不经意间你也嘲笑了人都是相互的，所以不要总为那所谓的优越感去相互比较了，赤裸裸来赤条条去我们都一样，还是自信的做好自已吧！！！Having a calm smile to face with being disdained indicates kind of confidence. ",@"Our deepest fear is that we are powerful beyond measur",@"出自《发现真爱》一书。现在我们的恐惧已经不是懂得太少而是知道的太多，而我们所知道的相比于未知的东西更让我们心生畏惧。我们最深的恐惧，不是我们力不能及；我们最深的恐惧，是我们的力量无边无际；让我们感到害怕的不是我们的黑暗，而是我们的光芒",@"What really makes you backward is not the difficulty in front, but the way back!!! 很多时候，成败只在瞬间。不给自己留退路，就会将自己的信心与勇敢全部集中在前进的道路上，会竭尽全力、孤注一掷地不断前行。此时，任何困难都会被你踩在脚下，任何挫折都会被甩在身后。当你历经艰辛之后会发现：原来，成功就在自己眼前,真正让你后退的，不是前面的困难，而是后面的退路。"];
		_modelArr = [NSMutableArray arrayWithArray:contentArr];
		
	}
	return _modelArr;
}



- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 40) style:UITableViewStylePlain];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	[self.view addSubview:self.tableView];
	
	
	[self.tableView registerNib:[UINib nibWithNibName:@"SKAutoCell" bundle:nil] forCellReuseIdentifier:@"CellID"];
	
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    return [tableView fd_heightForCellWithIdentifier:@"CellID" configuration:^(id cell) {
		[self configCell:cell withIdx:indexPath.row];
	}] + 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellID = @"CellID";
    SKAutoCell *Cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!Cell) {
        Cell = [[SKAutoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
	// 配置Cell
    Cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
    [self configCell:Cell withIdx:indexPath.row];
    return Cell;
}


// 配置cell的内容
- (void)configCell:(SKAutoCell *)cell withIdx:(NSInteger )idx{
	
	cell.titleLbl.text = self.modelArr[idx];
	
}
// 间隔线去除缩进
-(void)viewDidLayoutSubviews

{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
	
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }

    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}



- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
