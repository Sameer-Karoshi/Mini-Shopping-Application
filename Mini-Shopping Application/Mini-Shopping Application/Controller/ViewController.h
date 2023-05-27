//
//  ViewController.h
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 22/05/23.
//

#import <UIKit/UIKit.h>
#import "ProductViewCell.h"
#import "ProductViewModel.h"
#import "NSArray+Sorting.h"

@interface ViewController : UIViewController

@property (strong,nonatomic) UITableView *productTableView;
@property (strong, nonatomic) UIButton *sortByPriceButton;
@property (strong, nonatomic) UIButton *sortByCategoryButton;
@property (strong, nonatomic) ProductViewModel* productViewModel;
@property (strong, nonatomic, readwrite) NSMutableArray<Product *> *products;

@end

