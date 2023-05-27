//
//  ViewController.m
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 22/05/23.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,ProductFetchDataDelegate,UITableViewDataSource>

@end

@implementation ViewController

// MARK: - Override

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.products = [[NSMutableArray alloc] init];
    self.productViewModel = [[ProductViewModel alloc] init];
    self.productViewModel.delegate = self;
    [self.productViewModel fetchProductUsingJSON];
    [self setupView];
}

// MARK: - setups

-(void)setupView {
    UINavigationBar* navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 150)];
    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:@"Mini Shopping App"];
    [navbar setItems:@[navItem]];
    [self.view addSubview:navbar];
    
    self.sortByPriceButton = [[UIButton alloc] initWithFrame: CGRectZero];
    self.sortByPriceButton.layer.cornerRadius = 10;
    [self.sortByPriceButton setTitle: @"Sort by Price" forState: UIControlStateNormal];
    [self.sortByPriceButton setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    self.sortByPriceButton.backgroundColor = [UIColor systemPinkColor];
    self.sortByPriceButton.userInteractionEnabled = true;
    [self.sortByPriceButton addTarget: self action: @selector(sortByPriceButtonTapped:) forControlEvents: UIControlEventTouchUpInside];
    self.sortByPriceButton.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview: self.sortByPriceButton];
    
    self.sortByCategoryButton = [[UIButton alloc] initWithFrame: CGRectZero];
    self.sortByCategoryButton.layer.cornerRadius = 10;
    [self.sortByCategoryButton setTitle: @"Sort by Category" forState:UIControlStateNormal];
    [self.sortByCategoryButton setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    self.sortByCategoryButton.backgroundColor = [UIColor systemBlueColor];
    self.sortByCategoryButton.userInteractionEnabled = true;
    [self.sortByCategoryButton addTarget: self action: @selector(sortByCategoryButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.sortByCategoryButton.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview: self.sortByCategoryButton];
    
    self.productTableView = [[UITableView alloc] initWithFrame: CGRectZero];
    self.productTableView.delegate = self;
    self.productTableView.dataSource = self;
    [self.productTableView registerClass: [ProductViewCell class] forCellReuseIdentifier: @"cellReuseIdentifier"];
    self.productTableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview: self.productTableView];
    
    [self setupConstraints];
}

-(void)setupConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.sortByPriceButton.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant: 25],
        [self.sortByPriceButton.topAnchor constraintEqualToAnchor: self.view.topAnchor constant: 100],
        [self.sortByPriceButton.heightAnchor constraintEqualToConstant: 50],
        [self.sortByPriceButton.widthAnchor constraintEqualToConstant: 150],
        
        [self.sortByCategoryButton.leadingAnchor constraintEqualToAnchor: self.sortByPriceButton.trailingAnchor constant: 25],
        [self.sortByCategoryButton.topAnchor constraintEqualToAnchor: self.view.topAnchor constant: 100],
        [self.sortByCategoryButton.heightAnchor constraintEqualToConstant: 50],
        [self.sortByCategoryButton.widthAnchor constraintEqualToConstant: 160],
        
        [self.productTableView.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor],
        [self.productTableView.topAnchor constraintEqualToAnchor: self.view.topAnchor constant: 170],
        [self.productTableView.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor],
        [self.productTableView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor]
    ]];
}

// MARK: - UIButton Tap Handlers

-(void) sortByPriceButtonTapped:(UIButton *) sender {
    NSArray *sortedResult = [NSArray_Sorting sortProductsByPrice: self.products];
    self.products = sortedResult.mutableCopy;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.productTableView reloadData];
    });
}

-(void) sortByCategoryButtonTapped:(UIButton *) sender {
    NSArray *sortedResult = [NSArray_Sorting sortProductsByCategory: self.products];
    self.products = sortedResult.mutableCopy;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.productTableView reloadData];
    });
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.products.count > 0) {
        return self.products.count;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductViewCell *productCell = [self.productTableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];

    if (self.products.count > 0) {
        productCell.productImageView.image = self.products[indexPath.row].productImage;
        productCell.productTitle.text = self.products[indexPath.row].productName;
        productCell.productDescription.text = self.products[indexPath.row].productDescription;
        productCell.productPrice.text = [NSString stringWithFormat: @"%@ $", self.products[indexPath.row].productPrice];
        productCell.productRating.text = [NSString stringWithFormat:@"%@", self.products[indexPath.row].productRating];
        productCell.productCategory.text = self.products[indexPath.row].productCategory;
    } else {
        productCell.productImageView.image = [UIImage imageNamed: @"LogoImage.jpeg"];
        productCell.productTitle.text = @"Product Title";
        productCell.productDescription.text = @"Product Description";
        productCell.productPrice.text = @"100$";
        productCell.productRating.text = @"5.0";
        productCell.productCategory.text = @"Phone";
    }
    return productCell;
}

// MARK: - Protocol Implementation

- (void)addProductInMutableArray:(nonnull Product *)product {
    [self.products addObject: product];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.productTableView reloadData];
    });
}
@end

