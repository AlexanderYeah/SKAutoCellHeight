# TableViewCell 自动计算Cell 高度库

* Step1:

 将FDCell 文件夹拖入工程

* Step2:  

	导入 -->头文件
	>  #import "UITableView+FDTemplateLayoutCell.h"

* Step3:  

	自定义Cell 并且创建xib文件，xib上面的底部的View 约束要 上下左右必须有不能为空  

* Step4:  
在计算cell 高度方法中 配置cell，填充cell控件的内容 自动计算出cell 的高度

```
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    return [tableView fd_heightForCellWithIdentifier:@"CellID" configuration:^(id cell) {
		[self configCell:cell withIdx:indexPath.row];
	}] + 10;
}

```

